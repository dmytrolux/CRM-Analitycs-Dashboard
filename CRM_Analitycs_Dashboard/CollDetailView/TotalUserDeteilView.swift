//
//  TotalUserDeteilViev.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 09.01.2022.
//

import UIKit

class TotalUserDeteilView: UIView, CustomViewProtocol {
   
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var percentL: UILabel!
    @IBOutlet weak var targetL: KernLabel!{
        didSet{
            targetL.font = UIFont(name: "Poppins-Regular", size: 9)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.9
            targetL.attributedText = NSMutableAttributedString(string: "T-", attributes: [NSAttributedString.Key.kern: 0.63, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    @IBOutlet weak var lessL: UILabel!{
        didSet{
            lessL.font = UIFont(name: "Poppins-Regular", size: 9)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.9
            lessL.attributedText = NSMutableAttributedString(string: "\(paramLess)", attributes: [NSAttributedString.Key.kern: 0.63, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    @IBOutlet weak var someTextL: UILabel!{
        didSet{
            someTextL.numberOfLines = 0
            someTextL.lineBreakMode = .byWordWrapping
        }
    }
    
    var paramTarget = 0
    var paramLess = 0

    var circlPath = UIBezierPath()
    let movingCircleLayer = CAShapeLayer()
    var strokeEnd : CGFloat = 0.5
    //var circlPath: UIBezierPath!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        circlPath = UIBezierPath(arcCenter: percentL.center,
                                 radius: 50,
                                 startAngle: -.pi / 2,
                                 endAngle: 3 * .pi / 2,
                                 clockwise: true)
        
        makeBackCircl(superLayer: contentView,
                      path: circlPath,
                      color: UIColor(named: "backCirc"),
                      width: 10)
        
        animationPercentAndCircleFront(target: paramTarget, less: paramLess)
        
        let circlPoint1 = UIBezierPath(arcCenter: CGPoint(x: 171+5, y: 137+5),
                                       radius: 5,
                                       startAngle: -.pi / 2,
                                       endAngle: 3 * .pi / 2,
                                       clockwise: true)
        
        makeBackCircl(superLayer: contentView,
                      path: circlPoint1,
                      color: UIColor.blue,
                      width: 0,
                      fillColor: UIColor(named: "blue"))
        
        let circlPoint2 = UIBezierPath(arcCenter: CGPoint(x: 171+5, y: 159+5),
                                       radius: 5,
                                       startAngle: -.pi / 2,
                                       endAngle: 3 * .pi / 2,
                                       clockwise: true)
        
        makeBackCircl(superLayer: contentView,
                      path: circlPoint2,
                      color: UIColor.blue,
                      width: 0,
                      fillColor: UIColor(named: "blue"))
  
        
        
    }
    func setupView (data: UsersStatistic) {
        self.lessL.text = "\(data.lessUsersCount)"
        self.targetL.text = "\(data.targetUsersCount)"
        self.percentL.text = "\(data.totalUsersCount)"
        self.animationPercentAndCircleFront(target: data.targetUsersCount, less: data.lessUsersCount)
    }
    
     func animationPercentAndCircleFront (target: Int, less: Int) {
        var count = 0.0
        let resPerc = (100.0 / (Double(target) / Double(less)))
        
        func nextIteration(){
            if count < resPerc {
                count += 1
                self.percentL.text = "\(Int(count))%"
                let strokeEnd = CGFloat(count) / CGFloat(100)
                
                makeFrontCircl(superLayer: contentView,
                               path: circlPath,
                               color: UIColor(named: "blue"),
                               width: 15,
                               strokeEnd: strokeEnd)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.075) {
                    nextIteration()
                }
            }
        }
        nextIteration()
    }
    
     func makeBackCircl(superLayer: UIView, path: UIBezierPath, color: UIColor!, width: CGFloat, fillColor: UIColor! = UIColor.clear)  {
        let backCirkleLayer = CAShapeLayer()
        backCirkleLayer.path = path.cgPath
        backCirkleLayer.strokeColor = color.cgColor
        backCirkleLayer.opacity = 1
        backCirkleLayer.lineWidth = width
        backCirkleLayer.fillColor = fillColor.cgColor
        backCirkleLayer.lineCap = .round
        superLayer.layer.addSublayer(backCirkleLayer)
    }
    
   private func makeFrontCircl(superLayer: UIView, path: UIBezierPath, color: UIColor!, width: CGFloat, strokeEnd: CGFloat) {
        movingCircleLayer.path = path.cgPath
        movingCircleLayer.strokeColor = color.cgColor
        movingCircleLayer.lineWidth = width
        movingCircleLayer.fillColor = UIColor.clear.cgColor
        movingCircleLayer.lineCap = .round
        movingCircleLayer.strokeEnd = strokeEnd
        superLayer.layer.addSublayer(movingCircleLayer)
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

extension TotalUserDeteilView: UserTotalDelegate {
    func update(target: Double, less: Double) {
        targetL.text = "\(target)"
        lessL.text = "\(less)"
    }
    
    
}
