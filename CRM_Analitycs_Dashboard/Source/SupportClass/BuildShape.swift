//
//  BuildShape.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 10.01.2022.
//


import UIKit

class BuildingShape {
    
    func makeCircle(shape: CAShapeLayer, superLayer: UIView, center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool, fillColor: UIColor!, strokeColor: UIColor!, width: CGFloat) {
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
        shape.strokeEnd = 1
        superLayer.layer.addSublayer(shape)
    }
    
    
    func makeAnimationCircleAndPercent (shape: CAShapeLayer, superLayer: UIView, percent: Int, labelForPercent: UILabel, center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool, fillColor: UIColor!, strokeColor: UIColor!, width: CGFloat, fullCycleInSec: Double) {
        
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
    
    func makeLine(shape: CAShapeLayer, superLayer: UIView, startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat, fillColor: UIColor!, strokeColor: UIColor!,  width: CGFloat){
        
        shape.lineWidth = width
        shape.lineCap = .round
        shape.fillColor = fillColor.cgColor
        shape.strokeEnd = 1
        shape.strokeColor = strokeColor.cgColor
        shape.frame = superLayer.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(
            x: startX,
            y: startY ))
        path.addLine(to: CGPoint(
            x: endX ,
            y: endY))
        shape.path = path.cgPath
        superLayer.layer.addSublayer(shape)
    }
    
    func makeAnimationLine (shape: CAShapeLayer, superLayer: UIView, percent: Int, startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat, fillColor: UIColor!, strokeColor: UIColor!, width: CGFloat, fullCycleInSec: Double){
        
        var count = 0
        let delay = fullCycleInSec / 100
        
        func nextIteration(){
            if count < percent {
                count += 1
                let strokeEnd = CGFloat(count) / CGFloat(100)
                
                shape.lineWidth = width
                shape.lineCap = .round
                shape.fillColor = fillColor.cgColor
                shape.strokeEnd = strokeEnd
                shape.strokeColor = strokeColor.cgColor
                shape.frame = superLayer.bounds
                let path = UIBezierPath()
                path.move(to: CGPoint(
                    x: startX,
                    y: startY ))
                path.addLine(to: CGPoint(
                    x: endX ,
                    y: endY))
                shape.path = path.cgPath
                superLayer.layer.addSublayer(shape)

                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    nextIteration()
                }
            }
        }
        nextIteration()
    }
    
}




