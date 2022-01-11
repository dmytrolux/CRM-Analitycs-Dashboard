//
//  BuildShape.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 10.01.2022.
//


import UIKit

class BuildingShape {
    
    func makeCircle(superLayer: UIView, center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool, fillColor: UIColor!, strokeColor: UIColor!, width: CGFloat) {
        
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
        circleShape.strokeEnd = 1
        superLayer.layer.addSublayer(circleShape)
    }
    
    
    func makeAnimationCircleAndPercent (percent: Int, labelForPercent: UILabel, shape: CAShapeLayer, superLayer: UIView, center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool, fillColor: UIColor!, strokeColor: UIColor!, width: CGFloat, fullCycleInSec: Double) {
        
        var count = 0
        let delay = fullCycleInSec / 100
        
        func nextIteration(){
            if count < percent {
                count += 1
                labelForPercent.text = "\(Int(count))%"
                let strokeEnd = CGFloat(count) / CGFloat(100)
                
                let shape = CAShapeLayer()
                let path = UIBezierPath(arcCenter: center,
                                        radius: radius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: clockwise)
                shape.path = path.cgPath
                shape.strokeColor = strokeColor.cgColor
                shape.lineWidth = width
                shape.fillColor = fillColor.cgColor
                shape.lineCap = .round
                shape.strokeEnd = strokeEnd
                superLayer.layer.addSublayer(shape)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    nextIteration()
                }
            }
        }
        nextIteration()
    }
    
    func makeLine(superLayer: UIView, startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat, fillColor: UIColor!, strokeColor: UIColor!,  width: CGFloat){
        
        let lineShape = CAShapeLayer()
        lineShape.frame = superLayer.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(
            x: startX,
            y: startY ))
        path.addLine(to: CGPoint(
            x: endX ,
            y: endY))
        lineShape.path = path.cgPath
        
        lineShape.lineWidth = width
        lineShape.lineCap = .round
        lineShape.fillColor = fillColor.cgColor
        lineShape.strokeEnd = 1
        lineShape.strokeColor = strokeColor.cgColor
        lineShape.frame = superLayer.bounds
        superLayer.layer.addSublayer(lineShape)
    }
    
    func makeAnimationLine (lineShape: CAShapeLayer, percent: Int, startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat, superLayer: UIView, fillColor: UIColor!, strokeColor: UIColor!, width: CGFloat, fullCycleInSec: Double){
        
        var count = 0
        let delay = fullCycleInSec / 100
        
        func nextIteration(){
            if count < percent {
                count += 1
                let strokeEnd = CGFloat(count) / CGFloat(100)
                
                lineShape.frame = superLayer.bounds
                superLayer.layer.addSublayer(lineShape)
                lineShape.lineWidth = width
                lineShape.lineCap = .round
                lineShape.fillColor = fillColor.cgColor
                lineShape.strokeEnd = strokeEnd
                lineShape.strokeColor = strokeColor.cgColor
                let path = UIBezierPath()
                path.move(to: CGPoint(
                    x: startX,
                    y: startY ))
                path.addLine(to: CGPoint(
                    x: endX ,
                    y: endY))
                lineShape.path = path.cgPath

                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    nextIteration()
                }
            }
        }
        nextIteration()
    }
    
}




