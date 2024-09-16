//
//  Home.swift
//  GameStream
//
//  Created by Nicolas Posa on 15/09/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView(){
            Text("Pantalla Perfil").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            Text("Pantalla Games").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }
            Text("Pantalla Home").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Pantalla Favorites").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
        }
        
    }
}

#Preview {
    Home()
}
