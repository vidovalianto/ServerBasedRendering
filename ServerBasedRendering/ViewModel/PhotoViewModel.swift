//
//  PhotoViewModel.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/7/21.
//

import Combine
import SwiftUI

final class PhotoViewModel: ObservableObject {
  @Published var image: UIImage?
  var cancellable = Set<AnyCancellable>()
  
  func loadImage(from urlString: String) {
    return NetworkManager.shared
      .getRequest(urlString) {
        UIImage(data: $0)
      }
      .replaceError(with: nil)
      .assign(to: \.image, on: self)
      .store(in: &cancellable)
  }
}
