//
//  Rover.swift
//  Mars Rover Kata
//
//  Created by Carlos Corrêa da Silva on 15/09/2020.
//  Copyright © 2020 Farfetch. All rights reserved.
//

import UIKit

class Rover {

    private let map: Map
    private var direction: Direction = .north
    private var coordinate: CGPoint = .zero

    init(map: Map = Map()) {
        self.map = map
    }

    func execute(_ input: String) throws -> String {

        var obstacleMarker = ""

        try input.forEach { command in
            if command == "R" { direction = try direction.right() }
            if command == "L" { direction = try direction.left() }
            if command == "M" {
                if let newCoordinate = map.move(towards: direction, on: coordinate) {
                    coordinate = newCoordinate
                } else {
                    obstacleMarker = "O:"
                }
            }
        }

        return "\(obstacleMarker)\(coordinate.toString):\(direction.facing().value)"
    }
}
