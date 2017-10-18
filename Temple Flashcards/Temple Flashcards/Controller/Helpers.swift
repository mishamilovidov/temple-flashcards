//
//  Helpers.swift
//  Temple Flashcards
//
//  Created by Misha Milovidov on 10/18/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation
import UIKit

class Helpers {
    
    static func applyFormatToImageView(image: UIImageView) {
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
    }
}
