//
//  Proximity.swift
//  UWFNursing
//
//  Created by Janusz Chudzynski on 2/20/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

import Foundation
import CoreData

class Proximity: NSManagedObject {

    @NSManaged var timestamp: NSDate
    @NSManaged var proximity: NSNumber
    @NSManaged var beaconid: String

}
