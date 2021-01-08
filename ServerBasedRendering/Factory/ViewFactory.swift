//
//  ViewFactory.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/6/21.
//

import SwiftUI

/// Create view for each molecule template
///
/// - Parameters:
///   - molecule: The view type.
///   - data: The data that will be supplied to the view
///
/// - Returns: A type erased view
func viewFactory(_ molecule: Molecule, _ data: [String: String]) -> AnyView {
  switch molecule {
  case .circularPhoto:
    let model = PhotoModel(name: data["name", default: ""],
                           photo: data["photo", default: ""])
    return CircularPhotoTemplate(model: model).render()
  case .headLineText:
    let text = data["name", default: ""].capitalized
    return Text(text).font(.headline).toAnyView()
  case .titleText:
    let text = data["name", default: ""].capitalized
    return Text(text).font(.title).toAnyView()
  case .subtitleText:
    let text = data["name", default: ""].capitalized
    return Text(text).font(.subheadline).toAnyView()
  case .textField:
    let text = data["name", default: ""].capitalized
    return TextfieldTemplate(placeholder: text).render()
  case .menuButton:
    let text = data["name", default: ""].capitalized
    return Button(text) {
      print("menu button click")
    }.toAnyView()
  case .presenterButton:
    let text = data["name", default: ""].capitalized
    return Button(text) {
      print("menu button click")
    }.toAnyView()
  }
}
