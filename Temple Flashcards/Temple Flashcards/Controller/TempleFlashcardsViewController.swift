//
//  TempleFlashcardsViewController.swift
//  Temple Flashcards
//
//  Created by Misha Milovidov on 10/17/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

class TempleTableViewCell : UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var templeNameLabel: UILabel!
    
}

class TempleFlashcardsViewController : UIViewController {
    
    // MARK: - Constants
    
    public struct Storyboard {
        static let TempleCardCellIdentifier     = "TempleCardCell"
        static let TempleTableCellIdentifier    = "TempleCell"
    }
    
    var templeCardCellHeight : CGFloat { return 80 }
    
    // MARK: - Properties
    
    var cardCellTempleSelected : String?
    var tableCellTempleSelected : String?
    var cardSelected : Bool?
    var cellSelected : Bool?
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardCellTempleSelected  = ""
        tableCellTempleSelected = ""
        cardSelected            = false
        cellSelected            = false
    }
}
