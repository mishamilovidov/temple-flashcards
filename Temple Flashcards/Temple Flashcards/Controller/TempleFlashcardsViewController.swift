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
    
    enum Mode {
        case match
        case study
    }
    
    public struct Storyboard {
        static let TempleCardCellIdentifier     = "TempleCardCell"
        static let TempleTableCellIdentifier    = "TempleCell"
        static let MatchModeButtonTitle         = "Match Mode"
        static let StudyModeButtonTitle         = "Study Mode"
        static let PinkAccentColor              = UIColor.init(red: 234.0, green: 208.0, blue: 213.0, alpha: 1.0)
    }
    
    var templeCardCellHeight            : CGFloat { return 80 }
    var matchModeViewsContainerWidth    : CGFloat { return 242 }
    var matchTallyViewsContainerWidth   : CGFloat { return 40 }
    
    // MARK: - Properties
    
    var cardCellTempleSelected : String?
    var tableCellTempleSelected : String?
    var cardSelected : Bool?
    var cellSelected : Bool?
    var cardSelectedIndex : IndexPath?
    var cellSelectedIndex : IndexPath?
    var mode : Mode?
    
    // MARK: - Outlets
    
    @IBOutlet weak var templeCollectionView: UICollectionView!
    @IBOutlet weak var templeTableView: UITableView!
    @IBOutlet weak var correctCount: UILabel!
    @IBOutlet weak var incorrectCount: UILabel!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var modeButton: UIBarButtonItem!
    @IBOutlet weak var matchModeViews: UIView!
    @IBOutlet weak var matchTallyView: UIView!
    @IBOutlet weak var matchModeViewWidth: NSLayoutConstraint!
    @IBOutlet weak var matchTallyViewHeight: NSLayoutConstraint!
    @IBOutlet weak var matchTallyLabels: UIStackView!
    
    // MARK: - Actions
    
    @IBAction func resetFlashcards(_ sender: Any) {
        resetFlashcardGame()
    }
    
    @IBAction func changeMode(_ sender: Any) {
        
        templeCollectionView.layoutIfNeeded()
        
        if matchModeViewWidth.constant == matchModeViewsContainerWidth {
            matchModeViewWidth.constant = 0
            matchTallyViewHeight.constant = 0
            matchTallyView.isHidden = true
            resetButton.isEnabled = false
            resetFlashcardGame()
            modeButton.title = Storyboard.MatchModeButtonTitle
            mode = Mode.study
        } else {
            matchModeViewWidth.constant = matchModeViewsContainerWidth
            matchTallyViewHeight.constant = matchTallyViewsContainerWidth
            matchTallyView.isHidden = false
            resetButton.isEnabled = true
            modeButton.title = Storyboard.StudyModeButtonTitle
            mode = Mode.match
        }
        
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [.curveEaseInOut],
                       animations: {
                            self.templeCollectionView.reloadData()
                            self.view.layoutIfNeeded()},
                       completion: nil)
        
    }
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if mode == nil {
            mode = Mode.match
        }
        
        let inset = UIEdgeInsetsMake(0, 0, 50, 0)
        templeTableView.contentInset = inset
        templeCollectionView.contentInset = inset
        templeCollectionView.allowsMultipleSelection = false
        
        setDefaults()
        updateTallies()
    }
    
    // MARK: - Helpers
    
    func checkMatch(cardCellTempleSelected: String, tableCellTempleSelected: String, cardSelected: Bool, cellSelected: Bool, cardSelectedIndex: IndexPath, cellSelectedIndex: IndexPath) {
        
        if (cardSelected == true && cellSelected == true) {
            
            let correctMessage = "Correct! That's the \(cardCellTempleSelected) Temple."
            let incorrectMessage = "Not quite! That's a photo of the " + cardCellTempleSelected + " Temple."
            
            if (cardCellTempleSelected == tableCellTempleSelected) {
                Scoreboard.sharedInstance.addCorrect()
                self.showToast(message: correctMessage)
                removeTemple(collection: self.templeCollectionView,
                             table: self.templeTableView,
                             templeListIndex: self.cellSelectedIndex!,
                             randomOrderTempleListIndex: self.cardSelectedIndex!)
                resetDefaults()
            } else {
                Scoreboard.sharedInstance.addIncorrect()
                self.showToast(message: incorrectMessage)
            }
            
            updateTallies()
        }
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
    
    func resetDefaults() {
        cardCellTempleSelected  = ""
        tableCellTempleSelected = ""
        cardSelected            = false
        cellSelected            = false
    }
    
    func resetFlashcardGame() {
        let selectedItems = templeCollectionView.indexPathsForSelectedItems
        for indexPath in selectedItems! {
            templeCollectionView.deselectItem(at: indexPath, animated:true)
        }
        
        TempleList.sharedInstance.resetTempleList()
        Scoreboard.sharedInstance.resetScoreboard()
        
        viewDidLoad()
        
        templeCollectionView.reloadData()
        templeTableView.reloadData()
    }
    
    private func setDefaults() {
        cardCellTempleSelected  = ""
        tableCellTempleSelected = ""
        cardSelected            = false
        cellSelected            = false
        cardSelectedIndex       = IndexPath(arrayLiteral: 0)
        cellSelectedIndex       = IndexPath(arrayLiteral: 0)
    }
    
    func updateTallies() {
        correctCount.text = "\(Scoreboard.sharedInstance.correct)"
        incorrectCount.text = "\(Scoreboard.sharedInstance.incorrect)"
    }
}
