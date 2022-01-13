//
//  VertDiagrameCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 06.01.2022.
//

import UIKit

class ColumnMiniChartCell: UICollectionViewCell {
    
    @IBOutlet weak var yearLabel: KernLabel!
    
    let buildShape = BuildingShape()
    let backLineShape = CAShapeLayer()
    let animationLineShape = CAShapeLayer()
    let startX: CGFloat = 11
    let startY: CGFloat = 20
    let endX: CGFloat = 11
    let endY: CGFloat = 2
    
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
                            width: 3)
    }
    
    func setupCell (data: YearlyStatistics) {
        
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
                                     width: 3,
                                     fullCycleInSec: 2)
    }
    
}
