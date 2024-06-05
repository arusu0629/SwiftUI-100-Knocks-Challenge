//
//  Double+.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/05.
//

import Foundation

extension Double {
    /// 小数点以下の桁数を指定して切り捨てる
    func truncated(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded(.towardZero) / divisor
    }
}
