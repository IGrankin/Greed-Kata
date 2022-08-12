//
//  Calculator.swift
//  Greed kata
//
//  Created by Игорь Гранкин on 12.08.2022.
//

import Foundation

struct Output {
    var sum: Int
    var set: NSCountedSet
}

class Calculator {
    
    var rules: [CalculatorRule]!
    
    init(rules: [CalculatorRule]) {
        self.rules = rules
    }
    
    func calculate(_ moves: [Int]) -> Int {
        guard !moves.isEmpty else {
            return 0
        }
        
        var sum = 0
        let countedSet = NSCountedSet(array: moves)
        
        //triple counting
        let tripleRule = rules.first!
        let tripleOutput = tripleRule.sum(with: countedSet)
        sum += tripleOutput.sum
        
        //single counting
        let singleRule = rules.last!
        let singleOutput = singleRule.sum(with: tripleOutput.set)
        sum += singleOutput.sum
        
        return sum
    }
}

// MARK: - helpers

extension NSCountedSet {
    public func removeElement(element: Int, times: Int) {
        for _ in 0..<times {
            self.remove(element)
        }
    }
}
