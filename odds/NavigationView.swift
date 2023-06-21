//
//  NavigationView.swift
//  odds
//
//  Created by Ballet Tom on 20/06/2023.
//

import SwiftUI

struct NavigationView: View {
    
    @Binding var currentPage: Int
    
    var body: some View {
        
        ZStack {
            Color(.gray)
            HStack {
                Button {
                    currentPage = 0
                } label: {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
                .foregroundColor(currentPage==0 ? .green : .black)
                
                
                Button {
                    currentPage = 1
                } label: {
                    VStack {
                        Image(systemName: "sportscourt.circle")
                        Text("Odds")
                    }
                }
                .foregroundColor(currentPage==1 ? .green : .black)
                
                Button {
                    currentPage = 2
                } label: {
                    VStack {
                        Image(systemName: "person")
                        Text("Account")
                    }
                }
                .foregroundColor(currentPage==2 ? .green : .black)
                
                Button {
                    currentPage = 3
                } label: {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    
                }
                .foregroundColor(currentPage==3 ? .green : .black)
            }
        }
        .frame(width: .infinity, height: 60)
    }
}

struct preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

