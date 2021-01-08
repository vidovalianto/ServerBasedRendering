//
//  TemplateModel.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/7/21.
//

import Foundation

//  Model for each page / parent
struct TemplateModel: Decodable {
  let title: String
  let molecules: [MoleculeModel]
}
