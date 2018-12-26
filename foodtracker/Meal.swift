//
//  Meal.swift
//  foodtracker
//
//  Created by Neil Ling on 2018/12/22.
//  Copyright © 2018 Neil Ling. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    // MARK: properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Arching paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
    static let ArchiveURL = DocumentsDirectory?.appendingPathComponent("meals")
    
    // MARK: Types
    struct PropertyKey {
        static let name = "Name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    // MARK: initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    // The convenience modifier means that this is a secondary initializer,
    // and that it must call a designated initializer from the same class.
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to device meal name.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // photo is optional, so just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        // no need to downcast to Int and there is no optional to unwrap?
        let rating = aDecoder.decodeObject(forKey: PropertyKey.rating) as? Int
        
        // must call designated initializer.
        self.init(name: name, photo: photo, rating: rating ?? 0)
    }
}
