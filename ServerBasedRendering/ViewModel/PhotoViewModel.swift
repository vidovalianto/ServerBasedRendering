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
      .subscribe(on: Self.queue)
      .replaceError(with: nil)
      .receive(on: DispatchQueue.main)
      .assign(to: \.image, on: self)
      .store(in: &cancellable)
  }
}

extension PhotoViewModel {
  private static let queue = DispatchQueue(label: "com.vido.photoviewmodel")
}
