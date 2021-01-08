//
//  MoleculesFactory.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/6/21.
//

import SwiftUI

enum Molecule: String, Decodable, CodingKey {
  case circularPhoto = "circular_photo",
       headLineText = "headLine_text",
       titleText = "title_text",
       subtitleText = "subtitle_text",
       textField = "text_field",
       menuButton = "menu_button",
       presenterButton = "presenter_button"
}
