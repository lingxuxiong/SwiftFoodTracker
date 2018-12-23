//
//  Meal.swift
//  foodtracker
//
//  Created by Neil Ling on 2018/12/22.
//  Copyright © 2018 Neil Ling. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
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
}
