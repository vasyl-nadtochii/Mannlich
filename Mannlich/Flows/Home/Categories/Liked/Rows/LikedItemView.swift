//
//  LikedItemView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct LikedItemView: View {
    @ObservedObject var viewModel: LikedItemViewModel
    @State var showingProductScreen = false
    
    var body: some View {
        Button {
            showingProductScreen = true
        } label: {
            HStack {
                viewModel.likedProduct.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .cornerRadius(10)
                    .padding(6)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text(viewModel.likedProduct.name)
                        .font(.headline)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                    Text("\(String(format: "%g", viewModel.likedProduct.price))$")
                        .foregroundColor(.secondary)
                }
                    
                Spacer()
            }
        }
        .sheet(isPresented: $showingProductScreen) {
            ProductView(viewModel: ProductViewModel(product: viewModel.likedProduct))
        }
    }
}

struct LikedItemView_Previews: PreviewProvider {
    static var previews: some View {
        LikedItemView(viewModel: LikedItemViewModel(likedProduct: MockDataManager.shared.productsList![0]))
    }
}
