//
//  Map.swift
//  Mars Rover Kata
//
//  Created by Carlos Corrêa da Silva on 16/09/2020.
//  Copyright © 2020 Farfetch. All rights reserved.
//

import UIKit

struct Map {

    private let MAX_HEIGHT = 10
    private let MAX_WIDTH = 10
    let obstacles: [CGPoint]

    init(obstacles: [CGPoint] = []) {
        self.obstacles = obstacles
    }

    func move(towards direction: Direction, on coordinate: CGPoint) -> CGPoint? {
        var y = coordinate.y
        var x = coordinate.x

        switch direction {
        case .north: y = CGFloat((coordinate.yPosition + 1) % MAX_HEIGHT)
        case .east: x = CGFloat((coordinate.xPosition + 1) % MAX_WIDTH)
        case .west: x = coordinate.xPosition > 0 ? coordinate.x - 1 : CGFloat(MAX_WIDTH - 1)
        case .south: y = coordinate.yPosition > 0 ? coordinate.y - 1 : CGFloat(MAX_HEIGHT - 1)
        }

        let newCoordinate = CGPoint(x: x, y: y)

        return obstacles.contains(newCoordinate) ? nil : newCoordinate
    }
}
extension CGPoint {

    var xPosition: Int { Int(x) }
    var yPosition: Int { Int(y) }
    var toString: String { "\(xPosition):\(yPosition)"}
}

