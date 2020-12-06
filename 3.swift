//
//  3.swift
//  aoc2020
//
//  Created by Ville Saarinen on 6.12.2020.
//

import Foundation

func countTrees(_ map: [String], right: Int, down: Int) -> Int {
    var currentColumn = 0
    var currentRow = 0
    var treeCount = 0
    
    while currentRow < map.count {
        let row = map[currentRow]
        if row[row.index(row.startIndex, offsetBy: currentColumn % row.count)] == "#" {
            treeCount += 1
        }
        currentColumn += right
        currentRow += down
    }
    
    return treeCount
}

func aoc3() {
    if let map = readTextFile(path: "/Users/ville/Repos/adventofcode-2020/aoc2020/3.txt") {
        // Part 1
        print("Tree count: \(countTrees(map, right: 3, down: 1))")
        
        // Part 2
        let result = [
            (right: 1, down: 1),
            (right: 3, down: 1),
            (right: 5, down: 1),
            (right: 7, down: 1),
            (right: 1, down: 2),
        ].reduce(1, { result, slope in result * countTrees(map, right: slope.right, down: slope.down) })
        print("Multipled count: \(result)")
    }
}
