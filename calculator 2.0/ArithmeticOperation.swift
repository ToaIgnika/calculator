//
//  ArithmeticOperation.swift
//  calculator 2.0
//
//  Created by toaignika on 2018-10-04.
//  Copyright © 2018 toaignika. All rights reserved.
//

import Foundation

ArithmeticOperation {
    let rNum: Double
    let lNum: Double
    
    init(rNum: Double, lNum: Double) {
        self.rNum = rNum
        self.lNum = lNum
    }
    func addition() -> Double {
        result = rNum + lNum
        return result
    }
    func subtraction() -> Double {
        result = rNum - lNum
        return result
    }
    func multiplication() -> Double {
        result = rNum * lNum
        return result
    }
    func division() -> Double {
        if lNum.isZero == false {
            return rNum/lNum
        } else {
            return 0.0
        }
    }
}
