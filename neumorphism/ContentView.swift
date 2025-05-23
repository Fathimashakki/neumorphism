//
//  ContentView.swift
//  neumorphism
//
//  Created by Shaan on 22/05/25.
//

import SwiftUI

// MARK: - Welcome View
struct WelcomeView: View {
    @Binding var showMusicPlayer: Bool

    var body: some View {
        ZStack{
            bgColor
                .ignoresSafeArea()

            VStack(spacing: -100) {
               
                LottieButton(animationName: "anime")

                
                  
                RoundedRectangle(cornerRadius: 25)
                   
                    .fill(bgColor.opacity(0.98))
                    .frame(width: 300, height: 260)
                    .shadow(color: .white.opacity(0.3), radius: 8, x: -6, y: -6)
                    .shadow(color: .gray.opacity(0.5), radius: 8, x: 6, y: 6)
                    .padding(.bottom,39)
                    
                    .overlay(
                        VStack(spacing: 20) {
                            Text("Discover 70 million songs\nAd free!!")
                                .font(.system(size: 30, weight: .bold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                              
                            Text("Download songs and albums to listen offline wherever you are.")
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .padding(.horizontal, 20)
                        }
                    ).padding(.top,50)
            }
        }
    }
}


// MARK: - Music Player View
struct ContentView: View {
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()

            VStack(spacing: 25) {
                Text("Now Playing")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 5)

                HStack {
                    neumorphicIcon("chevron.left")
                    Spacer()
                    neumorphicIcon("list.bullet")
                }
                .padding(.top, -60)
                .padding(.horizontal, 5)

                VStack(spacing: 8) {
                    Text("Girl like me")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Shakira ft Black Eyed Peas")
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.top, 75)

                Image("image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .neumorphicEffect()

                VStack {
                    Slider(value: .constant(0.3))
                        .accentColor(.white.opacity(0.8))
                    HStack {
                        Text("1:10")
                        Spacer()
                        Text("3:45")
                    }
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
                }
                .padding(.horizontal)

                HStack(spacing: 40) {
                    controlButton(icon: "backward.fill")
                    controlButton(icon: "play.fill", size: 70)
                    controlButton(icon: "forward.fill")
                }

                Spacer()
            }
            .padding()
        }
    }

    func controlButton(icon: String, size: CGFloat = 50) -> some View {
        Circle()
            .fill(bgColor)
            .frame(width: size, height: size)
            .neumorphicEffect()
            .overlay(
                Image(systemName: icon)
                    .font(.system(size: size / 2))
                    .foregroundColor(.white)
            )
    }

    func neumorphicIcon(_ name: String) -> some View {
        Circle()
            .fill(bgColor)
            .frame(width: 45, height: 45)
            .neumorphicEffect()
            .overlay(
                Image(systemName: name)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            )
    }
}
struct Song: Identifiable {
    let id = UUID()
    let title: String
    var isFavorite: Bool
}

struct randomView: View {
    @Binding var showMusicPlayer: Bool
    @State private var songs = [
        Song(title: "Me Enamoré", isFavorite: true),
        Song(title: "Nada", isFavorite: true),
        Song(title: "Chantaje", isFavorite: true),
        Song(title: "When a woman", isFavorite: true),
        Song(title: "Amarillo", isFavorite: true)
    ]

    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            VStack(spacing: 12) {
                Spacer(minLength: 40)
                
                VStack(spacing: 4) {
                    Text("Shakira")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .neumorphicEffect()
                    Text("El Dorado")
                        .foregroundColor(.white.opacity(0.9))
                }
                
                Image("shakira")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .shadow(color: .white.opacity(0.3), radius: 10, x: -6, y: -6)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 6, y: 6)
                    .padding(.top, 10)
                
                Text("MY PLAYLIST")
                    .foregroundColor(.white.opacity(0.8))
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(spacing: 30) {
                        ForEach($songs) { $song in
                            HStack {
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(.white)
                                Text(song.title)
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                                Spacer()
                                Button(action: {
                                    song.isFavorite.toggle()
                                }) {
                                    Image(systemName: song.isFavorite ? "heart.fill" : "heart")
                                        .foregroundColor(song.isFavorite ? .red : .white)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 10)
                
                Spacer()
                
                // Bottom Tab Bar with RND Button
                HStack {
                    Spacer()
                    Image(systemName: "house.fill").foregroundColor(.white)
                    Spacer()
                    Image(systemName: "checkmark.circle.fill").foregroundColor(.white)
                    Spacer()
                    
                    // RND Button
                    Button(action: {
                        songs.shuffle()
                    }) {
                        VStack {
                            Image(systemName: "shuffle")
                                .foregroundColor(.white)
                            Text("RND")
                                .foregroundColor(.white)
                                .font(.caption2)
                        }
                    }

                    Spacer()
                    Image(systemName: "magnifyingglass").foregroundColor(.white)
                    Spacer()
                    Image(systemName: "person.fill").foregroundColor(.white)
                    Spacer()
                }
                .padding(.bottom,10)
                .background(Color.black.opacity(0.3))
                .clipShape(Capsule())
            }
            .padding()
        }
    }
}

            
            
       

extension View {
    func neumorphicEffect() -> some View {
        self
            .shadow(color: Color.white.opacity(0.2), radius: 8, x: -6, y: -6)
            .shadow(color: Color.black.opacity(0.6), radius: 8, x: 6, y: 6)
    }
}

var bgColor: Color {
    Color(red: 0.6, green: 0.5, blue: 0.7)
}


#Preview("Welcome Screen") {
    WelcomeView(showMusicPlayer: .constant(false))
}

#Preview("Music Player") {
    ContentView()
}
#Preview("random Player") {
    randomView(showMusicPlayer: .constant(false))
}
