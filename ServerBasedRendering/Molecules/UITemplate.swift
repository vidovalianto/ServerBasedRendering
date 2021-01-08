//
//  UITemplate.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/7/21.
//

import Foundation
import SwiftUI

/// SwiftUI View wrapper
protocol UITemplate {
  var id: UUID { get }
  func render() -> AnyView
}

extension UITemplate {
  var id: UUID { UUID() }
}

