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
    
    @State var typeLogin = false
    
    var body: some View{
        VStack{
            HStack {
                Spacer()
                Button("LOGIN") {
                    typeLogin = true
                    print("Pantalla inicio sesion")
                }.foregroundColor(typeLogin ? .white : .gray)
                Spacer()
                Button("REGISTER") {
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
                
                Button(action: loginAction, label: {
                    Text("LOG IN")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                            .stroke(Color("Dark-Cian"),lineWidth: 1.0).shadow(color: .white,radius: 6))
                })
                Spacer()
            }
            Text("Login with social media").foregroundStyle(.white).padding(.top, 80).padding(.bottom, 25)
            HStack{
                Spacer()
                Text("Facebook")
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
                    .background(Color("Blue-Gray"))
                    .cornerRadius(6.0)
                    .fontWeight(.bold)
                Spacer()
                Text("Twitter")
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
                    .background(Color("Blue-Gray"))
                    .cornerRadius(6.0)
                    .fontWeight(.bold)
                Spacer()
            }
        }.padding(.horizontal, 77)
    }
}

func loginAction() {
    print("Estoy iniciando sesion   ")
}

struct SigninView:View {
    @State var mail = ""
    @State var password = ""
    @State var repeatPassword = ""
    var body: some View {
        ScrollView{
            VStack(alignment: .center){
                Text("Select profile image")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text("You can change or choose them later")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                Button(action: takePhoto, label: {
                    ZStack{
                        Image("perfil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Image(systemName: "camera")
                            .foregroundStyle(.white)
                    }
                }).padding(.bottom)
                    
            }
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
                Divider().frame(width: 300, height: 1).background(.white).padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Repeat password").foregroundStyle(.white)
                    ZStack(alignment: .leading) {
                        if repeatPassword.isEmpty {
                            Text("*******").font(.caption).foregroundStyle(.gray)
                        }
                        SecureField("", text: $password)
                    }
                    
                }
                Divider().frame(width: 300, height: 1).background(.white).padding(.bottom)
                
                
                Button(action: registerAction, label: {
                    Text("REGISTER")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                            .stroke(Color("Dark-Cian"),lineWidth: 1.0).shadow(color: .white,radius: 6))
                })
            }
            Text("Register with social media").foregroundStyle(.white).padding(.top, 20).padding(.bottom, 25)
            HStack{
                Spacer()
                Text("Facebook")
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
                    .background(Color("Blue-Gray"))
                    .cornerRadius(4.0)
                    .fontWeight(.bold)
                Spacer()
                Text("Twitter")
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
                    .background(Color("Blue-Gray"))
                    .cornerRadius(4.0)
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer()
        }.padding(.horizontal, 77)
    }
}

func registerAction() {
    print("Registrate")
}

func takePhoto() {
    print("tomar foto action")
}

#Preview {
    ContentView()
}
