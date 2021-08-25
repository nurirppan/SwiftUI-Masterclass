//
//  InfoView.swift
//  Slot Machine
//
//  Created by Nur Irfan Pangestu on 16/07/21.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "Iphone, Ipad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "Nur Irfan Pangestu")
                    FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
                    FormRowView(firstItem: "Music", secondItem: "Nur")
                    FormRowView(firstItem: "Website", secondItem: "www.kompas.co.id")
                    FormRowView(firstItem: "Copyright", secondItem: "© 2020 All right reserved")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        })
        .padding(.top, 40)
        .overlay(
            Button(action: {
                audioPlayer?.stop()
                feedback.impactOccurred()
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
            })
            .padding(.top, 30)
            .padding(.trailing, 20)
            .accentColor(Color.secondary)
            ,alignment: .topTrailing
        )
        .onAppear(perform: {
            playSound(sound: "background-music", type: "mp3")
        })
    }
}

struct FormRowView: View {
    
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundColor(Color.gray)
            Spacer()
            Text(secondItem)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}


