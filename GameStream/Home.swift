import SwiftUI
import AVKit

struct Home: View {
    @State var selectedTab: Int = 2
    var body: some View {
        TabView(selection: $selectedTab) {
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

    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor(Color("colorTab"))
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
}

struct HomeScreen: View {
    @State var searchText = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Marine").ignoresSafeArea()
                VStack {
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11)
                    HStack {
                        Button(action: search, label: {
                            Image(systemName: "magnifyingglass").foregroundStyle(searchText.isEmpty ? Color(.yellow) : Color("Dark-Cian"))
                        })
                        ZStack(alignment: .leading) {
                            if searchText.isEmpty {
                                Text("Buscar un video").foregroundStyle(Color(red: 174/255, green: 177/255, blue: 185/255))
                            }
                            TextField("", text: $searchText).foregroundStyle(.white)
                        }
                    }.padding([.top, .leading, .bottom], 11)
                        .background(Color("Blue-Gray"))
                        .clipShape(Capsule())
                    ScrollView(showsIndicators: false) {
                        SubModuleHome()
                    }
                }.padding(.horizontal, 18)
            }
            .navigationBarHidden(true)
        }
    }

    func search() {
        print("El usuario está buscando \(searchText)")
    }
}

struct SubModuleHome: View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos: [String] = [
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"
    ]
    
    var body: some View {
        VStack {
            Text("THE MOST POPULAR")
                .font(.title3)
                .foregroundStyle(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack {
                Button(action: {
                    url = urlVideos[0]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    VStack(spacing: 0) {
                        Image("The Witcher 3").resizable().scaledToFill()
                        Text("The Witcher 3").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("Blue-Gray"))
                    }
                })
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 42, height: 42)
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
                .navigationDestination(isPresented: $isPlayerActive) {
                VideoPlayer(player: AVPlayer(url: URL(string: url)!))
                    .frame(width: 400, height: 300)
            }
        }
        Text("SUGGESTED CATEGORIES FOR YOU")
            .font(.title3)
            .foregroundStyle(.white)
            .bold()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 12)
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                Button(action: {print("FPS")}, label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("Blue-Gray"))
                            .frame(width: 160, height: 90)
                        Image("FPS1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42)
                    }
                   
                })
                Button(action: {print("RPG")}, label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("Blue-Gray"))
                            .frame(width: 160, height: 90)
                        Image("rpg-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42)
                    }
                   
                })
                Button(action: {print("OW")}, label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("Blue-Gray"))
                            .frame(width: 160, height: 90)
                        Image("open-world-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42)
                    }
                   
                })
            }
        }
        Text("RECOMMENDED FOR YOU")
            .font(.title3)
            .foregroundStyle(.white)
            .bold()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                Button(action: {
                    url = urlVideos[1]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    Image("Abzu")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 135)
                })
                Button(action: {
                    url = urlVideos[2]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    Image("Crash Bandicoot")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 135)
                })
                Button(action: {
                    url = urlVideos[3]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    Image("DEATH STRANDING")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 135)
                })
            }
        }
        Text("VIDEOS YOU MIGHT LIKE")
            .font(.title3)
            .foregroundStyle(.white)
            .bold()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                Button(action: {
                    url = urlVideos[6]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    Image("Grand Theft Auto V")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 135)
                })
                Button(action: {
                    url = urlVideos[4]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    Image("Cuphead")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 135)
                })
                Button(action: {
                    url = urlVideos[5]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    Image("Hades")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 135)
                })
            }
        }
        
    }
}

#Preview {
    Home()
}
