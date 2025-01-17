//
//  iExpenceItem.swift
//  iExpense
//
//  Created by Dylan Caetano on 17/01/2025.
//

import Foundation

struct iExpenceItem: Identifiable, Codable {
    
//    UUID est un type en Swift qui génère un identifiant unique sous la forme d'une chaîne de caractères (par exemple, E621E1F8-C36C-495A-93FC-0C247A3E6E5F).
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
}
