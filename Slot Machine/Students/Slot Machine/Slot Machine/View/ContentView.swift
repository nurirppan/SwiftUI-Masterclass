//
//  ContentView.swift
//  Slot Machine
//
//  Created by Nur Irfan Pangestu on 16/07/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTY
    
    @State private var showingInfoView: Bool = false
    @State private var reels: Array = [0, 1, 2]
    @State private var highScore: Int = UserDefaults.standard.integer(forKey: "HighScore")
    @State private var coins: Int = 100
    @State private var betAmount: Int = 10
    @State private var isActiveBet10: Bool = true
    @State private var isActiveBet20: Bool = false
    @State private var showingModal: Bool = false
    @State private var animatingSymbol: Bool = false
    @State private var animatingModel: Bool = false
    
    let symbols = ["gfx-bell",
                   "gfx-cherry",
                   "gfx-coin",
                   "gfx-grape",
                   "gfx-seven",
                   "gfx-strawberry"]
    
    // MARK: - FUNCTION
    // SPIN THE REELS
    func spinReels() {
        //        reels[0] = Int.random(in: 0...symbols.count - 1)
        //        reels[1] = Int.random(in: 0...symbols.count - 1)
        //        reels[2] = Int.random(in: 0...symbols.count - 1)
        reels = reels.map({ _ in
            Int.random(in: 0...symbols.count - 1)
        })
        playSound(sound: "spin", type: "mp3")
    }
    
    // CHECK THE WINNING
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
            // PLAYER WINS
            playerWins()
            
            // HIGH SCORE
            if coins > highScore {
                newHighScore()
            } else {
                playSound(sound: "win", type: "mp3")
            }
        } else {
            // PLAYER LOSES
            playerLoses()
        }
    }
    // PLAYER WINS
    func playerWins() {
        coins += betAmount * 10
    }
    
    // NEW HIGHSCORE
    func newHighScore() {
        highScore = coins
        UserDefaults.standard.set(highScore, forKey: "HighScore")
        playSound(sound: "high-score", type: "mp3")
    }
    
    // PLAYER LOSES
    func playerLoses() {
        coins -= betAmount
    }
    
    func activateBet20() {
        betAmount = 20
        isActiveBet10 = false
        isActiveBet20 = true
        playSound(sound: "casino-chips", type: "mp3")
    }
    
    func activateBet10() {
        betAmount = 10
        isActiveBet10 = true
        isActiveBet20 = false
        playSound(sound: "casino-chips", type: "mp3")
    }
    
    // GAME IS OVER
    func isGameOver() {
        if coins <= 0 {
            showingModal = true
            playSound(sound: "game-over", type: "mp3")
        }
    }
    
    func resetGame() {
        UserDefaults.standard.set(0, forKey: "HighScore")
        highScore = 0
        coins = 100
        activateBet10()
        playSound(sound: "chimeup", type: "mp3")
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [colorPink, colorPurple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            // MARK: - INTERFACE
            
            VStack(alignment: .center, spacing: 5, content: {
                // MARK: - HEADER
                LogoView()
                Spacer()
                
                // MARK: - SCORE
                HStack {
                    HStack {
                        Text("your\ncoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifiers())
                        
                    } // HSTACK
                    .modifier(ScoreContainerModifiers())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highScore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifiers())
                        
                        Text("high\nscore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                        
                    } // HSTACK
                    .modifier(ScoreContainerModifiers())
                }
                
                // MARK: - SLOT MACHINE
                VStack(alignment: .center, spacing: 0, content: {
                    // MARK: - REEL #1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifiers())
                            .opacity(animatingSymbol ? 1 : 0)
                            .offset(y: animatingSymbol ? 0 : -50)
                            .animation(.easeOut(duration: Double.random(in: 0.5...0.7)))
                            .onAppear(perform: {
                                self.animatingSymbol.toggle()
                                playSound(sound: "riseup", type: "mp3")
                            })
                    }
                    
                    HStack(alignment: .center, spacing: 0, content: {
                        // MARK: - REEL #2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifiers())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.5...0.9)))
                                .onAppear(perform: {
                                    self.animatingSymbol.toggle()
                                    playSound(sound: "riseup", type: "mp3")
                                })
                        }
                        Spacer()
                        // MARK: - REEL #3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifiers())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.5...1.1)))
                                .onAppear(perform: {
                                    self.animatingSymbol.toggle()
                                    playSound(sound: "riseup", type: "mp3")
                                })
                        }
                    })
                    .frame(maxWidth: 500)
                    
                    // MARK: - SPIN BUTTON
                    Button(action: {
                        withAnimation {
                            self.animatingSymbol = false
                            feedback.impactOccurred()
                        }
                        self.spinReels()
                        withAnimation {
                            self.animatingSymbol = true
                        }
                        self.checkWinning()
                        self.isGameOver()
                    }, label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifiers())
                    })
                }) // Slot Machine
                .layoutPriority(2)
                
                // MARK: - FOOTER
                Spacer()
                
                HStack {
                    // MARK: - BET 20
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            self.activateBet20()
                            feedback.impactOccurred()
                        }, label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet20 ? Color.yellow : Color.white)
                                .modifier(BetNumberModifiers())
                        })
                        .modifier(BetCapsuleModifiers())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .offset(x: isActiveBet20 ? 0 : 20)
                            .opacity(isActiveBet20 ? 1: 0)
                            .modifier(CasinoChipsModifiers())
                    }
                    
                    Spacer()
                    
                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .offset(x: isActiveBet10 ? 0 : 20)
                            .opacity(isActiveBet10 ? 1 : 0)
                            .modifier(CasinoChipsModifiers())
                        
                        Button(action: {
                            self.activateBet10()
                            feedback.impactOccurred()
                        }, label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet10 ? Color.yellow : Color.white)
                                .modifier(BetNumberModifiers())
                        })
                        .modifier(BetCapsuleModifiers())
                    }
                }
            }) // VSTACK
            
            // MARK: - BUTTONS
            // RESET
            .overlay(
                Button(action: {
                    self.resetGame()
                    feedback.impactOccurred()
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                .modifier(ButtonModifiers()), alignment: .topLeading
            )
            
            // INFO
            .overlay(
                Button(action: {
                    self.showingInfoView = true
                    feedback.impactOccurred()
                }, label: {
                    Image(systemName: "info.circle")
                })
                .modifier(ButtonModifiers()), alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
            .blur(radius: $showingModal.wrappedValue ? 5 : 0, opaque: false)
            
            // MARK: - POPUP
            if $showingModal.wrappedValue {
                ZStack {
                    colorTransparentBlack.edgesIgnoringSafeArea(.all)
                    
                    // MODAL
                    VStack(spacing: 0) {
                        Text("GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(colorPink)
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 16, content: {
                            Image("gfx-seven-reel")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 72)
                            
                            Text("Bad luck! You lost all of the coins. \nLet's play agin!")
                                .font(.system(.body, design: .rounded))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.gray)
                                .layoutPriority(1)
                            
                            Button(action: {
                                self.showingModal = false
                                self.animatingModel = false
                                self.activateBet10()
                                self.coins = 100
                                feedback.impactOccurred()
                            }, label: {
                                Text("New Game".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .accentColor(colorPink)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.75)
                                            .foregroundColor(colorPink)
                                    )
                            })
                        })
                        Spacer()
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: colorTransparentBlack, radius: 6, x: 0, y: 8)
                    .opacity($animatingModel.wrappedValue ? 1 : 0)
                    .offset(y: $animatingModel.wrappedValue ? 0 : -100)
                    .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
                    .onAppear(perform: {
                        self.animatingModel = true
                    })
                }
            }
            
        } // ZStack
        .sheet(isPresented: $showingInfoView, content: {
            InfoView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
