//
//  NavigationBarView.swift
//  Touchdown
//
//  Created by Nur Irfan Pangestu on 09/07/21.
//

import SwiftUI

struct NavigationBarView: View {
    
    @State private var isAnimate: Bool = false
    
    var body: some View {
        HStack {
            Button(action: {
                feedback.impactOccurred()
            }, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            })
            Spacer()
            LogoView()
                .opacity(isAnimate ? 1 : 0)
                .offset(x: 0, y: isAnimate ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimate.toggle()
                    }
                })
            Spacer()
            Button(action: {
                feedback.impactOccurred()
            }, label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 14, height: 14, alignment: .center)
                        .offset(x: 13, y: -10)
                }
                
            })
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
