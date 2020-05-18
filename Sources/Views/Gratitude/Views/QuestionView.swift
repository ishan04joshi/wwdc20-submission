//
//  QuestionView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    
    let title: String
    let placeholder: String
    @Binding var answer: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text(title)
                .font(Style.Font.font(style: .largeTitle))
                .foregroundColor(Style.Color.black)
                .bold()
                .multilineTextAlignment(.center)
                .frame(height: 40, alignment: .center)
            CustomTextField(
                placeholder: Text(placeholder).foregroundColor(Style.Color.gray),
                text: $answer
            )
                .font(Style.Font.chalk(style: .largeTitle))
                .accentColor(Style.Color.black)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .multilineTextAlignment(.center)
        }.padding([.leading, .trailing], 12)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(
            title: "I am greatuful to", placeholder: "my mom...", answer: .constant("")
        )
    }
}
