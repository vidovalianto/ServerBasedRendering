//
//  PhotoModel.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/7/21.
//

import Foundation

//  Model for circularphoto
struct PhotoModel: Decodable {
  let name: String
  let photo: String
}

extension PhotoModel {
  static func loadModel(_ completion: @escaping ([PhotoModel]) -> Void) {
    let url = URL(string: "http://127.0.0.1:8080/page/home/model")!
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error { print(error) }
      
      if let data = data {
        do {
          let decoder = JSONDecoder()
          let jsonData = try decoder.decode([PhotoModel].self, from: data)

          DispatchQueue.main.async {
            completion(jsonData)
          }
        } catch {
          print(error)
        }
      }
    }.resume()
  }
}
