//
//  Temple.swift
//  Temple Flashcards
//
//  Created by Misha Milovidov on 10/15/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation
import UIKit

class Temple {
    
    // MARK: - Properties
    
    var name = "Aba Nigeria"
    var photo : UIImage?
    var showName = false
    
    // MARK: - Initialization
    
    init() {
        // By default this builds a Temple Card
    }
    
    init(name: String, photo: UIImage, showName: Bool) {
        self.name = name
        self.photo = photo
        self.showName = showName
    }
}
