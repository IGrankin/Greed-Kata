//
//  Calculator.swift
//  Greed kata
//
//  Created by Игорь Гранкин on 12.08.2022.
//

import Foundation

class Calculator {
    func calculate(_ moves: [Int]) -> Int {
        guard !moves.isEmpty else {
            return 0
        }
        
        var sum = 0
        
        if moves.contains(1) {
            sum += 100
        }
        
        if moves.contains(5) {
            sum += 50
        }
        
        return sum
    }
}
