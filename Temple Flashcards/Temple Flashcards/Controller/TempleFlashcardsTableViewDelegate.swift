//
//  TempleFlashcardsTableViewDelegate.swift
//  Temple Flashcards
//
//  Created by Misha Milovidov on 10/20/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

extension TempleFlashcardsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let temple = TempleList.sharedInstance.templeList[indexPath.row].name
        tableCellTempleSelected = temple
        cellSelected = true
        cellSelectedIndex = indexPath
        
        let correctAlert = UIAlertController(
            title: "Correct!",
            message: "That's the \(temple) Temple",
            preferredStyle: .alert)
        let incorrectAlert = UIAlertController(
            title: "Not Quite!",
            message: "That's not the \(temple) Temple; that's a photo of the " + cardCellTempleSelected! + " Temple",
            preferredStyle: .alert)
        let correctAction = UIAlertAction(
            title: "Continue",
            style: .default,
            handler: {action in self.removeTemple(
                        collection: self.templeCollectionView,
                        table: self.templeTableView,
                        templeListIndex: self.cellSelectedIndex!,
                        randomOrderTempleListIndex: self.cardSelectedIndex!)})
        let defaultAction = UIAlertAction(
            title: "Continue",
            style: .default,
            handler: nil)
        
        if (cardSelected == true && cellSelected == true) {
            
            if (temple == cardCellTempleSelected) {
                correctAlert.addAction(correctAction)
                present(correctAlert, animated: true, completion: nil)
            } else {
                incorrectAlert.addAction(defaultAction)
                present(incorrectAlert, animated: true, completion: nil)
            }
            
            resetDefaults()
        }
    }
}
