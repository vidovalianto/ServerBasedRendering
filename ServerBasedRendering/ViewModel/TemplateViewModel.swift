//
//  MoleculeViewModel.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/7/21.
//

import Combine
import SwiftUI

/// View model for each template
///
/// act as the loader of the view
final class TemplateViewModel: ObservableObject {
  @Published var template: TemplateModel?
  var cancellable = Set<AnyCancellable>()
  
  func loadMolecules(from urlString: String) {
    return NetworkManager.shared
      .getRequest(urlString,
                  { try JSONDecoder()
                    .decode(TemplateModel.self,
                            from: $0) })
      .subscribe(on: Self.queue)
      .replaceError(with: nil)
      .receive(on: DispatchQueue.main)
      .assign(to: \.template, on: self)
      .store(in: &cancellable)
  }
}

extension TemplateViewModel {
  private static let queue = DispatchQueue(label: "com.vido.templateviewmodel")
}
