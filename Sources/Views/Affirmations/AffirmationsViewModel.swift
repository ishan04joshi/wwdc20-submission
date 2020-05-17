//
//  AffirmationsViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

final class AffirmationsViewModel {
    
    private let store: Store
    
    var title: String { Exercise.affirmations.title.capitalized }
    
    init(store: Store) {
        self.store = store
    }
    
}
