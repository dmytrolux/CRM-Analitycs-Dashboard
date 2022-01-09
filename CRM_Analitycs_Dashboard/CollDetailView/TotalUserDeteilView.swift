//
//  TotalUserDeteilViev.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 09.01.2022.
//

import UIKit

class TotalUserDeteilView: UIView, CustomViewProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: "TotalUserDeteilView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(for: "TotalUserDeteilView")
    }
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var percentL: UILabel!
    @IBOutlet weak var targetL: KernLabel!{
        didSet{
            targetL.font = UIFont(name: "Poppins-Regular", size: 9)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.9
            targetL.attributedText = NSMutableAttributedString(string: "Target 2000 Users", attributes: [NSAttributedString.Key.kern: 0.63, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    @IBOutlet weak var lessL: KernLabel!{
        didSet{
            lessL.font = UIFont(name: "Poppins-Regular", size: 9)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.9
            lessL.attributedText = NSMutableAttributedString(string: "Target 2000 Users", attributes: [NSAttributedString.Key.kern: 0.63, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    @IBOutlet weak var someTextL: UILabel!{
        didSet{
            someTextL.numberOfLines = 0
            someTextL.lineBreakMode = .byWordWrapping
        }
    }
    
    var paramTarget: Double = 2000
    var paramLess : Double = 1000
    
    let backCircleLayer = CAShapeLayer()
    let movingCircleLayer = CAShapeLayer()
    var strokeEnd : CGFloat = 0.5
    var circlPath: UIBezierPath!
    
    private func animationPercentAndCircleFront (target: Double, less: Double) {
        var count = 0.0
        let resPerc = (100.0 / (target / less))
        
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
    
    func makeBackCircl(superLayer: UIView, path: UIBezierPath, color: UIColor!, width: CGFloat) {
        backCircleLayer.path = path.cgPath
        backCircleLayer.strokeColor = color.cgColor
        backCircleLayer.opacity = 1
        backCircleLayer.lineWidth = width
        backCircleLayer.fillColor = UIColor.clear.cgColor
        backCircleLayer.lineCap = .round
        superLayer.layer.addSublayer(backCircleLayer)
    }
    
    func makeFrontCircl(superLayer: UIView, path: UIBezierPath, color: UIColor!, width: CGFloat, strokeEnd: CGFloat) {
        movingCircleLayer.path = path.cgPath
        movingCircleLayer.strokeColor = color.cgColor
        movingCircleLayer.lineWidth = width
        movingCircleLayer.fillColor = UIColor.clear.cgColor
        movingCircleLayer.lineCap = .round
        movingCircleLayer.strokeEnd = strokeEnd
        superLayer.layer.addSublayer(movingCircleLayer)
    }
    
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
        
    }
}
