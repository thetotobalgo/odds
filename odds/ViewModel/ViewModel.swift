//
//  ViewModel.swift
//  odds
//
//  Created by Hugo Peyron on 22/06/2023.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject {
    
    @Published var games : [Game] = []
    
    //NEVER CHANGES
    let apiKey = "b133382dcf33d120ca3366b536afb278"
    let apiUrl = "https://api.the-odds-api.com/v4/sports"
    let markets = "h2h"
    let oddsFormat = "decimal"
    
    //STATE VARIABLES
    @Published var selectedSport: String = "soccer"
    
    @Published var selectedRegion: String = "eu"
    @Published var selectedSportKey: String = "soccer_epl"
    @Published var odd1: Double = 0.0
    
    func fetchData() {
        
        guard let url = URL(string: "\(apiUrl)/\(selectedSportKey)/odds?apiKey=\(apiKey)&regions=\(selectedRegion)&markets=\(markets)&oddsFormat=\(oddsFormat)")
        else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in // capture self weakly to avoid retain cycle
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let games = try decoder.decode([Game].self, from: data)
                    DispatchQueue.main.async { // make sure to update @Published properties on the main thread
                        self?.games = games
                    }
                    print(games)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }
}

