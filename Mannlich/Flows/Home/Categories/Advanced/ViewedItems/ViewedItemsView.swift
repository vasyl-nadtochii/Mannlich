//
//  ViewedItemsView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 18.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct ViewedItemsView: View {
    @ObservedObject var viewModel: ViewedItemsViewModel
    
    var body: some View {
        NavigationView {
            if(viewModel.productList.isEmpty) {
                Text("Nothing here..")
                    .navigationTitle("Ordered Products")
            }
            else {
                List {
                    ForEach(viewModel.productList) { product in
                        ViewedItemView(viewModel: ViewedItemViewModel(viewedItem: product, isLiked: viewModel.isLiked(viewedItem: product), handler: { id in
                            viewModel.dataManager.addRemoveLiked(id: id)
                        }))
                    }
                }
                .listStyle(.inset)
                .navigationTitle("Ordered Products")
            }
        }
    }
}

struct ViewedItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ViewedItemsView(viewModel: ViewedItemsViewModel(dataManager: MockDataManager()))
    }
}
