//
//  Employee+CoreDataProperties.swift
//  TEMP_COREDATA
//
//  Created by iFlame on 6/29/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var salary: Double
    @NSManaged public var lastname: String?

}
