//
//  Textfield.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/8/21.
//

import SwiftUI


/// Create textfield template
///
/// act as a wrapper to SwiftUI version.
/// erase view type
struct TextfieldTemplate: UITemplate {
  let placeholder: String
  
  func render() -> AnyView {
    return TextfieldView(placeholder: placeholder).toAnyView()
  }
}

struct TextfieldView: View {
  let placeholder: String
  @ObservedObject private var textfieldVM = TextFieldViewModel()
  
  var body: some View {
    TextField(self.placeholder,
              text: $textfieldVM.text)
  }
}
