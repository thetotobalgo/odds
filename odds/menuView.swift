//
//  Menu.swift
//  odds
//
//  Created by Ballet Tom on 15/06/2023.
//

import SwiftUI

///MENU
struct MenuView: View {
    @State var currentPage : Int = 0
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    //Account - Login - Create account
                } label: {
                    Label("Help", systemImage: "book")
                    
                }
                
                Button {
                    //
                } label: {
                    Label("Account", systemImage: "person.crop.circle")
                    
                }
            }
            
            
            /// Title
            Text("ourOdds")
                .bold()
                .font(.system(size: 50))
                .padding()
            
            
            //Text("ourOdds is a sports betting app that provides you with real-time odds and betting information for a wide range of sports events. Stay informed and make well-informed betting decisions with the latest odds from various bookmakers")
            //   .padding()
            
            Text("Available Sports :")
                .bold()
                .font(.system(size: 30))
            
            
            ///SOCCER
            Button {
                currentPage = 2
            } label: {
                Text("Soccer")
                    .frame(width: UIScreen.main.bounds.width / 2)
            }
            .buttonStyle(.bordered)
            .tint(.black)
            
            ///FOOTBALL
            Button {
                currentPage = 3
            } label: {
                Text("Football")
                    .frame(width: UIScreen.main.bounds.width / 2)
                
            }
            .buttonStyle(.bordered)
            .tint(.black)
            
            ///TENNIS
            Button {
                currentPage = 4
            } label: {
                Text("Tennis")
                    .frame(width: UIScreen.main.bounds.width / 2)
            }
            .buttonStyle(.bordered)
            .tint(.black)
            
            
            
            Spacer()
            
            HStack {
                Button {
                    //
                } label: {
                    Label("Subscribe", systemImage: "lightbulb")
                    
                }
                
                
                Button {
                    //
                } label: {
                    Label("Settings", systemImage: "gear")
                    
                }
            }
            
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}


