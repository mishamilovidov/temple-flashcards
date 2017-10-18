//
//  TempleFlashcardsViewController.swift
//  Temple Flashcards
//
//  Created by Misha Milovidov on 10/17/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

class TempleFlashcardsViewController : UIViewController {
    
    // MARK: - Constants
    
    private struct Storyboard {
        static let TempleCardCellIdentifier = "TempleCardCell"
    }
    
}

extension TempleFlashcardsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TempleList.sharedInstance.templeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.TempleCardCellIdentifier, for: indexPath)
        let card = TempleList.sharedInstance.templeList[indexPath.row]
        
//        if let templeCardCell = cell as? TempleCardCell {
//            templeCardCell.rookCardView.card = card
//            templeCardCell.rookCardView.setNeedsDisplay()
//        }
        
        return cell
    }
    
}

extension TempleFlashcardsViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
