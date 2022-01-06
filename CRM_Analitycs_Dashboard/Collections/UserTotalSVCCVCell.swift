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
    @IBOutlet weak var placeForPercent: UILabel!{
        didSet{
            placeForPercent.text = ""
        }
    }
    
    let movingCircleLayer = CAShapeLayer()
      
      let percentLabel: UILabel = {
          let label = UILabel()
          label.text = "Buid!"
          label.textAlignment = .center
          label.font = UIFont(name: "Poppins-Light", size: 10)
          label.textColor = UIColor.white
          return label
      }()
    
    //var totalUser = targetUserInt - lessUserInt
    //input param: resultingPercent = 100 /( targetUserInt - lessUserInt
      var resultingPercent: Int = 90  //результат обрахунків %
      func animationPercent (resultingPrecent: Int) {
          var count = 0 // початкове значення % для анімації
          
          func nextIteration(){
              if count < resultingPercent {
                  count += 1
                  print("\(count) \(Date())") //хочу бачити кожну ітерацію в консолі
                  self.percentLabel.text = "\(Int(count))%" // підставити значення ітерації в лейбл
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                      nextIteration()
                  }
              }
          }
          nextIteration()
      }
      
          
         
                  
              
              
              
              /* DispatchQueue.main.asyncAfter(deadline: .now() + 1) { //затримка?
                  self.percentLabel.text = "\(Int(i))%" // підставити значення ітерації в лейбл
                  print("\(i) \(Date())") //хочу бачити кожну ітерацію в консолі
              }
              */
    
    
    //func for delay
     
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backViewCell.addSubview(percentLabel)
        percentLabel.frame = CGRect(x: 0, y: 0, width: 30, height: 15)
        percentLabel.center = placeForPercent.center
        
        
        
        
        
       // let`s start  by drawing a circle somehow
        let centerForCircle = placeForPercent.center
        
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
        animationPercent(resultingPrecent: resultingPercent)
        
        
        
        
        
    }
    
    
}
