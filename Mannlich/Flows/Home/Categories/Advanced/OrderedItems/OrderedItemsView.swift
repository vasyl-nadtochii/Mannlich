//
//  OrderedItemsView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 17.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct OrderedItemsView: View {
    @ObservedObject var viewModel: OrderedItemsViewModel
    
    var body: some View {
        NavigationView {
            if(viewModel.productList.isEmpty) {
                Text("Nothing here..")
                    .navigationTitle("Ordered Products")
            }
            else {
                List {
                    ForEach(viewModel.productList) { product in
                        OrderedItemView(viewModel: OrderedItemViewModel(orderedItem: product, isLiked: viewModel.isLiked(orderedItem: product), handler: { id in
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

struct OrderedItemsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderedItemsView(viewModel: OrderedItemsViewModel(dataManager: MockDataManager()))
    }
}
