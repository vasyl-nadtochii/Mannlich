//
//  SearchView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.searchList) { product in
                            SearchItemView(viewModel: SearchItemViewModel(product: product))
                                .frame(height: geometry.size.width / 2)
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .padding(.horizontal, 10)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(dataManager: MockDataManager()))
    }
}
