//
//  SettingsView.swift
//  odds
//
//  Created by Ballet Tom on 20/06/2023.
//

import SwiftUI

struct SettingsView: View {
    @Binding var selectedRegion: String
    @Binding var selectedSport: String
    
    var body: some View {
        
        
        Text("Sport")
        Picker("Select Region", selection: $selectedSport) {
            ForEach(sportsPicker.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                Text(key).tag(value)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
        
        Text("Bookmaker Region")
        Picker("Select Region", selection: $selectedRegion) {
            ForEach(regions.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                Text(key).tag(value)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
        
        Spacer()
    }
}
