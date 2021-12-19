//
//  Sing.swift
//  game
//
//  Created by Валентина Буланова on 28.07.2021.
//

import Foundation
import GameplayKit
let RandomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = RandomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    var emogi: String {
        switch self {
        case .rock:
            return "👊🏻"
        case .paper:
            return "✋🏻"
        case .scissors:
            return "✌🏻"

        }
    }
    
    func takeTurn (_ opponent: Sign) -> GameState {
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return GameState.draw
            case .paper:
                return GameState.loose
            case .scissors:
                return GameState.win
            }
        case .paper:
            switch opponent {
            case .rock:
                return GameState.win
            case .paper:
                return GameState.draw
            case .scissors:
                return GameState.loose
            }
        case .scissors:
            switch opponent {
            case .rock:
                return GameState.loose
            case .paper:
                return GameState.win
            case .scissors:
                return GameState.draw
            }
        }
    }
}
