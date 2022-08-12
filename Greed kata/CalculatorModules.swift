//
//  CalculatorModules.swift
//  Greed kata
//
//  Created by Игорь Гранкин on 12.08.2022.
//

import Foundation

protocol CalculatorRule: AnyObject {
    func sum(with originSet: NSCountedSet) -> Output
    func getPoints(for value: Int) -> Int
    var priority: Int { get }
}

// MARK: - Straight

public class StraightRule: CalculatorRule {
    var priority: Int = 10
    
    func sum(with originSet: NSCountedSet) -> Output {
        let array = (originSet.allObjects as! Array<Int>).sorted { $0 < $1 }
        var straightArray = true
        var sum = 0
        let outputSet = originSet.copy() as! NSCountedSet
        
        for index in 0..<array.count - 1 {
            if straightArray, array[index+1] - array[index] == 1 {
                continue
            } else {
                straightArray = false
                break
            }
        }
        
        if straightArray {
            sum += getPoints(for: 0)
            outputSet.removeAllObjects()
        }
        
        return Output(sum: sum, set: outputSet)
    }
    
    func getPoints(for value: Int) -> Int {
        return 1200
    }
}

// MARK: - N Of Kind

public class SameInRowRule: CalculatorRule {
    
    var repeatableCount: Int!
    var priority: Int
    
    init(repeatableCount: Int) {
        self.repeatableCount = repeatableCount
        priority = repeatableCount
    }
    
    func sum(with originSet: NSCountedSet) -> Output {
        var sum = 0
        let outputSet: NSCountedSet = originSet.copy() as! NSCountedSet
        
        for element in originSet {
            if originSet.count(for: element) >= repeatableCount {
                sum += getPoints(for: element as! Int)
                outputSet.removeElement(element: element as! Int, times: repeatableCount)
            }
        }
        
        return Output(sum: sum, set: outputSet)
    }
    
    // 3 100
    // 4 100 * 2
    // 5 100 * 4
    // 6 100 * 8
    func getInRowMultiplier(for repeatableCount: Int) -> Int {
        switch repeatableCount {
        case 3:
            return 1
        case 4:
            return 2
        case 5:
            return 4
        case 6:
            return 8
        default:
            return 1
        }
    }
    
    func getPoints(for value: Int) -> Int {
        switch value {
        case 1:
            return 1000 * getInRowMultiplier(for: repeatableCount)
        case 2...6:
            return value * 100 * getInRowMultiplier(for: repeatableCount)
        default:
            return 0
        }
    }
}

// MARK: - Single

public class SingleRule: CalculatorRule {
    var priority: Int = 1
    
    func sum(with originSet: NSCountedSet) -> Output {
        var sum = 0
        var outputSet: NSCountedSet = originSet.copy() as! NSCountedSet
        
        for element in getPointValues() {
            let output = sumForPointValues(outputSet, pointValue: element)
            sum += output.sum
            outputSet = output.set
            }

        return Output(sum: sum, set: outputSet)
    }
    
    fileprivate func sumForPointValues(_ originSet: NSCountedSet, pointValue: Int) -> Output {
        var sum = 0
        let outputSet: NSCountedSet = originSet.copy() as! NSCountedSet
        
        for _ in 0..<originSet.count(for: pointValue) {
            sum += getPoints(for: pointValue)
            outputSet.remove(pointValue)
        }
        
        return Output(sum: sum, set: outputSet)
    }
    
    fileprivate func getPointValues() -> [Int] {
        [1, 5]
    }
    
    func getPoints(for value: Int) -> Int {
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

