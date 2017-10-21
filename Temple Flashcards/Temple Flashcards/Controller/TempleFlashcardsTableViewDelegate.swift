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
            handler: {action in self.removeTempleFromTable(
                        table: self.templeTableView,
                        temple: TempleList.sharedInstance.templeList[indexPath.row],
                        indexPath: indexPath)})
        let defaultAction = UIAlertAction(
            title: "Continue",
            style: .default,
            handler: nil)
        
        cellSelected = true
        
        if (cardSelected == true && cellSelected == true) {
            
            if (temple == cardCellTempleSelected) {
                correctAlert.addAction(correctAction)
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
