//
//  Proximity.swift
//  UWFNursing
//
//  Created by Janusz Chudzynski on 2/23/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

import Foundation
import CoreData
@objc(Proximity)

class Proximity: NSManagedObject {

    @NSManaged var beaconid: String
    @NSManaged var proximity: NSNumber
    @NSManaged var timestamp: NSDate

}
