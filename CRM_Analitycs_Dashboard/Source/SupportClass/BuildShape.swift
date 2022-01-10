//
//  BuildShape.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 10.01.2022.
//


import UIKit

class BuildingShape {
    
    func makeCirclShape(superLayer: UIView, center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool, fillColor: UIColor!, strokeColor: UIColor!, width: CGFloat, strokeEnd: CGFloat) {
        
        let circleShape = CAShapeLayer()
        let path = UIBezierPath(arcCenter: center,
                                       radius: radius,
                                       startAngle: startAngle,
                                       endAngle: endAngle,
                                       clockwise: clockwise)
        circleShape.path = path.cgPath
        circleShape.strokeColor = strokeColor.cgColor
        circleShape.lineWidth = width
        circleShape.fillColor = fillColor.cgColor
        circleShape.lineCap = .round
        circleShape.strokeEnd = strokeEnd
        superLayer.layer.addSublayer(circleShape)
     }
    
    func makeVericakLine(superLayer: UIView, fromX: CGFloat, fromY: CGFloat, beforeX: CGFloat, beforeY: CGFloat, fillColor: UIColor!, strokeColor: UIColor!,  width: CGFloat, strokeEnd: CGFloat){
        
        let vertikalLineShape = CAShapeLayer()
        vertikalLineShape.lineWidth = 3
        vertikalLineShape.lineCap = .round
        vertikalLineShape.fillColor = fillColor.cgColor
        vertikalLineShape.strokeEnd = strokeEnd
        vertikalLineShape.strokeColor = strokeColor.cgColor
        vertikalLineShape.frame = superLayer.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(
            x: fromX,
            y: fromY ))
        path.addLine(to: CGPoint(
            x: beforeX ,
            y: beforeY))
        vertikalLineShape.path = path.cgPath
        superLayer.layer.addSublayer(vertikalLineShape)
    }
    
}


