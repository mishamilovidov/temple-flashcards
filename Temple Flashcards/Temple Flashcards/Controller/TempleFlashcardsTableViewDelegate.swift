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
        
        tableCellTempleSelected = TempleList.sharedInstance.templeList[indexPath.row].name
        cellSelected = true
        cellSelectedIndex = indexPath
        
        checkMatch(cardCellTempleSelected: cardCellTempleSelected!, tableCellTempleSelected: tableCellTempleSelected!, cardSelected: cardSelected!, cellSelected: cellSelected!, cardSelectedIndex: cardSelectedIndex!, cellSelectedIndex: cellSelectedIndex!)
    }
}
