//
//  View+ToAnyView.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/7/21.
//

import SwiftUI

/// erase view type
extension View {
 func toAnyView() -> AnyView {
   return AnyView(self)
 }
}
