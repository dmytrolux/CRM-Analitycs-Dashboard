//
//  UserTotalSVC-CVCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 05.01.2022.
//

import UIKit

class UserTotalSVCCVCell: UICollectionViewCell {
    
    //MARK: - Work with Data
    //Замінити рандои на отримані значення з StructTotalUser
    var paramTarget = Double.random(in: 2000..<5000)
    var paramLess = Double.random(in: 500..<2000)
    
    
    //Видалити
    @IBOutlet weak var targetL: UILabel!
    //Видалити
    @IBOutlet weak var lessL: UILabel!
    
    
    //Викликається в методі cellForItemAt в SecondViewController
    func setupCell(totalUser: TotalUserStruct){
        
        //Значення свойств масива об'єктів передаються в лейбли відповідних ячейок
//        self.less.text = "\(totalUser.lessInt)"
//        self.turget.text = "\(totalUser.targetInt)"
//        
        
        //Хочу спочатку отримати в свойства ячейки, а потім приклеїти їх в лейбли уникнувши опціоналів
//        paramTarget = totalUser.targetInt
//        paramLess = totalUser.lessInt
    }
    
    //MARK: - Design
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
            resultUserL.attributedText =  NSMutableAttributedString(string: "\(Int(paramTarget-paramLess)) User", attributes: [NSAttributedString.Key.kern: 0.25])
        }
    }
    @IBOutlet weak var countTargetUserL: UILabel!{
        didSet{
            countTargetUserL.attributedText =  NSMutableAttributedString(string: "Target Users \(Int(paramTarget)) user", attributes: [NSAttributedString.Key.kern: 0.1])
        }
    }
    @IBOutlet weak var countLessUser: UILabel!{
        didSet{
            countLessUser.attributedText =  NSMutableAttributedString(string: "less \(Int(paramLess)) User", attributes: [NSAttributedString.Key.kern: 0.1])
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
    
    private func animationPercentAndCircle (target: Double, less: Double) {
        var count = 0.0
        let resPerc = (100.0 / (target / less))
        
        func nextIteration(){
            if count < resPerc {
                count += 1
                self.percentLabel.text = "\(Int(count))%"
                movingCircleLayer.strokeEnd = CGFloat(count) / CGFloat(100)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.075) {
                    nextIteration()
                }
            }
        }
        nextIteration()
    }
    
    //MARK: - Analog View Did Load Cell
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backViewCell.addSubview(percentLabel)
        percentLabel.frame = CGRect(x: 0, y: 0, width: 30, height: 15)
        percentLabel.center = placeForPercent.center
        
        let centerForCircle = placeForPercent.center
        
        let backCircleLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: centerForCircle,
                                        radius: 68/2,
                                        startAngle: -(.pi / 2),
                                        endAngle: (3 * .pi) / 2,
                                        clockwise: true)
        
        backCircleLayer.path = circularPath.cgPath
        backCircleLayer.strokeColor = UIColor(red: 0.269, green: 0.278, blue: 0.362, alpha: 1).cgColor
        backCircleLayer.opacity = 1
        backCircleLayer.lineWidth = 10
        backCircleLayer.fillColor = UIColor.clear.cgColor
        backCircleLayer.lineCap = .round
        backViewCell.layer.addSublayer(backCircleLayer)
        
        movingCircleLayer.path = circularPath.cgPath
        movingCircleLayer.strokeColor = UIColor(named: "blue")?.cgColor
        movingCircleLayer.lineWidth = 10
        movingCircleLayer.fillColor = UIColor.clear.cgColor
        movingCircleLayer.lineCap = .round
        movingCircleLayer.strokeEnd = 0
        
        backViewCell.layer.addSublayer(movingCircleLayer)
        
        //backViewCell.addGestureRecognizer(
            //UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    //MARK: - Action Gesture
//    @objc private func handleTap() {
        //animationPercentAndCircle(target: paramTarget, less: paramLess)
        
    //}
}
