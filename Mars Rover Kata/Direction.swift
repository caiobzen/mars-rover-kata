//
//  Direction.swift
//  Mars Rover Kata
//
//  Created by Carlos Corrêa da Silva on 15/09/2020.
//  Copyright © 2020 Farfetch. All rights reserved.
//

import Foundation

enum DirectionError: Error {
    case invalidDirection
}

struct FaceDirection {

    var value: String
    let left: String
    let right: String

    init(value: String, left: String, right: String) {

        self.value = value
        self.left = left
        self.right = right
    }
}

enum Direction: CaseIterable {

    case north
    case east
    case south
    case west

    func facing() -> FaceDirection {
        switch self {
        case .north: return FaceDirection(value: "N", left: "W", right: "E")
        case .east: return FaceDirection(value: "E", left: "N", right: "S")
        case .south: return FaceDirection(value: "S", left: "E", right: "W")
        case .west: return FaceDirection(value: "W", left: "S", right: "N")
        }
    }

    func right() throws -> Direction { try self.facing(direction: self.facing().right) }
    func left() throws -> Direction { try self.facing(direction: self.facing().left) }

    private func facing(direction: String) throws -> Direction {
        if let direction = Direction.allCases.first(where: { $0.facing().value == direction }) {
            return direction
        } else {
            throw DirectionError.invalidDirection
        }
    }
}
