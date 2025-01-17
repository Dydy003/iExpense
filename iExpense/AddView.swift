//
//  AddView.swift
//  iExpense
//
//  Created by Dylan Caetano on 17/01/2025.
//

import SwiftUI

struct AddView: View {
    
    // Observe une instance de `iExpence` pour gérer les dépenses
    @ObservedObject var expenses: iExpence
    
    // Accède à la fonction `dismiss` de l'environnement
    @Environment(\.dismiss) private var dismiss
    
    // États locaux pour gérer les saisies utilisateur
    @State private var name = "" // Nom de la dépense
    @State private var type = "Personal" // Type de dépense
    @State private var amount = 0.0 // Montant de la dépense
    
    // Types de dépenses disponibles
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                // Champ de saisie pour le nom
                TextField("Name", text: $name)
                
                // Sélecteur pour le type de dépense
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                // Champ de saisie pour le montant
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad) // Clavier numérique
            }
            .navigationTitle("Add new expense") // Titre de la vue
            
            .toolbar {
                Button {
                    let item = iExpenceItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    
                    // Ferme la vue actuelle
                    dismiss()
                } label: {
                    VStack {
                        Text("Save")
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                    .padding(8)
                    .background(Color.black)
                    .clipShape(.buttonBorder)
                }
            }
        }
    }
}

// Prévisualisation de la vue
#Preview {
    AddView(expenses: iExpence())
}
