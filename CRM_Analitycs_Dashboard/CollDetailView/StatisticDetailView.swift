//
//  TotalUserDeteilViev.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 09.01.2022.
//

import UIKit

class StatisticDetailView: UIView, CustomViewProtocol {
   
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var targetLable: KernLabel!{
        didSet{
            targetLable.font = UIFont(name: "Poppins-Regular", size: 9)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.9
            targetLable.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.63, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    @IBOutlet weak var lessLabel: UILabel!{
        didSet{
            lessLabel.font = UIFont(name: "Poppins-Regular", size: 9)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.9
            lessLabel.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.63, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    @IBOutlet weak var decriptionLabel: UILabel!{
        didSet{
            decriptionLabel.numberOfLines = 0
            decriptionLabel.lineBreakMode = .byWordWrapping
        }
    }

    let instanceShapes = BuildingShape()
    let startAngle: CGFloat = ( -.pi / 2 )
    let endAngle: CGFloat = ( 3 * .pi / 2 )
    let positionPoint1 = CGPoint(x: 171+5, y: 137+5)
    let positionPoint2 = CGPoint(x: 171+5, y: 159+5)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        instanceShapes.makeCircleShape(superLayer: contentView,
                                        center: percentLabel.center,
                                        radius: 50,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true,
                                        fillColor: UIColor.clear,
                                        strokeColor: UIColor(named: "backCirc"),
                                        width: 10,
                                        strokeEnd: 1)
        
        instanceShapes.makeCircleShape(superLayer: contentView,
                                        center: positionPoint2,
                                        radius: 5,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true,
                                        fillColor: UIColor(named: "blue"),
                                        strokeColor: UIColor.clear,
                                        width: 0,
                                        strokeEnd: 1)
        
        instanceShapes.makeCircleShape(superLayer: contentView,
                                        center: positionPoint1,
                                        radius: 5,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true,
                                        fillColor: UIColor(named: "blue"),
                                        strokeColor: UIColor.clear,
                                        width: 0,
                                        strokeEnd: 1)
        
    }
    
    func setupView (data: UsersStatistic) {
        let usersTotal = data.totalUsersCount
        let usersTarget = data.targetUsersCount
        
        self.lessLabel.text = "Less \(data.lessUsersCount) Users"
        self.targetLable.text = "Target \(usersTarget) Users"
        
        let computablePercent = Int(100.0 / (Double(usersTarget) / Double(usersTotal)))
        
        instanceShapes.makeAnimationCircleAndPercent(percent: computablePercent,
                                                       labelForPercent: percentLabel,
                                                       superLayer: contentView,
                                                       center: percentLabel.center,
                                                       radius: 50,
                                                       startAngle: startAngle,
                                                       endAngle: endAngle,
                                                       clockwise: true,
                                                       fillColor: UIColor.clear,
                                                       strokeColor: UIColor(named: "blue"),
                                                       width: 15)
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: "TotalUserDeteilView")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(for: "TotalUserDeteilView")
    }
    
}

