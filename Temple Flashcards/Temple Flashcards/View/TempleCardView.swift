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
    var fontSize: CGFloat { return bounds.width * 0.08}
    var fontName = "Palatino"
    var backgroundAlpha: CGFloat { return 0.5 }
    
    // MARK: - Computed Properties
    
    @IBInspectable var showName: Bool {
        get {
            return templeCard.showName
        }
        set {
            templeCard.showName = newValue
        }
    }
    
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
        if showName {
            drawTempleCardWithName()
        } else {
            drawTempleCard()
        }
    }
    
    private func drawTempleCard() {
        templeCard.photo?.scaled(to: bounds.size, scalingMode: .aspectFill).draw(in: bounds)
    }
    
    private func drawTempleCardWithName() {
        templeCard.photo?.scaled(to: bounds.size, scalingMode: .aspectFill).draw(in: bounds)
        
        guard let font = UIFont(name: fontName, size: fontSize) else {
            return
        }
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        let nameText = NSAttributedString(string: templeCard.name, attributes: [
            .font : font,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.black.withAlphaComponent(backgroundAlpha),
            .paragraphStyle : paragraph
            ])
        var textBounds = CGRect.zero
        
        textBounds.size = CGSize(width:bounds.width, height: bounds.width / 6)
        textBounds.origin = CGPoint(x: (bounds.width - textBounds.width) / 2, y: (bounds.height - textBounds.height))
        nameText.draw(in: textBounds)
    }
    
}
