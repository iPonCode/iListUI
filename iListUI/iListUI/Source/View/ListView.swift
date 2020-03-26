//  ContentView.swift
//  iListUI
//
//  Created by Simón Aparicio on 24/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @State var showOptions: Bool = false
    
    @State var someItems = AnItemsFactory.someItems
    
    let listTitle = "Items super chulos!"
    
    // For the time being, it is still necessary to configure appearance for Navigation Bar
    // with classical UIKit method using an initializer
    init() {
        
        // fonts for navigationbar titles
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [
            .font: UIFont.AppFont.largeTitle,
            .foregroundColor: UIColor.AppColor.highlighted]
        appearance.titleTextAttributes = [
            .font: UIFont.AppFont.compactTitle,
            .foregroundColor: UIColor.AppColor.highlighted]
        
        // back button
        appearance.setBackIndicatorImage(
            UIImage(systemName: "rectangle.grid.1x2.fill"), transitionMaskImage:
            UIImage(systemName: "rectangle.grid.1x2"))
        appearance.backButtonAppearance.normal.titleTextAttributes = [
            .font: UIFont.AppFont.barButton,
            .foregroundColor: UIColor.AppColor.barButton]
        //appearance.configureWithTransparentBackground()
        
        // assign appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        
        NavigationView{
            
            List{ // need a ForEach instead directly a List to implement onDelete
                
                ForEach(someItems){ item in
                    
                    ZStack {
                        
                        Text("UUID: \(item.id)").padding()
                            .contextMenu{

                                Button(action: { // watched
                                    self.toggleWatched(item: item)
                                }, label: {
                                    HStack{
                                        Text(item.watched ? "Marcar como no visto" : "Visto")
                                        Image(systemName: item.watched ? "eye.slash" : "eye")
                                    }
                                })

                                Button(action: { // favourite
                                    self.toggleFavourite(item: item)
                                }, label: {
                                    HStack{
                                        Text(item.favourite ? "Quitar favorito" : "Favorito")
                                        Image(systemName: item.favourite ? "star.slash" : "star.fill")
                                    }
                                })
                                
                                Button(action: { // remove
                                    self.removeItem(item: item)
                                }, label: {
                                    HStack{
                                        Text("Eliminar")
                                        Image(systemName: "trash")
                                    }
                                })
                        }
                        //.onTapGesture {
                            // TODO: update the State var with selected item
                        //}

                        // this is the only way (right now) to remove or do not show the
                        // disclouser indicator in the row, first renders the content and
                        // after this render over an empty view, needed a ZStack to do this
                        NavigationLink(destination: ItemDetailView(item: item)) {
                            EmptyView()
                        }//navigation link
                    }
                }//foreach
                .onDelete(perform: { (indexSet) in // can delete a Set of items
                    self.removeItem(itemsSet: indexSet)
                })
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
    
    func toggleFavourite(item: AnItem) {
        print("Favourite tapped")
    }

    func toggleWatched(item: AnItem) {
        print("Watched tapped")
    }

    func removeItem(item: AnItem) { // remove an item
        someItems.removeAll(where: { anItem in
            anItem.id == item.id
        })
//        if let index = self.someItems.firstIndex(where: {$0.id == item.id}){
//            self.someItems.remove(at: index)
//        }
        print("Remove tapped")
    }

    func removeItem(itemsSet: IndexSet) { // remove from .onDelete with and indexSet
        someItems.remove(atOffsets: itemsSet)
        print("Remove swiped")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
