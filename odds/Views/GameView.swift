//
//  GameView.swift
//  odds
//
//  Created by Ballet Tom on 20/06/2023.
//

import SwiftUI

struct GameView: View {
    
    // Declare my view model to get all my variable and logic.
    @ObservedObject var vm : ViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    FetchDataButton
                    
                    OddScrollingView
                }
                .padding()
            }
        }
    }
    
    var FetchDataButton : some View {
        VStack {
            Text(vm.selectedSport.capitalized)
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
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(vm: ViewModel())
    }
}
