//
//  OrderArchiveView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 18.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct OrderArchiveView: View {
    @ObservedObject var viewModel: OrderArchiveViewModel
    
    var body: some View {
        NavigationView {
            if(viewModel.productList.isEmpty) {
                Text("Nothing here..")
                    .navigationTitle("Order Archive")
            }
            else {
                List {
                    ForEach(viewModel.productList) { product in
                        OrderArchiveItemView(viewModel: OrderArchiveItemViewModel(orderArchiveItem: product, isLiked: viewModel.isLiked(orderedItem: product), handler: { id in
                            viewModel.dataManager.addRemoveLiked(id: id)
                        }))
                    }
                    .onDelete(perform: removeFromArchive)
                }
                .listStyle(.inset)
                .navigationTitle("Order Archive")
            }
        }
    }
    
    private func removeFromArchive(offsets: IndexSet) {
        withAnimation {
            for pos in offsets {
                viewModel.removeFromArchive(at: pos)
            }
        }
    }
}

struct OrderArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        OrderArchiveView(viewModel: OrderArchiveViewModel(dataManager: MockDataManager()))
    }
}
