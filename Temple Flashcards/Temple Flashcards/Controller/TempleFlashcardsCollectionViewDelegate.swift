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
        
        cardCellTempleSelected = TempleList.sharedInstance.randomOrderTempleList[indexPath.row].name
        cardSelected = true
        cardSelectedIndex = indexPath
        
        checkMatch(cardCellTempleSelected: cardCellTempleSelected!, tableCellTempleSelected: tableCellTempleSelected!, cardSelected: cardSelected!, cellSelected: cellSelected!, cardSelectedIndex: cardSelectedIndex!, cellSelectedIndex: cellSelectedIndex!)
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
