//
//  Mars_Rover_KataTests.swift
//  Mars Rover KataTests
//
//  Created by Carlos Corrêa da Silva on 15/09/2020.
//  Copyright © 2020 Farfetch. All rights reserved.
//

import XCTest
@testable import Mars_Rover_Kata

class Mars_Rover_KataTests: XCTestCase {

    func test_right_rotation() {

        run(command: "R", expecting: "0:0:E")
        run(command: "RR", expecting: "0:0:S")
        run(command: "RRR", expecting: "0:0:W")
        run(command: "RRRR", expecting: "0:0:N")
    }

    func test_left_rotation() {

        run(command: "L", expecting: "0:0:W")
        run(command: "LL", expecting: "0:0:S")
        run(command: "LLL", expecting: "0:0:E")
        run(command: "LLLL", expecting: "0:0:N")
    }

    func test_move_up() {

        run(command: "M", expecting: "0:1:N")
        run(command: "MMM", expecting: "0:3:N")
    }

    func test_move_from_top_to_bottom_when_moving_north() {

        run(command: "MMMMMMMMMM", expecting: "0:0:N")
        run(command: "MMMMMMMMMMMMMMM", expecting: "0:5:N")
    }

    func test_move_right() {

        run(command: "RM", expecting: "1:0:E")
        run(command: "RMMMMM", expecting: "5:0:E")
    }

    func test_move_from_right_to_left_when_moving_east() {

        run(command: "RMMMMMMMMMM", expecting: "0:0:E")
        run(command: "RMMMMMMMMMMMMMMM", expecting: "5:0:E")
    }

    func test_move_left() {

        run(command: "LM", expecting: "9:0:W")
        run(command: "LMMMMM", expecting: "5:0:W")
    }

    func test_move_down() {

        run(command: "LLM", expecting: "0:9:S")
        run(command: "LLMMMMM", expecting: "0:5:S")
    }

    func test_stop_at_obstacle() {

        let obstacle0x4 = CGPoint(x: 0, y: 4)
        let obstacle2x0 = CGPoint(x: 2, y: 0)
        let map = Map(obstacles: [obstacle0x4, obstacle2x0])

        run(with: map, command: "MMMM", expecting: "O:0:3:N")
        run(with: map, command: "RMMMMM", expecting: "O:1:0:E")
    }
}

private extension Mars_Rover_KataTests {

    func run(with map: Map = Map(), command: String, expecting result: String) {

        let rover = Rover(map: map)
        XCTAssertEqual(try? rover.execute(command), result)
    }
}
