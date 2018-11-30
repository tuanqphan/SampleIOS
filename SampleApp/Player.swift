//
//  Player.swift
//  SampleApp
//
//  Created by Tuan Phan on 4/26/18.
//  Copyright © 2018 Tuan Phan. All rights reserved.
//
//
//
//  

import Foundation

struct Player {
    
    // MARK: - Properties
    var name: String?
    var game: String?
    var rating: Int
}

final class SampleData {
    
    static func generatePlayersData() -> [Player] {
        return [
            Player(name: "Bill Evans", game: "Tic-Tac-Toe", rating: 4),
            Player(name: "Oscar Peterson", game: "Spin the Bottle", rating: 5),
            Player(name: "Dave Brubeck", game: "Texas Hold 'em Poker", rating: 2),
            Player(name: "Cill Evans", game: "Tic-Tac-Toe", rating: 4),
            Player(name: "Pscar Peterson", game: "Spin the Bottle", rating: 5),
            Player(name: "Eave Brubeck", game: "Texas Hold 'em Poker", rating: 2)
        ]
    }
}
