//  ContentView.swift
//  iListUI
//
//  Created by Simón Aparicio on 24/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    var someItems = AnItemsFactory.someItems
    let listTitle = "Items super chulos!"
    
    // For the time being, it is still necessary to configure appearance for Navigation Bar
    // with classical UIKit method using an initializer
    init() {
        
        // fonts for navigationbar titles
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [
            .font: UIFont.AppFont.largeTitle,
            .foregroundColor: UIColor.systemPink]
        appearance.titleTextAttributes = [
            .font: UIFont.AppFont.compactTitle,
            .foregroundColor: UIColor.AppColor.highlighted]
        
        // assign appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        
        NavigationView{
            
            List(someItems){ item in
                
                Text("UUID: \(item.id)").padding()
                
            }// navigation title goes in the close bracket of the last component inside the NavigationView
            .navigationBarTitle(listTitle)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
