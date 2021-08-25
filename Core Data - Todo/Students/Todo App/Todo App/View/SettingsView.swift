//
//  SettingsView.swift
//  Todo App
//
//  Created by Nur Irfan Pangestu on 19/07/21.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var iconSettings: IconNames
    
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    @State private var isThemeChanged: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0, content: {
                // MARK: - FORM
                Form {
                    // MARK: - SECTION 1
                    Section(header: Text("Choose the app icon")) {
                        Picker(
                            selection: $iconSettings.currentIndex,
                            label:
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                                            .strokeBorder(Color.primary, lineWidth: 2)
                                        
                                        Image(systemName: "paintbrush")
                                            .font(.system(size: 24, weight: .regular, design: .default))
                                            .foregroundColor(Color.primary)
                                    }
                                    .frame(width: 44, height: 44)
                                    
                                    Text("App Icons".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.primary)
                                }, content: {
                                    ForEach(0..<iconSettings.iconName.count) { index in
                                        HStack {
                                            Image(uiImage: UIImage(named: self.iconSettings.iconName[index] ?? "Blue") ?? UIImage())
                                                .renderingMode(.original)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 44, height: 44)
                                                .cornerRadius(8)
                                            
                                            Spacer().frame(width: 8)
                                            
                                            Text(self.iconSettings.iconName[index] ?? "Blue")
                                                .frame(alignment: .leading)
                                        } //: HSTACK
                                        .padding(3)
                                    }
                                }) //: Picker
                            .onReceive([self.iconSettings.currentIndex].publisher.first(), perform: { value in
                                let index = self.iconSettings.iconName.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                                if index != value {
                                    UIApplication.shared.setAlternateIconName(self.iconSettings.iconName[value]) { error in
                                        if let error = error {
                                            print(error.localizedDescription)
                                        } else {
                                            print("Success! You have change the app icon")
                                        }
                                    }
                                }
                            })
                    }
                    .padding(.vertical, 3)
                    
                    // MARK: - SECTION 2
                    Section(
                        header:
                            HStack {
                                Text("Choose the app theme")
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(themes[self.theme.themeSettings].themeColor)
                            }
                    ) {
                        ForEach(themes, id: \.id) { item in
                            Button(action: {
                                self.theme.themeSettings = item.id
                                UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme")
                                self.isThemeChanged.toggle()
                            }, label: {
                                HStack {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(item.themeColor)
                                    Text(item.themeName)
                                }
                            }) //: Button
                            .accentColor(Color.primary)
                        }
                    } //: SECTION 2
                    .padding(.vertical, 3)
                    .alert(isPresented: $isThemeChanged, content: {
                        Alert(
                            title: Text("SUCCESS"),
                            message: Text("App has been changed to the \(themes[self.theme.themeSettings].themeName). Now close and restart it"),
                            dismissButton: .default(Text("OK")))
                    })
                    
                    // MARK: - SECTION 3
                    Section(header: Text("Follow us on social media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://swiftuimasterclass.com")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://twitter.com/robertpetras")
                        FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Course", link: "https://www.udemy.com/user/robert-petras")
                    }
                    .padding(.vertical, 3)
                    
                    // MARK: - SECTION 4
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compability", secondText: "Iphone, Ipad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Nur Irfan Pangestu")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Rika Raudhotul")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    } //: SECTION 4
                    .padding(.vertical, 3)
                } //: FORM
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - FOOTER
                Text("Copyright © All rights reserved.\nBetter Apps ♡ Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
            })  //: VSTACK
            .navigationBarItems(
                trailing:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
            )
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        } //: NAVIGATION
        .accentColor(themes[self.theme.themeSettings].themeColor)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(IconNames())
    }
}
