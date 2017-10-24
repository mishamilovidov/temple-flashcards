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
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.alpha = 0.3
        
        cardCellTempleSelected = TempleList.sharedInstance.randomOrderTempleList[indexPath.row].name
        cardSelected = true
        cardSelectedIndex = indexPath
        
        checkMatch(cardCellTempleSelected: cardCellTempleSelected!, tableCellTempleSelected: tableCellTempleSelected!, cardSelected: cardSelected!, cellSelected: cellSelected!, cardSelectedIndex: cardSelectedIndex!, cellSelectedIndex: cellSelectedIndex!)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = UIColor.white.cgColor
        cell?.alpha = 1.0
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
