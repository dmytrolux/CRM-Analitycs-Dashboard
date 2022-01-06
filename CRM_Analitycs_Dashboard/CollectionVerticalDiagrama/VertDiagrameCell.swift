//
//  VertDiagrameCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 06.01.2022.
//

import UIKit

class VertDiagrameCell: UICollectionViewCell {

    
    
    
    func setupCell(userOfYear: VertDiagStruct){
        self.yearL.text = "\(userOfYear.year)"
//        var yearStr = self.yearL.text
        
        
    }
    
    
    
    
    @IBOutlet weak var yearL: UILabel!{
        didSet{
            yearL.font = UIFont(name: "Poppins-Medium", size: 10)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.8
            yearL.textAlignment = .center
            yearL.attributedText = NSMutableAttributedString(string: "xxxx", attributes: [NSAttributedString.Key.kern: 0.3, NSAttributedString.Key.paragraphStyle: paragraphStyle])
       
        }
    }
    
    /////ShapeLayer/////////////
    
    @IBOutlet weak var backView: UIView!
    var shapeLayer: CAShapeLayer!{
        didSet{
            shapeLayer.lineWidth = 3
            shapeLayer.lineCap = .round
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = UIColor.white.cgColor  //UIColor(red: 0.224, green: 0.227, blue: 0.278, alpha: 1).cgColor
            shapeLayer.strokeColor = color
            
        }
    }
    
    var overShapeLayer: CAShapeLayer!{
        didSet{
            overShapeLayer.lineWidth = 3
            overShapeLayer.lineCap = .round
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            let color = UIColor(named: "blue")?.cgColor
            overShapeLayer.strokeColor = color
            
        }
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = backView.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.backView.frame.width / 2, y: self.backView.frame.height / 2 ))
        path.addLine(to: CGPoint(x: self.backView.frame.width / 2 - 3 , y: self.backView.frame.height  + 4))
        shapeLayer.path = path.cgPath
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        shapeLayer = CAShapeLayer()
        backView.layer.addSublayer(shapeLayer)
        
        overShapeLayer = CAShapeLayer()
        backView.layer.addSublayer(overShapeLayer)
    }

}
