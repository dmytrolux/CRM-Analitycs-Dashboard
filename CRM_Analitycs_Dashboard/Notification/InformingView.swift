//
//  Notification.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 25.01.2022.
//

import UIKit

class InformingView: UIView, CustomViewProtocol {
    
    @IBOutlet var contentView: UIView!
    
    let nameThisClass = String(describing: InformingView.self)
    
    let buildShape = PatternShapes()
    let circlShape = CAShapeLayer()
    
    let startAngle: CGFloat = ( -.pi / 2 )
    let endAngle: CGFloat = ( 3 * .pi / 2 )
    let positionPoint1 = CGPoint(x: 17-4.5, y: 6)
    
    let countLabel = UILabel(frame: CGRect(x: 8,
                                           y: 2,
                                           width: 11,
                                           height: 11))
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setupNumberInforming(_ count: Int){
        countLabel.textAlignment = .center
        countLabel.font = UIFont(name: "poppins-bold", size: 9)
        countLabel.textColor = UIColor.white
        countLabel.backgroundColor = MyColor.blue
        countLabel.layer.cornerRadius = 5.5
        countLabel.clipsToBounds = true
        countLabel.isHidden = true
        contentView.addSubview(countLabel)
        
        if count > 0 {
            countLabel.isHidden = false
            countLabel.text = "\(count)"
        } else {
            countLabel.isHidden = true
        }
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
