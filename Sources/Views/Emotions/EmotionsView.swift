//
//  EmotionsView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 12/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct EmotionsView: View {
    
    var viewModel: EmotionsViewModel
    
    var body: some View {
        VStack {
            HeaderView(title: self.viewModel.title)
            Spacer()
            EmotionsPickerView(viewModel: EmotionsPickerViewModel())
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                .aspectRatio(1, contentMode: .fit)
            Spacer()
            RotationView()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding(EdgeInsets(top: 32, leading: 32, bottom: 32, trailing: 32))
        .background(Style.Color.background)
    }
    
}


struct EmotionsView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsView(viewModel: EmotionsViewModel())
    }
}
