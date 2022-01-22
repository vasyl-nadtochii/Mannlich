//
//  LikedView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct LikedView: View {
    @ObservedObject var viewModel: LikedViewModel
    
    var body: some View {
        NavigationView {
            if(viewModel.likedList.isEmpty) {
                Text("Nothing here..")
                    .navigationTitle("Liked")
            }
            else {
                List {
                    ForEach(viewModel.likedList) { product in
                        LikedItemView(viewModel: LikedItemViewModel(likedProduct: product))
                    }
                    .onDelete(perform: removeFromLiked)
                }
                .listStyle(.inset)
                .navigationTitle("Liked")
            }
        }
        .onAppear() {
            viewModel.loadLiked()
        }
    }
    
    private func removeFromLiked(offsets: IndexSet) {
        withAnimation {
            for pos in offsets {
                viewModel.removeLiked(at: pos)
            }
        }
    }
}

struct LikedView_Previews: PreviewProvider {
    static var previews: some View {
        LikedView(viewModel: LikedViewModel(dataManager: MockDataManager()))
    }
}
