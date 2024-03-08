//
//  Int+Extension.swift
//  DenemeOrnek5
//
//  Created by Nilgul Cakir on 5.03.2024.
//

import Foundation


extension Int {
    func isPrime() -> Bool {
        guard self > 1 else { return false }
        for i in 2..<self {
            if self % i == 0 {
                return false
            }
        }
        return true
    }
}
