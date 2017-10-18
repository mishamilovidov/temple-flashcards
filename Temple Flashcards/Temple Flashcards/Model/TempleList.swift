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
    
    let temples : [Temple] = [
        Temple(name: "Aba Nigeria",
               photo: #imageLiteral(resourceName: "aba_nigeria_temple_lds")),
        Temple(name: "Accra Ghana",
               photo: #imageLiteral(resourceName: "accra_ghana_temple_lds")),
        Temple(name: "Adelaide Australia",
               photo: #imageLiteral(resourceName: "adelaide_australia_temple")),
        Temple(name: "Albuquerque New Mexico",
               photo: #imageLiteral(resourceName: "albuquerque_temple_lds")),
        Temple(name: "Anchorage Alaska",
               photo: #imageLiteral(resourceName: "anchorage_alaska_temple_lds")),
        Temple(name: "Apia Samoa",
               photo: #imageLiteral(resourceName: "apia_samoa_temple_lds")),
        Temple(name: "Asunción Paraguay",
               photo: #imageLiteral(resourceName: "asuncion_paraguay_temple_lds")),
        Temple(name: "Atlanta Georgia",
               photo: #imageLiteral(resourceName: "atlanta_temple_lds")),
        Temple(name: "Baton Rouge Louisiana",
               photo: #imageLiteral(resourceName: "baton_rouge_temple_lds")),
        Temple(name: "Bern Switzerland",
               photo: #imageLiteral(resourceName: "bern_switzerland_temple_lds")),
        Temple(name: "Billings Montana",
               photo: #imageLiteral(resourceName: "billings_temple_lds")),
        Temple(name: "Birmingham Alabama",
               photo: #imageLiteral(resourceName: "brigham_city_utah_temple_dawn")),
        Temple(name: "Bismarck North Dakota",
               photo: #imageLiteral(resourceName: "bismark_north_dakota_temple")),
        Temple(name: "Bogotá Colombia",
               photo: #imageLiteral(resourceName: "bogota_colombia_temple_lds")),
        Temple(name: "Boise Idaho",
               photo: #imageLiteral(resourceName: "boise_idaho_temple_exterior")),
        Temple(name: "Boston Massachusetts",
               photo: #imageLiteral(resourceName: "boston_temple_lds")),
        Temple(name: "Bountiful Utah",
               photo: #imageLiteral(resourceName: "bountiful_temple_lds")),
        Temple(name: "Brigham City Utah",
               photo: #imageLiteral(resourceName: "brigham_city_utah_temple_dawn")),
        Temple(name: "Brisbane Australia",
               photo: #imageLiteral(resourceName: "brisbane_australia_temple_lds")),
        Temple(name: "Buenos Aires Argentina",
               photo: #imageLiteral(resourceName: "buenos_aires_argentina_temple")),
    ]
    
    // MARK: - Singleton pattern
    
    static let sharedInstance = TempleList()
    
    private init() {
        update()
    }
    
    // MARK: - Private Helpers
    
    private func update() {
        
        for temple in temples {
            templeList.append(temple)
        }
        
    }
}
