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
        
        let correctAlert = UIAlertController(
            title: "Correct!",
            message: "That's the \(temple) Temple",
            preferredStyle: .alert)
        let incorrectAlert = UIAlertController(
            title: "Not Quite!",
            message: "That's he \(temple) Temple, not the  " + tableCellTempleSelected! + " Temple",
            preferredStyle: .alert)
        let defaultAction = UIAlertAction(
            title: "Continue",
            style: .default,
            handler: {action in self.removeTemple(
                            collection: self.templeCollectionView,
                            table: self.templeTableView,
                            templeListIndex: self.cellSelectedIndex!,
                            randomOrderTempleListIndex: self.cardSelectedIndex!)})
        
        if (cardSelected == true && cellSelected == true) {
            
            if (temple == tableCellTempleSelected) {
                Scoreboard.sharedInstance.addCorrect()
                correctAlert.addAction(defaultAction)
                present(correctAlert, animated: true, completion: nil)
            } else {
                Scoreboard.sharedInstance.addIncorrect()
                incorrectAlert.addAction(defaultAction)
                present(incorrectAlert, animated: true, completion: nil)
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