//
//  TempleCardView.swift
//  Temple Flashcards
//
//  Created by Misha Milovidov on 10/18/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

@IBDesignable
class TempleCardView : UIView {
    
    // MARK: - Properties
    
    var templeCard = Temple()
    
    // MARK: - Computed Properties
    
    var centerImageMargin    : CGFloat { return bounds.width * 0.15 }
    var cornerImageWidth     : CGFloat { return bounds.width * 0.18 }
    var cornerRadius         : CGFloat { return bounds.width * 0.05 }
    
    // MARK: - Initialization
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor.clear
        isOpaque = false
    }
    
    // MARK: - Drawing
    
    override func draw(_ rect: CGRect) {
        drawTempleCard()
    }
    
    private func drawTempleCard() {
        templeCard.photo.scaled(to: bounds.size, scalingMode: .aspectFill).draw(in: bounds)
    }
    
}
