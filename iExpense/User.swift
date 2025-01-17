//
//  User.swift
//  iExpense
//
//  Created by Dylan Caetano on 17/01/2025.
//

import Foundation


// Définition de la classe `User` conforme à `ObservableObject`.
class User: ObservableObject {
    
    // Propriété `@Published` pour notifier les changements.
    @Published var firstName = "Dylan"
    // Propriété `firstName` pour stocker le prénom de l'utilisateur.
    // Par défaut, la valeur est "Dylan".
    
   
    @Published var lastName = "CTO"
    // Propriété `lastName` pour stocker le nom de famille de l'utilisateur.
    // Par défaut, la valeur est "CTO".
}
