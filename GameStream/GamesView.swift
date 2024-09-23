//
//  GamesView.swift
//  GameStream
//
//  Created by Nicolas Posa on 23/09/2024.
//

import SwiftUI
    
struct GamesView: View {
    var body: some View {
        Text("GamesView")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
                    print("onAppear")
                }
            )
    }
}

#Preview {
    GamesView()
}
