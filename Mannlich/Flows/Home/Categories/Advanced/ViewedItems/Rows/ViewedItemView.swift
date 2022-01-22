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
    
    var body: some View {
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
                Text("\(String(format: "%g", viewModel.viewedItem.product.price))$")
                    .foregroundColor(.secondary)
                Text("Last viewed on \(viewModel.viewedItem.lastViewedDate.stringDate)")
                    .font(.callout)
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
}

struct ViewedItemView_Previews: PreviewProvider {
    static var previews: some View {
        ViewedItemView(viewModel: ViewedItemViewModel(viewedItem: MockDataManager.shared.getViewedProductList()![0], isLiked: true, handler: { _ in }))
    }
}
