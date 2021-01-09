//
//  NetworkManager.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/7/21.
//

import Combine
import Foundation

enum NetworkError: Error, CustomNSError {
  case invalidURL, invalidResponse, noData
  
  var localizedDescription: String {
      switch self {
      case .invalidURL: return "Invalid URL"
      case .invalidResponse: return "Invalid response"
      case .noData: return "No data"
      }
  }
}

public final class NetworkManager {
  private let queue = DispatchQueue(label: "com.vido.serverrender",
                                    attributes: .concurrent)
  public static let shared = NetworkManager()
  
  private init() {}
  
  public func getRequest<E>(_ urlString: String,
                            _ decoder: @escaping ((Data) throws -> E))
  -> AnyPublisher<E, Error> {
    guard let url = URL(string: urlString) else {
      return Fail(error: NetworkError.invalidURL)
          .eraseToAnyPublisher()
    }
    
    return URLSession.shared.dataTaskPublisher(for: url)
      .retry(3)
      .mapError({ error -> Error in
          switch error {
          case URLError.badURL:
              return NetworkError.invalidURL
          case URLError.dataNotAllowed:
              return NetworkError.noData
          default:
              return error
          }
      })
      .map { $0.data }
      .tryMap { try decoder($0) }
      .subscribe(on: queue)
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
