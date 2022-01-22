//
//  CartView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            if(viewModel.cartList.isEmpty) {
                Text("Nothing here..")
                    .navigationTitle("Your Cart")
            }
            else {
                List {
                    ForEach(viewModel.cartList) { cartProduct in
                        CartItemView(viewModel: CartItemViewModel(cartProduct: cartProduct, handler: { newAmount in
                            viewModel.dataManager.changeCartItemAmount(id: cartProduct.product.id, newValue: newAmount)
                        }))
                    }
                    .onDelete(perform: removeFromLiked)
                }
                .listStyle(.inset)
                .navigationTitle("Your Cart")
                .toolbar {
                    Button("Make an Order") {
                        // TODO: implement order stuff
                        print("!ORDER!")
                    }
                    .font(.callout.weight(.medium))
                    .foregroundColor(.white)
                    .padding(10)
                    .background(.black)
                    .cornerRadius(.infinity)
                }
            }
        }
    }
    
    private func removeFromLiked(offsets: IndexSet) {
        withAnimation {
            for pos in offsets {
                viewModel.removeFromCart(at: pos)
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel(dataManager: MockDataManager()))
    }
}
