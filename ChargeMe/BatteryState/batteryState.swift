//
//  butteryState.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/03/12.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit


class BatteryState {
    var bsBar: UIView?
    
    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
    }

    func updateBsBar(mainView: UIView) {
        let mainWidth = mainView.frame.width
        let mainHeight = mainView.frame.height
        let batteryLevel = UIDevice.current.batteryLevel
        let barWidth = mainWidth * CGFloat(batteryLevel)
        
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: barWidth, height: mainHeight))
        
        
        if self.isCharging() {
            view1.backgroundColor = UIColor.green
        } else {
            view1.backgroundColor = UIColor.brown
        }
        mainView.addSubview(view1)
    }
    
    func CurrentBatteryLevel()->Int {
        return Int((UIDevice.current.batteryLevel + 0.005) * 100)
    }
    
    func isNeededToCharge()->Bool {
        if  CurrentBatteryLevel() < UserDefaults.alertBatteryLevel {
            return true
        } else {
            return false
        }
    }
    
    func isCharging()-> Bool {
        let currentBatteryState = UIDevice.current.batteryState
        if currentBatteryState == UIDevice.BatteryState.charging {
            return true
        } else {
            return false
        }
    }
    
    func changeWidthOf(UIView: UIView)-> UIView {
        let baseWidth = UIView.frame.width
        let batteryLevel = UIDevice.current.batteryLevel
        var changedWidth: CGFloat
        if batteryLevel == -1 {
            changedWidth = baseWidth * 0.5
        } else {
            changedWidth = baseWidth * CGFloat(batteryLevel)
        }
        
        UIView.frame.insetBy(dx: UIView.frame.height, dy: changedWidth)
        return UIView
    }
}
