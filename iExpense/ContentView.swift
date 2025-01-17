//
//  ContentView.swift
//  iExpense
//
//  Created by Dylan Caetano on 17/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    // `@StateObject` crée et gère un objet `iExpence` pour stocker les dépenses.
    // Cet objet est conservé même si la vue est mise à jour.
    @StateObject var expenses = iExpence()
    
    // `@State` pour gérer l'affichage de la vue `AddView`.
    // Quand `showingAddExpense` est `true`, la vue `AddView` s'affiche.
    @State private var showingAddExpense = false
    
    var body: some View {
        // `NavigationStack` permet de naviguer entre les vues.
        NavigationStack {
            // `List` affiche une liste d'éléments.
            List {
                // `ForEach` parcourt chaque élément de `expenses.items`.
                // `id: \.id` utilise l'identifiant unique de chaque élément.
                ForEach(expenses.items, id: \.id) { item in
                    // Affiche le nom de chaque dépense.
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                // Active la suppression d'éléments dans la liste.
                .onDelete(perform: removeItems)
            }
            // Titre de la vue.
            .navigationTitle("iExpense")
            // Barre d'outils en haut de l'écran.
            .toolbar {
                // Bouton pour ajouter une nouvelle dépense.
                Button {
                    // Crée une nouvelle dépense et l'ajoute à la liste.
                    
                    showingAddExpense = true
                    // Quand elle est `false`, la vue `AddView` est masquée.
                } label: {
                    // Icône du bouton.
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(Color.black) // Couleur noire
                        .font(.system(size: 30)) // Taille de l'icône
                        .bold() // Texte en gras
                }
            }
            // Affiche la vue `AddView` quand `showingAddExpense` est `true`.
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    // Fonction pour supprimer des éléments de la liste.
    func removeItems(at offsets: IndexSet) {
        // Supprime les éléments aux indices spécifiés.
        expenses.items.remove(atOffsets: offsets)
    }
}

// Prévisualisation de la vue dans Xcode.
#Preview {
    ContentView()
}
