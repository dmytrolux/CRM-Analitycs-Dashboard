//
//  TableViewCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 07.01.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var areaForShapes: UIView!
    @IBOutlet weak var dateLabel: KernLabel!
    @IBOutlet weak var moneyLabel: KernLabel!
    
    let buildShape = PatternShapes()
    let circleShape = CAShapeLayer()
    let lineUpShape = CAShapeLayer()
    let lineDownShape = CAShapeLayer()
    let startAngle: CGFloat = ( -.pi / 2 )
    let endAngle: CGFloat = ( 3 * .pi / 2 )
    
    var indexPath: IndexPath!
    var selectedMonthlyMoneyArray = [Int]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buildShape.makeCircle(shape: circleShape,
                              superLayer: areaForShapes,
                              center: areaForShapes.center,
                              radius: 3,
                              startAngle: startAngle,
                              endAngle: endAngle ,
                              clockwise: true,
                              fillColor: MyColor.blue,
                              strokeColor: MyColor.clear,
                              width: 0)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        drawLinesAtPrepareForReuse()
    }
    
    func drawLinesAtPrepareForReuse() {
        
        buildShape.makeLine(shape: lineUpShape,
                            superLayer: areaForShapes,
                            startX: areaForShapes.frame.width/2,
                            startY: areaForShapes.frame.height/2,
                            endX: areaForShapes.frame.width/2,
                            endY: areaForShapes.frame.height/2 - 25,
                            fillColor: MyColor.clear,
                            strokeColor: MyColor.blue,
                            width: 1)
        
        buildShape.makeLine(shape: lineDownShape,
                            superLayer: areaForShapes,
                            startX: areaForShapes.frame.width/2,
                            startY: areaForShapes.frame.height/2,
                            endX: areaForShapes.frame.width/2,
                            endY: areaForShapes.frame.height/2 + 25,
                            fillColor: MyColor.clear,
                            strokeColor: MyColor.blue,
                            width: 1)
        
        switch indexPath.row {
        case 0:
            lineUpShape.removeFromSuperlayer()
        case selectedMonthlyMoneyArray.count - 1 :
            lineDownShape.removeFromSuperlayer()
        default:
            break
        }
    }
}
