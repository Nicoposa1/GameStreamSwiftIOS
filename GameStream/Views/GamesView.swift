//
//  GamesView.swift
//  RickAndMortyApp
//
//  Created by Nicolas Posa on 23/09/2024.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var allCharacters = ViewModel()
    @State var characterviewIsActive: Bool = false
    @State var url:String = ""
    @State var title:String = ""
    @State var episode:Int = 0
    @State var image:String = ""
    @State var characters: [Character] = []
    
    let formatterGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        
        ZStack{
            Color("Marine")
            VStack{
                
                Text("Games")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                
            }.padding(.horizontal, 6)
        }
        
        
        Text("Hello, World!")
        .onAppear {
                self.allCharacters.fetchData()
            }
        
        VStack {
            
        }
 
    }
}

#Preview {
    GamesView()
}
