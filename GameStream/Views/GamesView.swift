//
//  GamesView.swift
//  RickAndMortyApp
//
//  Created by Nicolas Posa on 23/09/2024.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var allCharacters = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if allCharacters.characters.isEmpty {
                    ProgressView("Loading characters...")
                } else {
                    List(allCharacters.characters, id: \.id) { character in
                        HStack {
                            AsyncImage(url: URL(string: character.image)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                            
                            VStack(alignment: .leading) {
                                Text(character.name)
                                    .font(.headline)
                                Text("Species: \(character.species)")
                                    .font(.subheadline)
                                Text("Status: \(character.status)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Characters")
            .onAppear {
                if !allCharacters.characters.isEmpty {
                    print("First character: \(allCharacters.characters[0].name)")
                }
            }
        }
    }
}

#Preview {
    GamesView()
}
