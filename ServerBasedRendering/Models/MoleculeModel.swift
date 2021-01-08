//
//  UIModel.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/7/21.
//

import Foundation
import SwiftUI

//  Model for each view
struct MoleculeModel: Decodable, Identifiable {
  var id = UUID()
  let type : Molecule
  let data: [String: String]
  
  enum CodingKeys: String, CodingKey {
    case type, data
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: Self.CodingKeys)
    self.type = try container.decode(Molecule.self, forKey: .type)
    self.data = try container.decode([String: String].self, forKey: .data)
  }
}
