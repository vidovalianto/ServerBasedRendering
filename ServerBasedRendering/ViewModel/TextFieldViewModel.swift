//
//  TextFieldViewModel.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/8/21.
//

import Combine
import SwiftUI

public final class TextFieldViewModel: ObservableObject {
  @Published public var text = ""
}
