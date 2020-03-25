//  ContentView.swift
//  iListUI
//
//  Created by Simón Aparicio on 24/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var someItems = AnItemsFactory.someItems
    
    var body: some View {
        List(someItems){ item in
            Text("UUID: \(item.id)").padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
