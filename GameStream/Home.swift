//
//  Home.swift
//  GameStream
//
//  Created by Nicolas Posa on 15/09/2024.
//

import SwiftUI

struct Home: View {
    @State var selectedTab:Int = 2
    var body: some View {
        TabView(selection: $selectedTab ){
            Text("Pantalla Perfil").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }.tag(0)
            Text("Pantalla Games").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }.tag(1)
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(2)
            Text("Pantalla Favorites").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }.tag(3)
        }
        .accentColor(.white)
    }
    init(){
            
            UITabBar.appearance().backgroundColor = UIColor(Color("colorTab"))
//            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
//            UITabBar.appearance().isTranslucent = true
            
        }

}


struct HomeScreen: View {
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack {
                Text("Hola")
            }.padding(.horizontal, 18)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}


#Preview {
    Home()
}
