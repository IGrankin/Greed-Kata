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
        self.rules = rules.sorted { $0.priority > $1.priority }
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
    
    public func intArray() -> Array<Int> {
        var resultArray: Array<Int> = []
        
        for element in self {
            let count = count(for: element)
            resultArray.add(element as! Int, times: count)
        }
        
        return resultArray
    }
}

extension Array where Element == Int {
    mutating func add(_ element: Int, times: Int) {
        for _ in 0..<times {
            self.append(element)
        }
    }
}
