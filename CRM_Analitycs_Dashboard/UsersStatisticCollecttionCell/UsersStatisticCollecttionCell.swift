//
//  UserTotalSVC-CVCell.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 05.01.2022.
//

import UIKit

class UsersStatisticCollecttionCell: UICollectionViewCell {
    //MARK: - Design
    @IBOutlet weak var view: UIView!{
        didSet{view.layer.cornerRadius = 7}}
    @IBOutlet weak var headingViewLabel: KernLabel!
    @IBOutlet weak var countTotalUserLabel: KernLabel!
    @IBOutlet weak var countTargetUsersL: KernLabel!
    @IBOutlet weak var countLessUsersLabel: KernLabel!
    @IBOutlet weak var percentLabel: KernLabel!
    
    let buildShape = BuildingShape()
    let shapeLayer = CAShapeLayer()
    let startAngle: CGFloat = ( -.pi / 2 )
    let endAngle: CGFloat = ( 3 * .pi / 2 )
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buildShape.makeCircle(superLayer: view,
                                       center: percentLabel.center,
                                       radius: 35,
                                       startAngle: startAngle,
                                       endAngle: endAngle,
                                       clockwise: true,
                                       fillColor: UIColor.clear,
                                       strokeColor: UIColor(named: "backCirc"),
                                       width: 10)
        
    }
    
    func setupCell(totalUser: UsersStatistic){
        
        let countLess = totalUser.lessUsersCount
        let countTarget = totalUser.targetUsersCount
        let countTotal = totalUser.totalUsersCount
        let persent = totalUser.percent
        
        countLessUsersLabel.text = "Less \(countLess) users"
        countTargetUsersL.text = "Target Users \(countTarget)"
        countTotalUserLabel.text = "\(countTotal) User"
        
        buildShape.makeAnimationCircleAndPercent(percent: persent,
                                                     labelForPercent: percentLabel,
                                                     shape: shapeLayer,
                                                     superLayer: view,
                                                     center: percentLabel.center,
                                                     radius: 35,
                                                     startAngle: startAngle,
                                                     endAngle: endAngle,
                                                     clockwise: true,
                                                     fillColor: UIColor.clear,
                                                     strokeColor: UIColor(named: "blue"),
                                                     width: 10,
                                                     fullCycleInSec: 2)
    }
    
}
