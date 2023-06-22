//
//  GameOddsView.swift
//  odds
//
//  Created by Hugo Peyron on 22/06/2023.
//

import SwiftUI

struct GameOddsView: View {
    
    @StateObject var vm: GameOddViewModel
    
    var body: some View {
        ScrollView {
            Header
            
            HStack {
                VStack {
                    Text(vm.maxOutcomeBookmaker1)
                    Text("\(vm.maxOutcome1)")
                }
                VStack {
                    Text(vm.maxOutcomeBookmaker2)

                    Text("\(vm.maxOutcome2)")
                }
                VStack {
                    Text(vm.maxOutcomeBookmaker2)
                    Text("\(vm.maxOutcome3)")
                }
            }
            
            Text("\(vm.possibleReward)%")
                .bold()
                .foregroundColor(.red)
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(vm.bookmakers, id: \.key) { bookmaker in
                    VStack(spacing: 10) {
                        ForEach(bookmaker.markets, id: \.key) { market in
                            HStack {
                                Text("\(bookmaker.title)")
                                Spacer()
                                Text(vm.formattedPrice(of: market.outcomes[0]))
                                    .frame(width: 60, alignment: .trailing)
                                Text(vm.formattedPrice(of: market.outcomes[1]))
                                    .frame(width: 60, alignment: .trailing)
                                Text(vm.formattedPrice(of: market.outcomes[2]))
                                    .frame(width: 60, alignment: .trailing)
                            }
                        }
                    }
                }
            }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(15)
            .padding()
            .navigationTitle(vm.title)
        }
    }

    var Header : some View {
        HStack{
            Text("Bookmaker")
            Spacer()
            Text("Team 1")
                .frame(width: 60, alignment: .trailing)
            Text("Team 2")
                .frame(width: 60, alignment: .trailing)
            Text("Draw")
                .frame(width: 60, alignment: .trailing)
        }
        .bold()
        .padding()
        .padding(.horizontal)
    }
}


//struct GameOddsView: View {
//
//    @StateObject var vm: GameOddViewModel
//
//    var body: some View {
//        ScrollView {
//            Header
//
//            VStack(alignment: .leading, spacing: 10) {
//                ForEach(vm.game.bookmakers, id: \.key) { bookmaker in
//                    VStack(spacing: 10) {
//                        ForEach(bookmaker.markets, id: \.key) { market in
//                            if market.key == "h2h" {
//                            HStack {
//                                Text("\(bookmaker.title)")
//                                Spacer()
//                                Text(String(format: "%.2f", market.outcomes[0].price))
//                                    .frame(width: 60, alignment: .trailing)
//                                Text(String(format: "%.2f", market.outcomes[1].price))
//                                    .frame(width: 60, alignment: .trailing)
//                                Text(String(format: "%.2f", market.outcomes[2].price))
//                                    .frame(width: 60, alignment: .trailing)
//                                }
//                            }
//
//                        }
//                    }
//                }
//            }
//            .padding()
//            .background(.thinMaterial)
//            .cornerRadius(15)
//            .padding()
//            .navigationTitle("\(vm.game.awayTeam) - \(vm.game.homeTeam)")
//        }
//    }
//
//    var Header : some View {
//        HStack{
//            Text("Bookmaker")
//            Spacer()
//            Text("Team 1")
//                .frame(width: 60, alignment: .trailing)
//            Text("Team 2")
//                .frame(width: 60, alignment: .trailing)
//            Text("Draw")
//                .frame(width: 60, alignment: .trailing)
//        }
//        .bold()
//        .padding()
//        .padding(.horizontal)
//    }
//}
//
//struct GameOddsView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameOddsView(vm: GameOddViewModel(game: Game(id: "1", sportKey: "Bob", sportTitle: "Bob", commenceTime: "", homeTeam: "Manchester City", awayTeam: "Manchester Unity", bookmakers: [Bookmaker(key: "1", title: " ", lastUpdate: "jh", markets: [Market(key: "1233", lastUpdate: "", outcomes: [Outcome(name: "", price: 2.0), Outcome(name: "", price: 2.0), Outcome(name: "", price: 2.0)])])])))
//    }
//}
