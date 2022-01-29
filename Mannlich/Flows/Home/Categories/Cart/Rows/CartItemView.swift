//
//  CartItemView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct CartItemView: View {
    @ObservedObject var viewModel: CartItemViewModel
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                viewModel.cartProduct.product.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .cornerRadius(10)
                    .padding(6)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text(viewModel.cartProduct.product.name)
                        .font(.headline)
                        .lineLimit(1)
                    Text("\(String(format: "%g", viewModel.cartProduct.product.price))$")
                        .foregroundColor(.secondary)
                }
                    
                Spacer()
                
                Text("Size: ")
                    .font(.callout)
                
                Picker(selection: $viewModel.size, label: Text("")) {
                    ForEach(viewModel.sizes, id: \.self) { size in
                        Text("\(size)").tag(size)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: geometry.size.width / 6, height: 100)
                .compositingGroup()
                .clipped(antialiased: true)
            }
        }
        .frame(height: 100)
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(viewModel: CartItemViewModel(cartProduct: MockDataManager.shared.cartProducts[0], handler: { _ in }))
    }
}
