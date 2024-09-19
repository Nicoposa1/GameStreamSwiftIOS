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
    @State var searchText = ""
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack {
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11)
                HStack{
                    Button(action: search, label: {
                        Image(systemName: "magnifyingglass").foregroundStyle(searchText.isEmpty ? Color(.yellow) : Color("Dark-Cian"))
                    })
                    ZStack(alignment: .leading){
                        if searchText.isEmpty{
                            Text("Buscar un video").foregroundStyle(Color(red: 174/255, green: 177/255, blue: 185/255))
                        }
                        TextField("", text: $searchText).foregroundStyle(.white)
                    }
                }.padding([.top, .leading, .bottom], 11)
                    .background(Color("Blue-Gray"))
                    .clipShape(Capsule()
                    )
            }.padding(.horizontal, 18)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
    
    func search () {
        print("El usuario esta buscando \(searchText)")
    }
}


#Preview {
    Home()
}
