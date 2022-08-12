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
        
        sum += sumForTriples(countedSet, updatedCountedSet)
        
        sum += sumForSingles(
            countedSet,
            updatedCountedSet,
            pointValues: getPointValues()
        )
        
        return sum
    }
    
    // MARK: - Triples
    
    fileprivate func sumForTriples(_ originSet: NSCountedSet, _ updatedCountedSet: NSCountedSet) -> Int {
        var sum = 0
        for element in originSet {
            if originSet.count(for: element) >= 3 {
                sum += getTriplePoints(for: element as! Int)
                removeElement(from: updatedCountedSet, element: element as! Int, times: 3)
            }
        }
        
        return sum
    }
    
    fileprivate func getTriplePoints(for tripleValue: Int) -> Int {
        switch tripleValue {
        case 1:
            return 1000
        case 2...6:
            return tripleValue * 100
        default:
            return 0
        }
    }
    
    // MARK: - Singles
    
    fileprivate func sumForSingles(_ originSet: NSCountedSet, _ updatedCountedSet: NSCountedSet, pointValues: [Int]) -> Int {
        var sum = 0
        for element in pointValues {
            sum += sumForPointValues(originSet, updatedCountedSet, pointValue: element)
            }

        return sum
    }
    
    fileprivate func sumForPointValues(_ originSet: NSCountedSet, _ updatedCountedSet: NSCountedSet, pointValue: Int) -> Int {
        var sum = 0
        for _ in 0..<originSet.count(for: pointValue) {
            sum += getPoints(for: pointValue)
            updatedCountedSet.remove(pointValue)
        }
        
        return sum
    }
    
    fileprivate func getPointValues() -> [Int] {
        [1, 5]
    }
    
    fileprivate func getPoints(for value: Int) -> Int {
        switch value {
        case 1:
            return 100
        case 5:
            return 50
        default:
            return 0
        }
    }
}
    
    // MARK: - helpers
    
    fileprivate func removeElement(from set: NSCountedSet, element: Int, times: Int) {
        for _ in 0..<times {
            set.remove(element)
        }
    }
