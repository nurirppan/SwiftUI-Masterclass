//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Nur Irfan Pangestu on 06/07/21.
//

import SwiftUI

struct SettingsRowView: View {
    
    var name: String
    var content: String? = nil
    var linkLable: String? = nil
    var linkDestination: String? = nil
    
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkLable != nil && linkDestination != nil) {
                    Link(linkLable!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "-", content: "-")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsRowView(
                name: "-",
                linkLable: "SwiftUI Masterslass",
                linkDestination: "swiftuimasterclass.com")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
