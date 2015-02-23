//
//  Proximity.swift
//  UWFNursing
//
//  Created by sadmin on 2/23/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

import Foundation
import CoreData

@objc class Proximity: NSManagedObject {

    @NSManaged var timestamp: NSDate
    @NSManaged var proximity: NSNumber
    @NSManaged var beaconid: String

}
