//
//  TapBar.swift
//  odds
//
//  Created by Hugo Peyron on 22/06/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "house"
    case odds = "dice"
    case account = "person"
    case settings = "gearshape.2"
}

struct TabBarView: View {
    
    @Binding var selectedTab : Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .home:
            return .blue
        case .odds:
            return  .purple
        case .account :
            return   .gray
        case .settings :
            return .pink
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: tab == selectedTab ? fillImage : tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(tab == selectedTab ? tabColor : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
        }
        .frame(width: nil, height: 60)
        .background(.thinMaterial)
        .cornerRadius(10)
        .padding()
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .constant(.home))
    }
}


