//
//  igViewController.m
//  ScanBarCodes
//
//  Created by Torrey Betts on 10/10/13.
//  Copyright (c) 2013 Infragistics. All rights reserved.
//
@import AVFoundation;

#import "igViewController.h"
#import "ATCAppDelegate.h"
#import "ATCBeaconContentManager.h"
#import "ATCPatient.h"

@interface igViewController () <AVCaptureMetadataOutputObjectsDelegate>
{
    AVCaptureSession *_session;
    AVCaptureDevice *_device;
    AVCaptureDeviceInput *_input;
    AVCaptureMetadataOutput *_output;
    AVCaptureVideoPreviewLayer *_prevLayer;

    UIView *_highlightView;
    UILabel *_barcodeLabel;
	UILabel *_textLabel;
   // UILabel *_dobLabel;
   //  UILabel *_nameLabel;
   // UILabel *_mrLabel;
   // UILabel *_nkaLabel;
    
    UIButton *_startButton;
}
@end

@implementation igViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _highlightView = [[UIView alloc] init];
    _highlightView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    _highlightView.layer.borderColor = [UIColor greenColor].CGColor;
    _highlightView.layer.borderWidth = 3;
    [self.view addSubview:_highlightView];

    _barcodeLabel = [[UILabel alloc] init];
    _barcodeLabel.frame = CGRectMake(0, self.view.bounds.size.height - 30, self.view.bounds.size.width, 30);
    _barcodeLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _barcodeLabel.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    _barcodeLabel.textColor = [UIColor whiteColor];
    _barcodeLabel.textAlignment = NSTextAlignmentCenter;
    _barcodeLabel.text = @"(none)";
	_barcodeLabel.numberOfLines = 20;
    [self.view addSubview:_barcodeLabel];
    
    
    _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_startButton setBackgroundColor:[UIColor grayColor]];
    [_startButton setTitle:@"Start" forState:UIControlStateNormal];
    _startButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
    _startButton.frame = CGRectMake(0, CGRectGetHeight(self.navigationController.navigationBar.frame) + 20, CGRectGetWidth(self.view.frame), 50);
    _startButton.tintColor = [UIColor whiteColor];
    [self.view addSubview:_startButton];

    [_startButton addTarget:self action:@selector(sessionAction) forControlEvents:UIControlEventTouchUpInside];
    
	    _textLabel = [[UILabel alloc] init];
	    _textLabel.frame = CGRectMake(0, CGRectGetMaxY(_startButton.frame)+2, self.view.bounds.size.width, 250);
	    _textLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
	    _textLabel.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
	    _textLabel.textColor = [UIColor whiteColor];
	    _textLabel.textAlignment = NSTextAlignmentLeft;
		_textLabel.numberOfLines = 20;
	
	[self.view addSubview:_textLabel];

	
    _session = [[AVCaptureSession alloc] init];
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;

    _input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:&error];
    if (_input) {
        [_session addInput:_input];
    } else {
        NSLog(@"Error: %@", error);
    }

    _output = [[AVCaptureMetadataOutput alloc] init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [_session addOutput:_output];

    _output.metadataObjectTypes = [_output availableMetadataObjectTypes];

    _prevLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    _prevLayer.frame = self.view.bounds;
    _prevLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:_prevLayer];
    //activate session
    [self sessionAction];
    
}

-(void)sessionAction{
    

	[self.view bringSubviewToFront:_startButton];
	
	if(_session.isRunning){
        [_session stopRunning ];
        [_startButton setTitle:@"Start Scanning" forState:UIControlStateNormal];
		[self.view bringSubviewToFront:_highlightView];
		[self.view bringSubviewToFront:_barcodeLabel];
		[self.view bringSubviewToFront:_textLabel];

	}
    else{
        [_startButton setTitle:@"Stop Scanning" forState:UIControlStateNormal];
		[self.view sendSubviewToBack:_textLabel];
		[self.view sendSubviewToBack:_barcodeLabel];
		[self.view sendSubviewToBack:_highlightView];
		
		[_session startRunning];
    }
    
    
}

-(void)processBarCode:(NSString *)barcode{
		[ATCBeaconContentManager getBarcodeData:barcode handler:^(NSString *text, NSString *cerror) {
			[self.view bringSubviewToFront:_highlightView];
			[self.view bringSubviewToFront:_barcodeLabel];
			[self.view bringSubviewToFront:_textLabel];
			
			if(cerror){
				_textLabel.text = cerror;
			}else{
				
				_textLabel.text = text;
			}
		}];
	
    [[NSNotificationCenter defaultCenter]postNotificationName:@"BARCODE_SCAN" object:nil userInfo:@{@"barcode":barcode}];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    CGRect highlightViewRect = CGRectZero;
    AVMetadataMachineReadableCodeObject *barCodeObject;
    NSString *detectionString = nil;
    NSArray *barCodeTypes = @[AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code,
            AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code,
            AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode];

    for (AVMetadataObject *metadata in metadataObjects) {
        for (NSString *type in barCodeTypes) {
            if ([metadata.type isEqualToString:type])
            {
                barCodeObject = (AVMetadataMachineReadableCodeObject *)[_prevLayer transformedMetadataObjectForMetadataObject:(AVMetadataMachineReadableCodeObject *)metadata];
                highlightViewRect = barCodeObject.bounds;
                detectionString = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
                break;
            }
        }

        if (detectionString != nil)
        {
            _barcodeLabel.text = detectionString;
            [self processBarCode:detectionString];

            [_startButton setTitle:@"Start Scanning" forState:UIControlStateNormal];
            [_session stopRunning];
            
            break;
        }
    }
    
    _highlightView.frame = highlightViewRect;
}

@end