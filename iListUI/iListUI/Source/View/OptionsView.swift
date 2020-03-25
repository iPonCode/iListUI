//  OptionsView.swift
//  iListUI
//
//  Created by Simón Aparicio on 25/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import SwiftUI

struct OptionsView: View {

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
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
