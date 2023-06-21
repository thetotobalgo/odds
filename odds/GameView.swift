//
//  GameView.swift
//  odds
//
//  Created by Ballet Tom on 20/06/2023.
//

import SwiftUI

struct GameView: View {
    
    @State var games : [Game] = []
    
    //NEVER CHANGES
    let apiKey = "b133382dcf33d120ca3366b536afb278"
    let apiUrl = "https://api.the-odds-api.com/v4/sports"
    let markets = "h2h"
    let oddsFormat = "decimal"
    
    
    //STATE VARIABLES
    @State var selectedSport: String = "soccer"
    
    
    @State var selectedRegion: String = "eu"
    @State var selectedSportKey: String = "soccer_epl"
    @State var currentPage: Int = 1
    
    @State var odd1: Double = 0.0
    
    var body: some View {
        
        
        
        NavigationStack {
            VStack {
                
                if(currentPage==0){
                    Spacer()
                }
                if(currentPage==1){ //Games
                    
                    Text(selectedSport)
                    Button {
                        fetchData()
                    } label: {
                        Text("Get oddssss")
                    }
                    .frame(width: 200)
                    .tint(.pink)
                    .buttonStyle(.bordered)
                    
                    
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(games, id: \.id) { game in
                                
                                NavigationLink {
                                    Text("\(game.awayTeam)")
                                } label: {
                                    HStack {
                                        Text("\(game.awayTeam) - \(game.homeTeam)")
                                        Spacer()
                                    }
                                }

                                
                                
       
                            }
                        }
                        .padding()
                        
                    }
                }
                if(currentPage==3) {
                    SettingsView(selectedRegion: $selectedRegion, selectedSport: $selectedSport)
                }
                if(currentPage==2) {
                    Spacer()
                }
                
                NavigationView(currentPage: $currentPage)
                    
            }
        }
        
        
    }
    
    func fetchData() {
        
        guard let url = URL(string: "\(apiUrl)/\(selectedSportKey)/odds?apiKey=\(apiKey)&regions=\(selectedRegion)&markets=\(markets)&oddsFormat=\(oddsFormat)")
        else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    games = try decoder.decode([Game].self, from: data)
                    print(games)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
