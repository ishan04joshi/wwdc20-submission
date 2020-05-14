//
//  EmotionScaleView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct EmotionScaleView: View {

    private let titleWidth: CGFloat = 36
    private let spacing: CGFloat = 4
    
    var viewModel: EmotionScaleViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .trailing) {
                HStack {
                    Group {
                        Text(self.viewModel.title)
                            .font(Style.Font.font(size: 22))
                            .bold()
                            .rotationEffect(.degrees(-90), anchor: .center)
                            .frame(width: 256)
                    }.frame(width: self.titleWidth)
                    Spacer()
                }
                GeometryReader { geometry in
                    HStack(alignment: .center, spacing: self.spacing) {
                        ForEach(self.viewModel.scale) { index in
                            self.trapezoid(for: index, in: geometry)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    }.padding([.leading, .trailing], self.spacing / 2)
                }
                .frame(size: self.boundingBox(geometry.size))
            }
        }
    }
    
    private func trapezoid(for index: Int, in geometry: GeometryProxy) -> some View {
        let count = CGFloat(viewModel.scale.count)
        let size = geometry.size
        let fullwidth = size.width
        let index = CGFloat(index)
        
        // width calculations
        let width = ((fullwidth - spacing) / count) - spacing
        let widthLeft = fullwidth - (width * index) - (spacing * index) - spacing

        // height calculations
        let height = size.height - (index * (size.height / count))
        let adjustedHeight = (((height / 2) / (widthLeft + spacing / 2)) * widthLeft)  * 2
        
        // trapezoid inset
        let inset = -(((adjustedHeight / 2) / widthLeft) * (widthLeft - width) - (adjustedHeight / 2))
        
        return Trapezoid(insetAmount: inset)
            .frame(width: width, height: adjustedHeight)
            .foregroundColor(.gray)
    }
    
    private func boundingBox(_ size: CGSize) -> CGSize {
        let width = size.width - titleWidth
        let height = (((size.height / 2) / size.width) * width) * 2
        return CGSize(width: width, height: height)
    }
    
}

struct EmotionScaleView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionScaleView(viewModel: EmotionScaleViewModel(emotion: .anger))
            .background(Color.yellow)
            .frame(width: 360, height: 180)
    }
}
