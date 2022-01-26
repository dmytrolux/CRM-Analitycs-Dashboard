//
//  RangingChartCollectionCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 22.01.2022.
//

import UIKit

class RangingChartCollectionCell: UICollectionViewCell {
    @IBOutlet weak var yearLabel: KernLabel!
    
    let buildShape = PatternShapes()
    let backLineShape = CAShapeLayer()
    let animationLineShape = CAShapeLayer()
    let startX: CGFloat = 13
    let startY: CGFloat = 156.5
    let endX: CGFloat = 13
    let endY: CGFloat = 4.5
    let width: CGFloat = 9
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buildShape.makeLine(shape: backLineShape,
                            superLayer: contentView,
                            startX: startX,
                            startY: startY,
                            endX: endX,
                            endY: endY,
                            fillColor: MyColor.clear,
                            strokeColor: MyColor.backLine,
                            width: width)
    }
    
    func setupItem (data: YearlyStatistics) {
        
        let persent = data.percent
        yearLabel.text = "\(data.year)"
        
        buildShape.makeAnimationLine(shape: animationLineShape,
                                     superLayer: contentView,
                                     percent: persent,
                                     startX: startX,
                                     startY: startY,
                                     endX: endX,
                                     endY: endY,
                                     fillColor: MyColor.clear,
                                     strokeColor: MyColor.blue,
                                     width: width,
                                     fullCycleInSec: 3)
    }
    
}
