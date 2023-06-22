//
//  ContentView.swift
//  odds
//
//  Created by Ballet Tom on 20/06/2023.
//

import SwiftUI



struct ContentView: View {
    
    // Declare the ViewModel for the entirer app
    @StateObject var vm = ViewModel()
    
    // Set the tap bar default tab to home.
    @State private var selectedTab : Tab = .home
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    switch tab {
                    case .home :
                        Text("home view")
                            .tag(tab)
                    case .odds :
                        GameView(vm: vm)
                            .tag(tab)
                    case .account :
                        Text("\(tab.rawValue) view")
                            .tag(tab)
                    case .settings :
                        SettingsView(selectedRegion: $vm.selectedRegion, selectedSport: $vm.selectedSport)
                            .tag(tab)
                    }
                }
            }
            VStack {
                Spacer()
                TabBarView(selectedTab: $selectedTab)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


