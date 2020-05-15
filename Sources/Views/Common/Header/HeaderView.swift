//
//  HeaderView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct HeaderView: View  {
    
    @State var title: String
    @EnvironmentObject var router: Router
    
    var body: some View {
        HStack {
            Text(title)
                .font(Style.Font.font(size: 48))
                .foregroundColor(Style.Color.black)
                .kerning(0.5)
                .multilineTextAlignment(.leading)
            Spacer()
            if router.current != .dashboard() {
                Button(action: { self.router.current = .dashboard() }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(Style.Color.black)
                        .frame(width: 24, height: 24, alignment: .center)
                }
            }
        }.fillHorizontally()
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Hello :)")
    }
}
