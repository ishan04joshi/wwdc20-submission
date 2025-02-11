//
//  GratitudeView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct GratitudeView: View {
    
    @EnvironmentObject private var router: Router
    
    @ObservedObject var viewModel: GratitudeViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer(minLength: 12)
            GratitudeTitleView()
            Spacer(minLength: 12)
            Spacer()
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "bookmark.fill")
                            .resizable()
                            .foregroundColor(Style.Color.black)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: .center)
                            .offset(x: 0, y: -4)
                    }.padding(.trailing, 64)
                    Spacer()
                }
                VStack(alignment: .center) {
                    Spacer()
                    personQuestion
                        .foregroundColor(Style.Color.red)
                        .accentColor(Style.Color.red)
                    Spacer()
                    reasonQuestion
                        .foregroundColor(Style.Color.green)
                        .accentColor(Style.Color.green)
                    Spacer()
                    actionQuestion
                        .foregroundColor(Style.Color.blue)
                        .accentColor(Style.Color.blue)
                    Spacer()
                }
            }
            .fill()
            .aspectRatio(1, contentMode: .fit)
            .frame(maxHeight: 1000)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .padding(EdgeInsets(top: 24, leading: 64, bottom: 24, trailing: 64))
            Spacer()
            controls
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
}

// MARK: - Subviews
extension GratitudeView {
    private var personQuestion: some View {
        QuestionView(
            title: viewModel.personQuestion,
            placeholder: viewModel.personPlaceholder,
            answer: $viewModel.person
        )
    }
    private var reasonQuestion: some View {
        QuestionView(
            title: viewModel.reasonQuestion,
            placeholder: viewModel.reasonPlaceholder,
            answer: $viewModel.reason
        )
    }
    private var actionQuestion: some View {
        QuestionView(
            title: viewModel.actionQuestion,
            placeholder: viewModel.actionPlaceholder,
            answer: $viewModel.action
        )
    }
    private var controls: some View {
        ZStack {
            Button(action: {
                self.viewModel.save()
                self.router.current = .dashboard()
            }) {
                Text(Strings.save)
                    .font(Style.Font.font(style: .headline))
                    .foregroundColor(.white)
                    .bold()
                    .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                    .background(Style.Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
        }.padding(.all, 12)
    }
}

struct GratitudeView_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeView(viewModel: GratitudeViewModel(store: Store()))
            .environmentObject(Router())
    }
}
