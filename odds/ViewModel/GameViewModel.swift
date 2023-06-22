//
//  GameViewModel.swift
//  odds
//
//  Created by Hugo Peyron on 22/06/2023.
//

import Foundation
import SwiftUI

class GameOddViewModel : ObservableObject {
    
    @Published var game : Game {
        didSet {
            updateMaxOutcomes()
        }
    }
    
    // New variables to store the maximum values of each outcome
    @Published var maxOutcome1: Double = 0.0
    @Published var maxOutcome2: Double = 0.0
    @Published var maxOutcome3: Double = 0.0
    
    @Published var maxOutcomeBookmaker1 : String = ""
    @Published var maxOutcomeBookmaker2 : String = ""
    @Published var maxOutcomeBookmaker3 : String = ""

    
    @Published var possibleReward : Double = 0.0
    
    // Computed properties
    var bookmakers: [Bookmaker] { game.bookmakers }
    var homeTeam: String { game.homeTeam }
    var awayTeam: String { game.awayTeam }
    var title: String { "\(awayTeam) - \(homeTeam)" }
    


    init(game: Game) {
        self.game = game
        updateMaxOutcomes()
        calculatePossibleReward()
    }

    // Format prices to the desired format
    func formattedPrice(of outcome: Outcome) -> String {
        String(format: "%.2f", outcome.price)
    }
    
    
    func calculatePossibleReward() {
        possibleReward = (1 - (1/maxOutcome1 + 1/maxOutcome2 + 1/maxOutcome3)) * 100
    }
    
    // Update the maximum values of each outcome
    private func updateMaxOutcomes() {
        for bookmaker in game.bookmakers {
            for market in bookmaker.markets {
                if market.outcomes.count >= 3 && market.key == "h2h" {
                    if market.outcomes[0].price > maxOutcome1 {
                          maxOutcome1 = market.outcomes[0].price
                          maxOutcomeBookmaker1 = bookmaker.title
                      }
                      if market.outcomes[1].price > maxOutcome2 {
                          maxOutcome2 = market.outcomes[1].price
                          maxOutcomeBookmaker1 = bookmaker.title
                      }
                      if market.outcomes[2].price > maxOutcome3 {
                          maxOutcome3 = market.outcomes[2].price
                          maxOutcomeBookmaker2 = bookmaker.title
                      }
                }
            }
        }
    }
}
