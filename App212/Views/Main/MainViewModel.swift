//
//  MainViewModel.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI

final class MainViewModel: ObservableObject {

    @Published var balance: Int = 0
    @Published var operations: [String] = ["Income", "Expenses"]
    @Published var current_operation = "Income"
    @Published var isAdd: Bool = false
    @AppStorage("history") var history: [String] = []
    @AppStorage("history2") var history2: [String] = []
    
}

