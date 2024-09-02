//
//  ContentView.swift
//  GameStream
//
//  Created by Nicolas Posa on 01/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Spacer()
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
            VStack{
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 40)
                StartAndRegisterView()
            }
        }
    }
}

struct StartAndRegisterView: View {
    
    @State var typeLogin = true
    
    var body: some View{
        VStack{
            HStack {
                Spacer()
                Button("LOGIN") {
                    typeLogin = true
                    print("Pantalla inicio sesion")
                }.foregroundColor(typeLogin ? .white : .gray)
                Spacer()
                Button("SIGNIN") {
                    typeLogin = false
                    print("Pantalla de registro")
                }.foregroundColor(typeLogin ? .gray : .white)
                Spacer()
            }
            Spacer(minLength: 42)
            if typeLogin == true {
                LoginView()
            } else {
                SigninView()
            }
        }
    }
}

struct LoginView: View {
    @State var mail = ""
    @State var password = ""
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Mail").foregroundStyle(Color("Dark-Cian"))
                ZStack(alignment: .leading){
                    if mail.isEmpty {
                        Text(verbatim: "example@gmail.com").font(.caption).foregroundStyle(.gray)
                        
                    }
                    TextField("", text: $mail)
                    
                }
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                VStack(alignment: .leading) {
                    Text("Password").foregroundStyle(.white)
                    ZStack(alignment: .leading) {
                        if password.isEmpty {
                            Text("*******").font(.caption).foregroundStyle(.gray)
                        }
                        SecureField("", text: $password)
                    }
                    
                }
                Divider().frame(height: 1).background(.white).padding(.bottom)
                Text("Forgot your password?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundStyle(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Button(action: login, label: <#T##() -> Label#>)
            }
        }.padding(.horizontal, 77)
    }
}

struct SigninView:View {
    var body: some View {
        Text("Im signinView")
    }
}

#Preview {
    ContentView()
}
