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
        
        let countedSet = NSCountedSet(array: moves)
        let updatedCountedSet = countedSet
        
        for element in countedSet {
            if countedSet.count(for: element) == 3 {
                sum += getPoints(for: element as! Int)
                removeTripleElement(from: updatedCountedSet, element: element as! Int)
            }
        }
        
        
        if updatedCountedSet.contains(1) {
            sum += 100
        }
        
        if updatedCountedSet.contains(5) {
            sum += 50
        }
        
        return sum
    }
    
    func removeTripleElement(from set: NSCountedSet, element: Int) {
        for _ in 0...2 {
            set.remove(element)
        }
    }
    
    func getPoints(for tripleValue: Int) -> Int {
        switch tripleValue {
        case 1:
            return 1000
        case 2...6:
            return tripleValue * 100
        default:
            return 0
        }
    }
}
