//
//  ContentView.swift
//  Shared
//
//  Created by Zsolt Kébel on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
    let address = "https://api.qrserver.com/v1/create-qr-code/?data="
    let test = "https://api.qrserver.com/v1/create-qr-code/?data=https://www.google.com"
    
    @State var url: String?

    var body: some View {
        VStack{
            if let safeUrlString = url {
                AsyncImage(url: URL(string: safeUrlString))
            }
            Button {
                let pasteboard = UIPasteboard.general
                
                if pasteboard.hasStrings {
                    url = address + pasteboard.string!
                }
            } label: {
                Text("Paste")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
