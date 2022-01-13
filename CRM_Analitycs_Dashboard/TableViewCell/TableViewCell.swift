//
//  TableViewCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 07.01.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var areaForShapes: UIView!
    @IBOutlet weak var mounthL: UILabel!{
        didSet{
            mounthL.font = UIFont(name: "Poppins-Regular", size: 14)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.9
            mounthL.attributedText = NSMutableAttributedString(string: "Januay 01", attributes: [NSAttributedString.Key.kern: 0.42, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    @IBOutlet weak var dollarL: UILabel!{
        didSet{
            dollarL.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

            dollarL.font = UIFont(name: "Poppins-SemiBold", size: 13)
            dollarL.textAlignment = .right
            dollarL.attributedText = NSMutableAttributedString(string: "$2,029", attributes: [NSAttributedString.Key.kern: 0.39])
        }
    }
    let buildShape = BuildingShape()
    let circleShape = CAShapeLayer()
    let lineUpShape = CAShapeLayer()
    let lineDownShape = CAShapeLayer()
    let startAngle: CGFloat = ( -.pi / 2 )
    let endAngle: CGFloat = ( 3 * .pi / 2 )
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    
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
    }
}
