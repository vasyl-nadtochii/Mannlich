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
                    ForEach(viewModel.productList) { viewedProduct in
                        ViewedItemView(viewModel: ViewedItemViewModel(viewedItem: viewedProduct, isLiked: viewModel.isLiked(viewedItem: viewedProduct), handler: { id in
                            viewModel.dataManager.addRemoveLiked(id: id)
                        }, dateHandler: { newDate in
                            viewModel.dataManager.addOrUpdateViewed(for: viewedProduct.product, newDate: newDate)
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
