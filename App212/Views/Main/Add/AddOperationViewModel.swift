//
//  AddOperationViewModel.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI

final class AddOperationViewModel: ObservableObject {

    @Published var expenses: String = ""
    @Published var income: String = ""

    @Published var things: [String] = ["More", "Products", "Servis", "Online", "Gifts", "Education", "Health"]
    @Published var current_thing: String = ""
    
    @Published var payment_sys: String = ""
    @Published var comission: String = ""
    @AppStorage("history") var history: [String] = []
    @AppStorage("history2") var history2: [String] = []

    struct OperationsModel: Identifiable, Hashable {
        
        var id = UUID().uuidString

        var time: String
        var date: String
        var oper: Int
    }
    
    func getDates() -> [[Date]] {
        
        let startDate = Date()
        let endDate = Date().addingTimeInterval(60 * 60 * 24 * 14)
        
        var dates = [[Date]]()
        var week = [Date]()
        var currentDate = startDate
        let calendar = Calendar.current
        
        while currentDate <= endDate {
            
            if calendar.component(.weekday, from: currentDate) == 1 {
                
                if week.count > 0 {
                    
                    dates.append(week)
                }
                
                week = []
            }
            
            week.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        if week.count > 0 {
            
            dates.append(week)
        }
        
        return dates
    }

    @State var dateFrom: Date = Date()
    @State var dateTo: Date = Date()
}

