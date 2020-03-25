//  OptionsView.swift
//  iListUI
//
//  Created by Simón Aparicio on 25/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import SwiftUI

struct OptionsView: View {

    @Environment(\.presentationMode) var presentationMode

    let optionsTitle = "Opciones"

    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Criterios de ordenación")){
                    Text("Aquí las opciones de ordenación")
                }

                Section(header: Text("Criterios de filtrado")){
                    Text("Aquí las opciones de filtrado")
                }

            }
        .navigationBarTitle(optionsTitle)
        //.navigationBarTitle(Text(optionsTitle), displayMode: .inline)

        .navigationBarItems(
            leading: Button(action: { // left button
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName:"rectangle.dock")
                    .font(.title)
            }),
            trailing: Button(action: { // right button

                // TODO: Save values, update EnvironmentObject
                self.presentationMode.wrappedValue.dismiss() // close view
                
            }, label: {
                Image(systemName: "rectangle.fill.badge.checkmark")
                    .font(Font(UIFont.AppFont.compactTitle))
            })
            )
            
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
