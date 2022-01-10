//
//  UserTotalSVC-CVCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 05.01.2022.
//

import UIKit

class UsersStatisticCollecttionCell: UICollectionViewCell {
    
    //MARK: - Work with Data
    var userStatistic: UsersStatistic?
    func setupCell(totalUser: UsersStatistic){
        userStatistic = totalUser
        countLessUserLabel.text = "Less \(totalUser.lessUsersCount) users"
        countTargetUserL.text = "Target Users \(totalUser.targetUsersCount)"
        countUserLabel.text = "\(totalUser.totalUsersCount) User"
        
        animationPercentAndCircle(target: totalUser.targetUsersCount,
                                  less: totalUser.lessUsersCount)
    }
    //MARK: - Design
    @IBOutlet weak var view: UIView!{
        didSet{
            view.layer.cornerRadius = 7
            view.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var totalUsersNowLabel: KernLabel!
    @IBOutlet weak var countUserLabel: KernLabel!
    @IBOutlet weak var countTargetUserL: KernLabel!
    @IBOutlet weak var countLessUserLabel: KernLabel!
    @IBOutlet weak var placeForPercent: KernLabel!{
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
    
    private func animationPercentAndCircle (target: Int, less: Int) {
        var count = 0.0
        let resPerc = (100.0 / (Double(target) / Double(less)))
        
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
        
      
        
//        let copyClass = TotalUserDeteilView()
//        let circlPath = UIBezierPath(arcCenter: placeForPercent.center,
//                                 radius: 50,
//                                 startAngle: -.pi / 2,
//                                 endAngle: 3 * .pi / 2,
//                                 clockwise: true)
//
//        copyClass.makeBackCircl(superLayer: view,
//                                path: circlPath,
//                                color: UIColor(named: "blue"),
//                                width: 5)
        
        
        
        //animationPercentAndCircle(target: target, less: less)
        
        view.addSubview(percentLabel)
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
        view.layer.addSublayer(backCircleLayer)
        
        movingCircleLayer.path = circularPath.cgPath
        movingCircleLayer.strokeColor = UIColor(named: "blue")?.cgColor
        movingCircleLayer.lineWidth = 10
        movingCircleLayer.fillColor = UIColor.clear.cgColor
        movingCircleLayer.lineCap = .round
        movingCircleLayer.strokeEnd = 0
        
        view.layer.addSublayer(movingCircleLayer)
        
      
        
        //backViewCell.addGestureRecognizer(
            //UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    //MARK: - Action Gesture
//    @objc private func handleTap() {
        //animationPercentAndCircle(target: paramTarget, less: paramLess)
        
    //}
}
