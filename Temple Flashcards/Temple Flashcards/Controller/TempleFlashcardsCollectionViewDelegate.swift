//
//  TempleFlashcardsCollectionViewDelegate.swift
//  Temple Flashcards
//
//  Created by Misha Milovidov on 10/20/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

extension TempleFlashcardsViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let temple = TempleList.sharedInstance.randomOrderTempleList[indexPath.row].name
        cardCellTempleSelected = temple
        cardSelected = true
        cardSelectedIndex = indexPath
        let correctMessage = "Correct! That's the \(temple) Temple."
        let incorrectMessage = "Not Quite! That's a photo of the " + cardCellTempleSelected! + " Temple."
        
        if (cardSelected == true && cellSelected == true) {
            
            if (temple == tableCellTempleSelected) {
                Scoreboard.sharedInstance.addCorrect()
                self.showToast(message: correctMessage)
                removeTemple(collection: self.templeCollectionView,
                             table: self.templeTableView,
                             templeListIndex: self.cellSelectedIndex!,
                             randomOrderTempleListIndex: self.cardSelectedIndex!)
            } else {
                Scoreboard.sharedInstance.addIncorrect()
                self.showToast(message: incorrectMessage)
            }
            
            updateTallies()
            resetDefaults()
        }
    }
}

extension TempleFlashcardsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let templeImage = TempleList.sharedInstance.templeList[indexPath.row].photo {
            
            let templeImageHeight   = templeImage.size.height
            let templeImageWidth    = templeImage.size.width / (templeImageHeight / templeCardCellHeight)
            
            return CGSize(width: templeImageWidth, height: templeCardCellHeight)
            
        } else {
            
            return CGSize.zero
            
        }
    }
}
