//
//  iExpences.swift
//  iExpense
//
//  Created by Dylan Caetano on 17/01/2025.
//

import Foundation

// Définition de la classe `iExpence` conforme au protocole `ObservableObject`.
// Cela permet à la classe de notifier les vues SwiftUI lorsque ses données changent.
class iExpence: ObservableObject {
    
    // `@Published` est un wrapper de propriété qui notifie les vues lorsque `items` est modifié.
    // `items` est un tableau d'objets `iExpenceItem`.
    @Published var items = [iExpenceItem]() {
        
        // `didSet` est un observateur de propriété qui est appelé chaque fois que `items` est modifié.
        didSet {
            // Tente d'encoder `items` en données JSON.
            if let encoded = try? JSONEncoder().encode(items) {
                // Si l'encodage réussit, enregistre les données encodées dans `UserDefaults`.
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    // Initialiseur de la classe `iExpence`.
    init() {
        // Tente de récupérer les données enregistrées dans `UserDefaults` pour la clé "Items".
        if let saveItems = UserDefaults.standard.data(forKey: "Items") {
            // Tente de décoder les données en un tableau d'objets `iExpenceItem`.
            if let decodedItems = try? JSONDecoder().decode([iExpenceItem].self, from: saveItems) {
                // Si le décodage réussit, assigne les données décodées à `items`.
                items = decodedItems
                return
            }
        }
        
        // Si aucune donnée n'est trouvée ou si le décodage échoue, initialise `items` avec un tableau vide.
        items = []
    }
}
