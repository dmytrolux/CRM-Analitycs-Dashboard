//
//  CircleShapeView.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 14.01.2022.
//

import UIKit

class CircleShapeView: UIView {

    var shape: CAShapeLayer!
    var overShape: CAShapeLayer!
    var radius: CGFloat = 35
    var lineWidth: CGFloat = 10
    var startAngle =  (-Double.pi / 2)
    var endAngle = (3 * Double.pi / 2)
    var labelForPercent = UILabel()
    var percent = 150
//    
//    init(radius: CGFloat, lineWidth: CGFloat) {
//        self.radius = radius
//        self.lineWidth = lineWidth
//    }

    
    override func draw(_ rect: CGRect) {
    shape = CAShapeLayer()
    overShape = CAShapeLayer()
        let path = UIBezierPath(arcCenter: center,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        shape.path = path.cgPath
        shape.strokeColor = MyColor.backCircle.cgColor
        shape.lineWidth = lineWidth
        shape.fillColor = MyColor.clear.cgColor
        shape.lineCap = .round
        shape.strokeEnd = 1
        self.layer.addSublayer(shape)
        
        var count = 0
        var delay: Double = 1
        func nextIteration() {
        if count < percent {
            count += 1
            labelForPercent.text = "\(Int(count))%"
            let strokeEnd: Double = 0.50
            
            overShape = CAShapeLayer()
            let path = UIBezierPath(arcCenter: center,
                                    radius: radius,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)
            overShape.path = path.cgPath
            overShape.strokeColor = MyColor.blue!.cgColor
            overShape.lineWidth = lineWidth
            overShape.fillColor = UIColor.clear.cgColor
            overShape.lineCap = .round
            overShape.strokeEnd = strokeEnd
            shape.addSublayer(overShape)
        }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            nextIteration()
        }
    }
}
