//
//  TableViewCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 07.01.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
  
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
    
    
    
    fileprivate func makePoint(_ centerPoint: CGPoint) {
        let point = CAShapeLayer()
        let pointSet = UIBezierPath(arcCenter: centerPoint,
                                    radius: 3,
                                    startAngle: 0,
                                    endAngle: .pi*2,
                                    clockwise: true)
        point.path = pointSet.cgPath
        point.fillColor = UIColor(named: "blue")?.cgColor
        backView.layer.addSublayer(point)
    }
    
    func makeVerticalLineCenter(lineHeight: CGFloat) {
        let line = CAShapeLayer()
        line.lineWidth = 1
        line.strokeColor = UIColor(red: 0.276, green: 0.287, blue: 0.397, alpha: 1).cgColor
        let path = UIBezierPath()
        path.move(to: CGPoint(
            x: areaForShapes.frame.width / 2,
            y: areaForShapes.frame.height / 2 ))
        path.addLine(to: CGPoint(
            x: areaForShapes.frame.width / 2 ,
            y: areaForShapes.frame.height / 2 + lineHeight))
        line.path = path.cgPath
        areaForShapes.layer.addSublayer(line)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let centerPoint = areaForShapes.center
       
        makeVerticalLineCenter(lineHeight: -25)
        makeVerticalLineCenter(lineHeight: 25)
        
        makePoint(centerPoint)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
