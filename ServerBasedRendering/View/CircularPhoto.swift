//
//  CircularPhoto.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/7/21.
//

import SwiftUI

/// Create textfield template
///
/// act as a wrapper to SwiftUI version.
/// erase view type
struct CircularPhotoTemplate: UITemplate {
  let model: PhotoModel
  
  func render() -> AnyView {
    return CircularPhotoView(model: model).toAnyView()
  }
}

struct CircularPhotoView: View {
  let model: PhotoModel
  @ObservedObject var photoVM = PhotoViewModel()
  
  var body: some View {
    if let image = photoVM.image {
      VStack {
        Image(uiImage: image)
          .resizable()
          .clipShape(Circle())
          .frame(minWidth: 100,
                 maxHeight: 100,
                 alignment: .center)
        
        Spacer()
        
        Text(model.name)
      }
    } else {
      Image(systemName: "icloud.and.arrow.down")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(minWidth: 100,
               maxHeight: 100,
               alignment: .center)
        .onAppear {
          photoVM.loadImage(from: model.photo)
        }
    }
  }
}
