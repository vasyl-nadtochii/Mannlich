//
//  ProductView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 29.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct ProductView: View {
    @ObservedObject var viewModel: ProductViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    viewModel.product.image
                        .resizable()
                        .centerCropped()
                        .aspectRatio(5/4, contentMode: .fit)
                    
                    Text(viewModel.product.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .padding(.top)
                        
                    Text("\(String(format: "%g", viewModel.product.price))$")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .padding(.leading)
                    
                    Divider()
                }
                .navigationTitle("Product Overview")
             }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(viewModel: ProductViewModel(product: MockDataManager.shared.productsList![0]))
    }
}
