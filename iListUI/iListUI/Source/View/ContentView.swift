//  ContentView.swift
//  iListUI
//
//  Created by Simón Aparicio on 24/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(1...42, id: \.self){ index in
            index%7 == 0 ? Text("Número \(index)").fontWeight(.bold) : Text("Listas tabuladas con SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
