//
//  TempleFlashcardsCollectionViewDataSource.swift
//  Temple Flashcards
//
//  Created by Misha Milovidov on 10/20/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

extension TempleFlashcardsViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TempleList.sharedInstance.templeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.TempleCardCellIdentifier, for: indexPath)
        
        if mode == Mode.study {
            cell.isUserInteractionEnabled = false
        } else {
            cell.isUserInteractionEnabled = true
        }
        
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        let templeCard = TempleList.sharedInstance.randomOrderTempleList[indexPath.row]
        
        if let templeCardCell = cell as? TempleCardCell {
            templeCardCell.templeCardView.templeCard = templeCard
            templeCardCell.templeCardView.setNeedsDisplay()
        }
        
        return cell
    }
    
}
