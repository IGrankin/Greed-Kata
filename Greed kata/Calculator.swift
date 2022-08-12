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
        self.rules = rules.sorted { $0.priority.rawValue < $1.priority.rawValue }
    }
    
    func calculate(_ moves: [Int]) -> Int {
        guard !moves.isEmpty, !rules.isEmpty else {
            return 0
        }
        
        var sum = 0
        let countedSet = NSCountedSet(array: moves)
        var output = Output(sum: sum, set: countedSet)
        
        for rule in rules {
            output = rule.sum(with: output.set)
            sum += output.sum
        }
        
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
