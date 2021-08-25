//
//  InfoView.swift
//  Honeymoon
//
//  Created by Nur Irfan Pangestu on 21/07/21.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 20, content: {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                CreditsView()
                
                HStack {
                    Text("Photos")
                        .foregroundColor(Color.gray)
                    Spacer()
                    Text("Unplash")
                }
                
                Spacer(minLength: 10)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Continue".uppercased())
                })
                .modifier(ButtonModifier())
            }) //: VSTACK
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }) //: ScrollView
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppInfoView(itemOne: "Compability", itemTwo: "iPhone and iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "Nur Irfan Pangestu")
            RowAppInfoView(itemOne: "Designer", itemTwo: "Rika Raudhotul Rizqiyah")
            RowAppInfoView(itemOne: "Website", itemTwo: "swiftuimasterclass.com")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.0.0")
        })
    }
}

struct RowAppInfoView: View {
    
    var itemOne: String
    var itemTwo: String
    
    var body: some View {
        VStack {
            HStack {
                Text(itemOne)
                    .foregroundColor(Color.gray)
                Spacer()
                Text(itemTwo)
            }
            Divider()
        }
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text("Credits")
                .fontWeight(.black)
                .modifier(TitleModifier())
        })
        
        Divider()
        
        Text("Photographers").foregroundColor(Color.gray)
        
        Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
            .multilineTextAlignment(.leading)
            .font(.footnote)
    }
}
