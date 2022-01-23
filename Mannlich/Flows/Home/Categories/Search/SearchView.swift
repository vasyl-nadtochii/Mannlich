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
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 12.5) {
                    ForEach(viewModel.searchList) { product in
                        SearchItemView(viewModel: SearchItemViewModel(
                            product: product, isLiked: viewModel.isLiked(product: product), handler: { id in
                            viewModel.dataManager.addRemoveLiked(id: id)
                        }))
                        .aspectRatio(5/7, contentMode: .fill)
                    }
                }
            }
            .navigationTitle("Search")
            .padding(.horizontal, 10)
            .onAppear(perform: {
                viewModel.loadList()
            })
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(dataManager: MockDataManager()))
    }
}
