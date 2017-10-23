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
    var cardSelectedIndex : IndexPath?
    var cellSelectedIndex : IndexPath?
    
    // MARK: - Outlets
    
    @IBOutlet weak var templeCollectionView: UICollectionView!
    @IBOutlet weak var templeTableView: UITableView!
    @IBOutlet weak var correctCount: UILabel!
    @IBOutlet weak var incorrectCount: UILabel!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    // MARK: - Actions
    
    @IBAction func resetFlashcards(_ sender: Any) {
        TempleList.sharedInstance.resetTempleList()
        Scoreboard.sharedInstance.resetScoreboard()
        
        viewDidLoad()
        
        templeCollectionView.reloadData()
        templeTableView.reloadData()
    }
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaults()
        updateTallies()
    }
    
    // MARK: - Helpers
    
    private func setDefaults() {
        cardCellTempleSelected  = ""
        tableCellTempleSelected = ""
        cardSelected            = false
        cellSelected            = false
        cardSelectedIndex       = nil
        cellSelectedIndex       = nil
    }
    
    func resetDefaults() {
        cardCellTempleSelected  = ""
        tableCellTempleSelected = ""
        cardSelected            = false
        cellSelected            = false
    }
    
    func updateTallies() {
        correctCount.text = "\(Scoreboard.sharedInstance.correct)"
        incorrectCount.text = "\(Scoreboard.sharedInstance.incorrect)"
    }
    
    func removeTemple(collection: UICollectionView, table: UITableView, templeListIndex: IndexPath, randomOrderTempleListIndex: IndexPath) {
        
        let templeListRow               = templeListIndex.row
        let randomOrderTempleListRow    = randomOrderTempleListIndex.row
        
        table.beginUpdates()
        TempleList.sharedInstance.removeTemple(templeListIndex: templeListRow, randomOrderTempleListIndex: randomOrderTempleListRow)
        collection.deleteItems(at: [randomOrderTempleListIndex])
        table.deleteRows(at: [templeListIndex], with: .automatic)
        table.endUpdates()
    }
}
