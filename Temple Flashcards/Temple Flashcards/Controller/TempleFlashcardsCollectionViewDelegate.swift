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
            handler: nil)
        
        cardSelected = true
        
        if (cardSelected == true && cellSelected == true) {
            
            if (temple == tableCellTempleSelected) {
                correctAlert.addAction(defaultAction)
                present(correctAlert, animated: true, completion: nil)
            } else {
                incorrectAlert.addAction(defaultAction)
                present(incorrectAlert, animated: true, completion: nil)
            }
            
            cardCellTempleSelected = ""
            cardCellTempleSelected = ""
            cardSelected = false
            cellSelected = false
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
