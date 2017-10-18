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
    
    private struct Storyboard {
        static let TempleCardCellIdentifier = "TempleCardCell"
        static let TempleTableCellIdentifier = "TempleCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TempleFlashcardsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TempleList.sharedInstance.templeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.TempleCardCellIdentifier, for: indexPath)
        let templeCard = TempleList.sharedInstance.templeList[indexPath.row]
        
        if let templeCardCell = cell as? TempleCardCell {
            templeCardCell.templeCardView.templeCard = templeCard
            templeCardCell.templeCardView.setNeedsDisplay()
        }
        
        return cell
    }
    
}

extension TempleFlashcardsViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension TempleFlashcardsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TempleList.sharedInstance.templeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.TempleTableCellIdentifier, for: indexPath) as! TempleTableViewCell
        let templeName = TempleList.sharedInstance.templeList[indexPath.row].name
        
        cell.templeNameLabel?.text = templeName
        
        return cell
    }
}

extension TempleFlashcardsViewController : UITableViewDelegate {
    
}
