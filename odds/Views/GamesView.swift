//
//  GameView.swift
//  odds
//
//  Created by Ballet Tom on 20/06/2023.
//

import SwiftUI

struct GamesView: View {
    
    // Declare my view model to get all my variable and logic.
    @ObservedObject var vm : ViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    SettingsView(selectedRegion: $vm.selectedRegion, selectedSport: $vm.selectedSport)
                    
                    FetchDataButton
                    
                    OddScrollingView
                }
                .padding()
            }
        }
    }
    
    var FetchDataButton : some View {
        VStack {
            Text("\(vm.selectedSport.capitalized) in \(vm.selectedRegion.uppercased())")
                .bold()
            Button {
                vm.fetchData()
            } label: {
                HStack {
                    Text("Get odds")
                    Image(systemName: "dollarsign")
                }
            }
            .frame(width: 200)
            .tint(.pink)
            .buttonStyle(.bordered)
        }
    }
    
    var OddScrollingView : some View {
        ForEach(vm.games, id: \.id) { game in
            let gameViewModel = GameOddViewModel(game: game)

            NavigationLink {
                GameOddsView(vm: GameOddViewModel(game: game))
            } label: {
                HStack {
                    Text("\(game.awayTeam) - \(game.homeTeam)")
                    Spacer()
                    Text("\(String(format: "%.2f", gameViewModel.possibleReward))%")
                        .foregroundColor(gameViewModel.possibleReward > 0 ? .green : .red)
                }
            }
        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView(vm: ViewModel())
    }
}
