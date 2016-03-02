//
//  EyeView.swift
//  WeChatEye
//
//  Created by Rabe.☀️ on 16/3/2.
//  Copyright © 2016年 Rabe.W. All rights reserved.
//

import UIKit

class EyeView: UIView {
    private lazy var eyeFirstLightLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
        let startAngle = CGFloat((230 / 180) * M_PI)
        let endAngle = CGFloat((265 / 180) * M_PI)
        let path = UIBezierPath(arcCenter:center, radius: CGRectGetWidth(self.frame) * 0.1, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        layer.borderColor = UIColor.blackColor().CGColor
        layer.lineWidth = 5
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        
        return layer
    }()
    
    private lazy var eyeSecondLightLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
        let startAngle = CGFloat((211 / 180) * M_PI)
        let endAngle = CGFloat((220 / 180) * M_PI)
        let path = UIBezierPath(arcCenter:center, radius: CGRectGetWidth(self.frame) * 0.1, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        layer.borderColor = UIColor.blackColor().CGColor
        layer.lineWidth = 5
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        
        return layer
    }()
    
    private lazy var eyeBallLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
        let startAngle = CGFloat((0 / 180) * M_PI)
        let endAngle = CGFloat((360 / 180) * M_PI)
        let path = UIBezierPath(arcCenter:center, radius: CGRectGetWidth(self.frame) * 0.15, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        layer.borderColor = UIColor.blackColor().CGColor
        layer.lineWidth = 1
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        layer.anchorPoint = CGPointMake(0.5, 0.5)
        
        return layer
    }()
    
    private lazy var topEyeSocketLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
        let startAngle = CGFloat((0 / 180) * M_PI)
        let endAngle = CGFloat((360 / 180) * M_PI)
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, CGRectGetHeight(self.frame) / 2))
        path.addQuadCurveToPoint(CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) / 2), controlPoint: CGPointMake(CGRectGetWidth(self.frame) / 2, center.y - center.y - 20))
        layer.borderColor = UIColor.blackColor().CGColor
        layer.lineWidth = 1
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        
        return layer
    }()
    
    private lazy var bottomEyeSocketLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
        let startAngle = CGFloat((0 / 180) * M_PI)
        let endAngle = CGFloat((360 / 180) * M_PI)
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, CGRectGetHeight(self.frame) / 2))
        path.addQuadCurveToPoint(CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) / 2), controlPoint: CGPointMake(CGRectGetWidth(self.frame) / 2, center.y + center.y + 20))
        layer.borderColor = UIColor.blackColor().CGColor
        layer.lineWidth = 1
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(eyeFirstLightLayer)
        layer.addSublayer(eyeSecondLightLayer)
        layer.addSublayer(eyeBallLayer)
        layer.addSublayer(topEyeSocketLayer)
        layer.addSublayer(bottomEyeSocketLayer)
        setupAnimation()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAnimation() {
        eyeFirstLightLayer.lineWidth = 0
        eyeSecondLightLayer.lineWidth = 0
        eyeBallLayer.opacity = 0
        bottomEyeSocketLayer.strokeStart = 0.5
        bottomEyeSocketLayer.strokeEnd = 0.5
        topEyeSocketLayer.strokeStart = 0.5
        topEyeSocketLayer.strokeEnd = 0.5
    }
    
    func animationWithOffSet(y: CGFloat) {
        let flag = frame.origin.y * 2 - 20
        if y < flag {
            if eyeFirstLightLayer.lineWidth < 5 {
                eyeFirstLightLayer.lineWidth += 1
                eyeSecondLightLayer.lineWidth += 1
            }
        }
        
        if y < flag - 20 {
            if eyeBallLayer.opacity <= 1 {
                eyeBallLayer.opacity += 0.1
            }
        }
        
        if (y < flag - 40) {
            if (topEyeSocketLayer.strokeEnd < 1 && topEyeSocketLayer.strokeStart > 0) {
                topEyeSocketLayer.strokeEnd += 0.1;
                topEyeSocketLayer.strokeStart -= 0.1;
                bottomEyeSocketLayer.strokeEnd += 0.1;
                bottomEyeSocketLayer.strokeStart -= 0.1;
            }
        }
        
        if (y > flag - 40) {
            if (topEyeSocketLayer.strokeEnd > 0.5 && topEyeSocketLayer.strokeStart < 0.5) {
                topEyeSocketLayer.strokeEnd -= 0.1;
                topEyeSocketLayer.strokeStart += 0.1;
                bottomEyeSocketLayer.strokeEnd -= 0.1;
                bottomEyeSocketLayer.strokeStart += 0.1;
            }
        }
        
        if (y > flag - 20) {
            if (eyeBallLayer.opacity >= 0.0) {
                eyeBallLayer.opacity -= 0.1;
            }
        }
        
        if (y > flag) {
            if (eyeFirstLightLayer.lineWidth > 0) {
                eyeFirstLightLayer.lineWidth -= 1;
                eyeSecondLightLayer.lineWidth -= 1;
            }
        }
    }
}
