//
//  VertDiagrameCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 06.01.2022.
//

import UIKit

class ColumnMiniChartCell: UICollectionViewCell {
    
    @IBOutlet weak var yearLabel: KernLabel!
    @IBOutlet weak var backView: UIView!
    
    let buildShape = BuildingShape()
    let lineShapeLayer = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.backgroundColor = UIColor.clear
        
        buildShape.makeLine(superLayer: backView,
                                startX: backView.frame.width / 2,
                                startY: 18,
                                endX: backView.frame.width / 2,
                                endY: 0,
                                fillColor: UIColor.clear,
                                strokeColor: UIColor(named: "backLine"),
                                width: 3)
    }
    
    func setupCell (data: YearlyStatistics) {
        
        let persent = data.percent
        yearLabel.text = "\(data.year)"
        
        buildShape.makeAnimationLine(lineShape: lineShapeLayer ,percent: persent,
                                         startX: backView.frame.width / 2,
                                         startY: 18,
                                         endX: backView.frame.width / 2,
                                         endY: 0,
                                         superLayer: backView,
                                         fillColor: UIColor.clear,
                                         strokeColor: UIColor(named: "blue"),
                                         width: 3,
                                         fullCycleInSec: 2)
        
    }
    
}
