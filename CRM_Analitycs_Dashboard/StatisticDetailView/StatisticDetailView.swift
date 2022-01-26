//
//  TotalUserDeteilViev.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 09.01.2022.
//

import UIKit

class StatisticDetailView: UIView, CustomViewProtocol {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var headingViewLabel: KernLabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var targetLable: KernLabel!
    @IBOutlet weak var lessLabel: KernLabel!
    @IBOutlet weak var decriptionLabel: KernLabel!
    
    let nameThisClass = String(describing: StatisticDetailView.self)
    let buildShape = PatternShapes()
    let backCirclShape = CAShapeLayer()
    let pointUpShape = CAShapeLayer()
    let pointDownShape = CAShapeLayer()
    let animationCircleShape = CAShapeLayer()
    
    let startAngle: CGFloat = ( -.pi / 2 )
    let endAngle: CGFloat = ( 3 * .pi / 2 )
    let positionPoint1 = CGPoint(x: 171+5, y: 137+5)
    let positionPoint2 = CGPoint(x: 171+5, y: 159+5)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buildShape.makeCircle(shape: backCirclShape,
                              superLayer: contentView,
                              center: percentLabel.center,
                              radius: 50,
                              startAngle: startAngle,
                              endAngle: endAngle,
                              clockwise: true,
                              fillColor: MyColor.clear,
                              strokeColor: MyColor.backCircle,
                              width: 10)
        
        buildShape.makeCircle(shape: pointUpShape,
                              superLayer: contentView,
                              center: positionPoint1,
                              radius: 5,
                              startAngle: startAngle,
                              endAngle: endAngle,
                              clockwise: true,
                              fillColor: MyColor.blue,
                              strokeColor: MyColor.clear,
                              width: 0)
        
        buildShape.makeCircle(shape: pointDownShape,
                              superLayer: contentView,
                              center: positionPoint2,
                              radius: 5,
                              startAngle: startAngle,
                              endAngle: endAngle,
                              clockwise: true,
                              fillColor: MyColor.blue,
                              strokeColor: MyColor.clear,
                              width: 0)
        
    }
    
    func setupView (data: UsersStatistic) {
        
        let usersTarget = data.targetUsersCount
        let persent = data.percent
        
        self.lessLabel.text = "Less \(data.lessUsersCount) Users"
        self.targetLable.text = "Target \(usersTarget) Users"
        
        buildShape.makeAnimationCircleAndPercent(shape: animationCircleShape,
                                                 superLayer: contentView,
                                                 percent: persent,
                                                 labelForPercent: percentLabel,
                                                 center: percentLabel.center,
                                                 radius: 50,
                                                 startAngle: startAngle,
                                                 endAngle: endAngle,
                                                 clockwise: true,
                                                 fillColor: MyColor.clear,
                                                 strokeColor: MyColor.blue,
                                                 width: 15,
                                                 fullCycleInSec: 2)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: nameThisClass)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(for: nameThisClass)
    }
}

