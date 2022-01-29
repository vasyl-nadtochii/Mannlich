//
//  Image.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 29.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
            .resizable()
            .scaledToFill()
            .frame(width: geo.size.width, height: geo.size.height)
            .clipped()
        }
    }
}
