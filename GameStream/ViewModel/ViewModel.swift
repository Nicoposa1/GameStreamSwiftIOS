//
//  ViewModel.swift
//  RickAndMortyApp
//
//  Created by Nicolas Posa on 25/09/2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var characters = [Character]()
    @Published var info: Info?
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                return
            }
            
            guard let jsonData = data else {
                print("No data received")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(RickAndMortyResponse.self, from: jsonData)
                
                DispatchQueue.main.async {
                    self.info = decodedData.info
                    self.characters = decodedData.results
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
