//
//  Date+Extension.swift
//  DenemeOrnek5
//
//  Created by Nilgul Cakir on 5.03.2024.
//

import Foundation

extension Date {
    func daysBetween(_ otherDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: otherDate)
        return components.day ?? 0
    }
}
