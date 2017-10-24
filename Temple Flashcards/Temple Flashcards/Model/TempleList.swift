//
//  TempleList.swift
//  Temple Flashcards
//
//  Created by Misha Milovidov on 10/17/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation

class TempleList {
    
    // MARK: - Properties
    var templeList: [Temple] = []
    var randomOrderTempleList: [Temple] = []
    
    var temples : [Temple] = [
        Temple(name: "Aba Nigeria",
               photo: #imageLiteral(resourceName: "aba_nigeria_temple_lds"),
               showName: false),
        Temple(name: "Accra Ghana",
               photo: #imageLiteral(resourceName: "accra_ghana_temple_lds"),
               showName: false),
        Temple(name: "Adelaide Australia",
               photo: #imageLiteral(resourceName: "adelaide_australia_temple"),
               showName: false),
        Temple(name: "Albuquerque New Mexico",
               photo: #imageLiteral(resourceName: "albuquerque_temple_lds"),
               showName: false),
        Temple(name: "Anchorage Alaska",
               photo: #imageLiteral(resourceName: "anchorage_alaska_temple_lds"),
               showName: false),
        Temple(name: "Apia Samoa",
               photo: #imageLiteral(resourceName: "apia_samoa_temple_lds"),
               showName: false),
        Temple(name: "Asunción Paraguay",
               photo: #imageLiteral(resourceName: "asuncion_paraguay_temple_lds"),
               showName: false),
        Temple(name: "Atlanta Georgia",
               photo: #imageLiteral(resourceName: "atlanta_temple_lds"),
               showName: false),
        Temple(name: "Baton Rouge Louisiana",
               photo: #imageLiteral(resourceName: "baton_rouge_temple_lds"),
               showName: false),
        Temple(name: "Bern Switzerland",
               photo: #imageLiteral(resourceName: "bern_switzerland_temple_lds"),
               showName: false),
        Temple(name: "Billings Montana",
               photo: #imageLiteral(resourceName: "billings_temple_lds"),
               showName: false),
        Temple(name: "Birmingham Alabama",
               photo: #imageLiteral(resourceName: "birmingham_alabama_temple_lds"),
               showName: false),
        Temple(name: "Bismarck North Dakota",
               photo: #imageLiteral(resourceName: "bismark_north_dakota_temple"),
               showName: false),
        Temple(name: "Bogotá Colombia",
               photo: #imageLiteral(resourceName: "bogota_colombia_temple_lds"),
               showName: false),
        Temple(name: "Boise Idaho",
               photo: #imageLiteral(resourceName: "boise_idaho_temple_exterior"),
               showName: false),
        Temple(name: "Boston Massachusetts",
               photo: #imageLiteral(resourceName: "boston_temple_lds"),
               showName: false),
        Temple(name: "Bountiful Utah",
               photo: #imageLiteral(resourceName: "bountiful_temple_lds"),
               showName: false),
        Temple(name: "Brigham City Utah",
               photo: #imageLiteral(resourceName: "brigham_city_utah_temple_dawn"),
               showName: false),
        Temple(name: "Brisbane Australia",
               photo: #imageLiteral(resourceName: "brisbane_australia_temple_lds"),
               showName: false),
        Temple(name: "Buenos Aires Argentina",
               photo: #imageLiteral(resourceName: "buenos_aires_argentina_temple"),
               showName: false),
    ]
    
    // MARK: - Singleton pattern
    
    static let sharedInstance = TempleList()
    
    private init() {
        update()
    }
    
    // MARK: - Private Helpers
    
    private func update() {
        
        for temple in temples.sorted(by: {$0.name < $1.name}) {
            templeList.append(temple)
        }
        
        temples.shuffle()
        
        for temple in temples {
            randomOrderTempleList.append(temple)
        }
    }
    
    // MARK: - Public Helpers
    
    public func removeTemple(templeListIndex: Int, randomOrderTempleListIndex: Int) {
        templeList.remove(at: templeListIndex)
        randomOrderTempleList.remove(at: randomOrderTempleListIndex)
    }
    
    public func resetTempleList() {
        self.templeList.removeAll()
        self.randomOrderTempleList.removeAll()
        self.update()
    }
    
}
