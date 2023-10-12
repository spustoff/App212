//
//  MyCategoriesViewModel.swift
//  App212
//
//  Created by IGOR on 08/10/2023.
//

import SwiftUI

final class MyCategoriesViewModel: ObservableObject {

    @Published var catType: [String] = ["Income", "Expenses"]
    @Published var current_cat = "Income"
    @Published var isAddCat: Bool = false
    @AppStorage("history_cat_e") var history_cat_e: [String] = []
    @AppStorage("history_cat_i") var history_cat_i: [String] = []
    
}

