import SwiftUI

struct GamesView: View {
    
    @ObservedObject var allCharacters = ViewModel()
    @State var characterviewIsActive: Bool = false
    @State var selectedCharacter: Character? = nil
    
    let formatterGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            
            VStack {
                Text("Rick and Morty Characters")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                
                ScrollView {
                    LazyVGrid(columns: formatterGrid, spacing: 20) {
                        ForEach(allCharacters.characters, id: \.id) { character in
                            VStack {
                                AsyncImage(url: URL(string: character.image)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                Text(character.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(character.status)
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                            .onTapGesture {
                                selectedCharacter = character
                                characterviewIsActive = true
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 6)
        }
        .onAppear {
            self.allCharacters.fetchData()
        }
        .fullScreenCover(isPresented: $characterviewIsActive) {
            if let character = selectedCharacter {
                CharacterDetailView(character: character)
            }
        }
    }
}

struct CharacterDetailView: View {
    var character: Character
    
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            
            VStack {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                
                Text(character.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                Text("Status: \(character.status)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                Text("Species: \(character.species)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                Text("Origin: \(character.origin.name)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    GamesView()
}
