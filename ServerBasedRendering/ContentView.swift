//
//  ContentView.swift
//  ServerBasedRendering
//
//  Created by Vido Shaweddy on 1/6/21.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject private var templateVM = TemplateViewModel()
  
    var body: some View {
      if let molecules = templateVM.template?.molecules {
        List {
          ForEach(molecules) { template in
            viewFactory(template.type,
                            template.data).frame(minWidth: 300, maxHeight: 300, alignment: .center)
          }
        }.navigationTitle(templateVM.template?.title.uppercased() ?? "")
      } else {
        VStack {
          ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
        }.onAppear {
          templateVM.loadMolecules(from: "http://127.0.0.1:8080/page/home")
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
