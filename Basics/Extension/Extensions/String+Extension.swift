//
//  File.swift
//  DenemeOrnek5
//
//  Created by Nilgul Cakir on 5.03.2024.
//

extension String {
    func isPalindrome() -> Bool {
        let cleanString = self.lowercased().filter { $0.isLetter }
        return cleanString == String(cleanString.reversed())
    }
}
