//
//  ViewedItemView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 18.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct ViewedItemView: View {
    @ObservedObject var viewModel: ViewedItemViewModel
    @State var showingProductScreen = false
    
    var body: some View {
        Button {
            showingProductScreen = true
            viewModel.lastViewedDate = Date()
            viewModel.dateHandler(Date())
        } label: {
            HStack {
                viewModel.viewedItem.product.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .cornerRadius(10)
                    .padding(6)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text(viewModel.viewedItem.product.name)
                        .font(.headline)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                    Text("\(String(format: "%g", viewModel.viewedItem.product.price))$")
                        .foregroundColor(.secondary)
                    Text("Last viewed on \(viewModel.lastViewedDate.stringDate)")
                        .font(.callout)
                        .foregroundColor(.primary)
                }
                    
                Spacer()
                
                Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                    .font(.system(size: 25))
                    .padding(6)
                    .onTapGesture {
                        viewModel.isLiked.toggle()
                        viewModel.handler(viewModel.viewedItem.product.id)
                    }
            }
        }
        .sheet(isPresented: $showingProductScreen) {
            ProductView(viewModel: ProductViewModel(product: viewModel.viewedItem.product))
        }
    }
}

struct ViewedItemView_Previews: PreviewProvider {
    static var previews: some View {
        ViewedItemView(
            viewModel: ViewedItemViewModel(
                viewedItem: MockDataManager.shared.getViewedProductList()![0],
                isLiked: true,
                handler: { _ in },
                dateHandler: { _ in }))
    }
}
