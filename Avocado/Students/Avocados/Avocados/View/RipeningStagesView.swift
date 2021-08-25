//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by Nur Irfan Pangestu on 14/07/21.
//

import SwiftUI

struct RipeningStagesView: View {
    
    var ripeningStages: [Ripening] = ripeningData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            Spacer()
            HStack(alignment: .center, spacing: 25, content: {
                ForEach(ripeningStages) { item in
                    RipeningView(ripening: item)
                }
            })
            .padding(.vertical)
            .padding(.horizontal, 25)
            Spacer()
        }) // ScrollView
        .edgesIgnoringSafeArea(.all)
    }
}

struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesView(ripeningStages: ripeningData)
    }
}
