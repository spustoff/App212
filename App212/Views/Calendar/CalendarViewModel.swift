//
//  CalendarViewModel.swift
//  App212
//
//  Created by IGOR on 07/10/2023.
//

import SwiftUI

final class CalendarViewModel: ObservableObject {
    
    @AppStorage("dairy") var dairy: [String] = []
    @AppStorage("dairy_favs") var favs: [String] = []
    
    
    @Published var isFavs: Bool = false
    
    public func getDairy() -> [String] {
        
        switch isFavs {
            
        case true:
            return dairy.filter{favs.contains($0)}
            
        case false:
            return dairy
        }
    }
    
    @Published var operations: [String] = ["Income", "Expenses"]
    @Published var current_operation = "Income"
        
    @AppStorage("history3") var history3: [String] = []
    
    @Published var balance: Int = 0
    @Published var poperations: [String] = ["Income", "Expenses"]
    @Published var pcurrent_operation = "Income"
    @Published var isAddPlan: Bool = false
}
