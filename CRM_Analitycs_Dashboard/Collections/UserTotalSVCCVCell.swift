//
//  UserTotalSVC-CVCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 05.01.2022.
//

import UIKit

 class UserTotalSVCCVCell: UICollectionViewCell {
    @IBOutlet weak var backViewCell: UIView!{
        didSet{
            backViewCell.layer.cornerRadius = 7
            backViewCell.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var totalusersL: UILabel!{
        didSet{
            totalusersL.attributedText =  NSMutableAttributedString(string: "Total Users Now", attributes: [NSAttributedString.Key.kern: 1])
            
        }
    }
    @IBOutlet weak var resultUserL: UILabel!{
        didSet{
            resultUserL.attributedText =  NSMutableAttributedString(string: "1000 User", attributes: [NSAttributedString.Key.kern: 0.25])
            
        }
    }
    @IBOutlet weak var countTargetUserL: UILabel!{
        didSet{
            countTargetUserL.attributedText =  NSMutableAttributedString(string: "Target Users 2000 user", attributes: [NSAttributedString.Key.kern: 0.1])
            
        }
    }
    @IBOutlet weak var countLessUser: UILabel!{
        didSet{
            countLessUser.attributedText =  NSMutableAttributedString(string: "less 1000 User", attributes: [NSAttributedString.Key.kern: 0.1])
        }
    }
    @IBOutlet weak var resulPpercent: UILabel!{
        didSet{
           
        }
    }
    
    let movingCircleLayer = CAShapeLayer()
    
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
       // let`s start  by drawing a circle somehow
        let centerForCircle = resulPpercent.center
        
        //create my track layer
        let backCircleLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: centerForCircle, radius: 68/2, startAngle: -(.pi / 2), endAngle: (3 * .pi) / 2, clockwise: true)
        
        backCircleLayer.path = circularPath.cgPath
        backCircleLayer.strokeColor = UIColor(red: 0.269, green: 0.278, blue: 0.362, alpha: 1).cgColor
        backCircleLayer.opacity = 1
        backCircleLayer.lineWidth = 10
        backCircleLayer.fillColor = UIColor.clear.cgColor
        backCircleLayer.lineCap = .round
        backViewCell.layer.addSublayer(backCircleLayer)
        
    
        
        
     //   let circularPath = UIBezierPath(arcCenter: center,
        movingCircleLayer.path = circularPath.cgPath
        movingCircleLayer.strokeColor = UIColor(named: "blue")?.cgColor
        movingCircleLayer.lineWidth = 10
        movingCircleLayer.fillColor = UIColor.clear.cgColor
        movingCircleLayer.lineCap = .round
        movingCircleLayer.strokeEnd = 0
        
        
        backViewCell.layer.addSublayer(movingCircleLayer)
        
        
        backViewCell.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    @objc private func handleTap() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        //basicAnimation.fromValue = 0
        basicAnimation.toValue = 0.5
        basicAnimation.duration = 0.5
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        movingCircleLayer.add(basicAnimation, forKey: "urSoBasic")
        
        
    }
    
    
}
