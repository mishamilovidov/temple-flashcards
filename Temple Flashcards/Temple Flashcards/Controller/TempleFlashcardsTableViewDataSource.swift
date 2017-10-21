//
//  TempleFlashcardsTableViewDataSource.swift
//  Temple Flashcards
//
//  Created by Misha Milovidov on 10/20/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

extension TempleFlashcardsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TempleList.sharedInstance.templeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.TempleTableCellIdentifier, for: indexPath) as! TempleTableViewCell
        let templeName = TempleList.sharedInstance.templeList[indexPath.row].name
        
        cell.templeNameLabel?.text = templeName
        
        return cell
    }
}
