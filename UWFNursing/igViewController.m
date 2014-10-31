//
//  igViewController.m
//  ScanBarCodes
//
//  Created by Torrey Betts on 10/10/13.
//  Copyright (c) 2013 Infragistics. All rights reserved.
//
@import AVFoundation;

#import "igViewController.h"

@interface igViewController () <AVCaptureMetadataOutputObjectsDelegate>
{
    AVCaptureSession *_session;
    AVCaptureDevice *_device;
    AVCaptureDeviceInput *_input;
    AVCaptureMetadataOutput *_output;
    AVCaptureVideoPreviewLayer *_prevLayer;

    UIView *_highlightView;
    UILabel *_barcodeLabel;
    UILabel *_dobLabel;
    UILabel *_nameLabel;
    UILabel *_mrLabel;
    UILabel *_nkaLabel;
    
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
    _barcodeLabel.frame = CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40);
    _barcodeLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _barcodeLabel.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    _barcodeLabel.textColor = [UIColor whiteColor];
    _barcodeLabel.textAlignment = NSTextAlignmentCenter;
    _barcodeLabel.text = @"(none)";
    [self.view addSubview:_barcodeLabel];
    
    
    _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_startButton setBackgroundColor:[UIColor grayColor]];
    [_startButton setTitle:@"Start" forState:UIControlStateNormal];
    _startButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
    _startButton.frame = CGRectMake(0, CGRectGetHeight(self.navigationController.navigationBar.frame) + 20, CGRectGetWidth(self.view.frame), 50);
    _startButton.tintColor = [UIColor whiteColor];
    [self.view addSubview:_startButton];

    [_startButton addTarget:self action:@selector(sessionAction) forControlEvents:UIControlEventTouchUpInside];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.frame = CGRectMake(0, CGRectGetMaxY(_startButton.frame)+2, self.view.bounds.size.width, 40);
    _nameLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
    _nameLabel.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.textAlignment = NSTextAlignmentLeft;

    [self.view addSubview:_nameLabel];
    
    _dobLabel = [[UILabel alloc] init];
    _dobLabel.frame = CGRectMake(0, CGRectGetMaxY(_nameLabel.frame), self.view.bounds.size.width, 40);
    _dobLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
    _dobLabel.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    _dobLabel.textColor = [UIColor whiteColor];
    _dobLabel.textAlignment = NSTextAlignmentLeft;

    [self.view addSubview:_dobLabel];
    _mrLabel = [[UILabel alloc] init];
    _mrLabel.frame = CGRectMake(0, CGRectGetMaxY(_dobLabel.frame), self.view.bounds.size.width, 40);
    _mrLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
    _mrLabel.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    _mrLabel.textColor = [UIColor whiteColor];
    _mrLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_mrLabel];
    
    _nkaLabel = [[UILabel alloc] init];
    _nkaLabel.text = @"NKA";
    _nkaLabel.frame = CGRectMake(0, CGRectGetMaxY(_mrLabel.frame), self.view.bounds.size.width, 40);
    _nkaLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
    _nkaLabel.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    _nkaLabel.textColor = [UIColor whiteColor];
    _nkaLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_nkaLabel];
    
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
    
    _dobLabel.text = @"";
    _nameLabel.text = @"";
    _mrLabel.text= @"";
    
    [self.view sendSubviewToBack:_dobLabel];
    [self.view sendSubviewToBack:_nameLabel];
    [self.view sendSubviewToBack:_mrLabel];
    [self.view sendSubviewToBack:_nkaLabel];
    
    if(_session.isRunning){
        [_session stopRunning ];
        [_startButton setTitle:@"Start Scanning" forState:UIControlStateNormal];
    }
    else{
        [_startButton setTitle:@"Stop Scanning" forState:UIControlStateNormal];
        [self.view bringSubviewToFront:_startButton];
        [self.view bringSubviewToFront:_highlightView];
        [self.view bringSubviewToFront:_barcodeLabel];

        [_session startRunning];
    }
    
    
}

-(void)processBarCode:(NSString *)barcode{
    long long nr  = barcode.longLongValue;
    
    #warning probably other class should be responsible for processing the barcode, perhaps ATCState? Plus it should redirect user to appropriate Patients View Controller
    
    
    if(nr == 36000291452){//id 1
        _dobLabel.text = @"DOB: 3/11/xx";
        _nameLabel.text = [@"Name: Skyler Hansen" uppercaseString] ;
        
        _mrLabel.text = @"MR# PCS31100";
        
    }
    else if(nr==123456789012){//id 2
        _dobLabel.text = @"DOB: 3/11/xx";
        _nameLabel.text = [@"Name: Skyler Jansen"uppercaseString];
        _mrLabel.text = @"MR# PCS33300";
        
    }
    else if(nr==5012345678900){//id 3
        _dobLabel.text = @"DOB: 1/1/xx";
        _nameLabel.text = [@"Name: Jennie Jones"uppercaseString];
        _mrLabel.text = @"MR# J123";
        
    }
    else if(nr==9771234567003){//id 4
        _dobLabel.text = @"DOB: 1/1/xx";
        _nameLabel.text = [@"Name: Joy Jackson"uppercaseString];
        _mrLabel.text = @"MR# JJ1";
        
    }
    else if(nr==1234567890128){//id 5
        _dobLabel.text = @"DOB: 5 days ago";
        _nameLabel.text = [@"Name: Jones, BABY BOY"uppercaseString];
        _mrLabel.text = @"MR# MJ1";
    }
    else if(nr==671860013624){// id 6
        _dobLabel.text = @"DOB: 5 days ago";
        
        _nameLabel.text = [@"Name: JAMES, BABY BOY"uppercaseString];
        _mrLabel.text = @"MR# KJ1";
    }
    else if(nr==1){
        _nameLabel.text =@"Thank you for identification.";
        #warning change it!
    }
    else{
        _nameLabel.text =@"Patient Not Recognized";
    }

    [self.view bringSubviewToFront:_dobLabel];
    [self.view bringSubviewToFront:_nameLabel];
    [self.view bringSubviewToFront:_nkaLabel];
    [self.view bringSubviewToFront:_mrLabel];
    
    
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
        //       else
           // _barcodeLabel.text = @"(none)";
    }
    
    _highlightView.frame = highlightViewRect;
}

@end