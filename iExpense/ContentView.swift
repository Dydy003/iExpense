//
//  ContentView.swift
//  iExpense
//
//  Created by Dylan Caetano on 17/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var user = User()
    // Création d'une instance de `User` gérée par `@StateObject`.
    
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            //  \() : C'est la syntaxe d'interpolation de chaîne en Swift, qui permet d'insérer des valeurs dynamiques dans une chaîne de caractères.
            
            TextField("Your name is", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            // Le texte saisi est lié à la propriété `lastName` de l'objet `user`
            // Lie le texte saisi à la propriété `lastName` de l'objet `user` (binding bidirectionnel) text: $user.lastName
            
        }
        .padding() 
    }
}

#Preview {
    ContentView()
}
