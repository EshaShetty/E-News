//
//  Article+CoreDataProperties.swift
//  E-News
//
//  Created by Esha Shetty on 2020-06-27.
//  Copyright © 2020 Esha Shetty. All rights reserved.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var image: Data?
    @NSManaged public var source: String?

}
