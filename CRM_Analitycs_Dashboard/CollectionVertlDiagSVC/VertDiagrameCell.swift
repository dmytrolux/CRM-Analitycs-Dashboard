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
            yearL.contentMode = .bottom
       
        }
    }
    
    /////ShapeLayer/////////////
    
    @IBOutlet weak var backView: UIView!
    
    
    var shapeLayer: CAShapeLayer!{
        didSet{
            shapeLayer.lineWidth = 3
            shapeLayer.lineCap = .round
            shapeLayer.fillColor = UIColor.green.cgColor
            shapeLayer.strokeEnd = 1
            let color = UIColor(red: 0.224, green: 0.227, blue: 0.278, alpha: 1).cgColor
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
        path.move(to: CGPoint(
            x: backView.frame.width / 2,
            y: 18 ))
        path.addLine(to: CGPoint(
            x: backView.frame.width / 2 ,
            y: 0))
        shapeLayer.path = path.cgPath
    }
    
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        shapeLayer = CAShapeLayer()
        backView.layer.addSublayer(shapeLayer)
        
        overShapeLayer = CAShapeLayer()
        backView.layer.addSublayer(overShapeLayer)
        
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = Double.random(in: 0..<1)
                                          
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        //animation.delegate = self
        
        overShapeLayer.add(animation, forKey: nil)
    }

}
