//
//  OrderedItemView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 17.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct OrderedItemView: View {
    @ObservedObject var viewModel: OrderedItemViewModel
    
    var body: some View {
        HStack {
            viewModel.orderedItem.product.image
                .resizable()
                .scaledToFill()
                .frame(width: 75, height: 75)
                .cornerRadius(10)
                .padding(6)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(viewModel.orderedItem.product.name)
                    .font(.headline)
                    .lineLimit(1)
                Text("\(String(format: "%g", viewModel.orderedItem.product.price))$")
                    .foregroundColor(.secondary)
                Text("State: \(viewModel.orderedItem.status.rawValue)")
                    .font(.callout)
            }
                
            Spacer()
            
            Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                .font(.system(size: 25))
                .padding(6)
                .onTapGesture {
                    viewModel.isLiked.toggle()
                    viewModel.handler(viewModel.orderedItem.product.id)
                }
        }
    }
}

struct OrderedItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderedItemView(viewModel: OrderedItemViewModel(orderedItem: MockDataManager.shared.getOrderedProductList()![0], isLiked: true, handler: { _ in }))
        OrderedItemView(viewModel: OrderedItemViewModel(orderedItem: MockDataManager.shared.getOrderedProductList()![0], isLiked: false, handler: { _ in })).preferredColorScheme(ColorScheme.dark)
    }
}
