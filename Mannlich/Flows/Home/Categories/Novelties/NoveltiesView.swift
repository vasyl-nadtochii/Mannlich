//
//  NoveltiesView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct NoveltiesView: View {
    var body: some View {
        NavigationView {
            List {
                PageView(pages: MockDataManager().announcementsList!.map {
                    FeatureCard(announcement: $0)
                })
                .aspectRatio(3 / 2, contentMode: .fit)
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("What's New")
        }
    }
}

struct NoveltiesView_Previews: PreviewProvider {
    static var previews: some View {
        NoveltiesView()
    }
}
