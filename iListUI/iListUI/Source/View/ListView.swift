//  ContentView.swift
//  iListUI
//
//  Created by Simón Aparicio on 24/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @State var showOptions: Bool = false
    
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
        
        // back button
        appearance.setBackIndicatorImage(
            UIImage(systemName: "arrow.left.square.fill"), transitionMaskImage:
            UIImage(systemName: "arrow.left.square"))
        //appearance.configureWithTransparentBackground()
        
        // assign appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        
        NavigationView{
            
            List(someItems){ item in
                
                ZStack {
                    Text("UUID: \(item.id)").padding()

                    // this is the only way (right now) to remove or do not show the
                    // disclouser indicator in the row, first renders the content and
                    // after this render over an empty view, needed a ZStack to do this
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        EmptyView()
                    }//navigation link
                }
                
            }//list
            // the navigation modificators goes in the close bracket of the last component inside the NavigationView
            .navigationBarTitle(listTitle)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showOptions = true
                }, label: {
                    Image(systemName: "table.badge.more.fill").font(.title)
            })
            )// this modificator is for present Options in modal view and the binded var is necessary to close it
            .sheet(isPresented: $showOptions){
                OptionsView()
            }
            
        }//navigation view
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
