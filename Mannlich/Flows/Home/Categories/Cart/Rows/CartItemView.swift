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
    @State var showingProductScreen = false
    
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
                        .foregroundColor(.primary)
                    Text("Size: \(viewModel.size)")
                        .foregroundColor(.primary)
                    Text("\(String(format: "%g", viewModel.cartProduct.product.price))$")
                        .foregroundColor(.secondary)
                }
                    
                Spacer()
                
                Text("Amount:")
                    .font(.callout)
                    .foregroundColor(.primary)
                
                Picker(selection: $viewModel.amount, label: Text("")) {
                    ForEach(1...30, id: \.self) { amount in
                        Text("\(amount)").tag(amount)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: geometry.size.width / 6, height: 100)
                .compositingGroup()
                .clipped(antialiased: true)
            }
            
            .onTapGesture(perform: {
                showingProductScreen = true
            })
            .sheet(isPresented: $showingProductScreen) {
                ProductView(viewModel: ProductViewModel(product: viewModel.cartProduct.product))
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
