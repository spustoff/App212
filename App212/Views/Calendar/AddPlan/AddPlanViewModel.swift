//
//  AddPlanViewModel.swift
//  App212
//
//  Created by IGOR on 07/10/2023.
//

import SwiftUI

final class AddPlanViewModel: ObservableObject {

    
    @Published var pexpenses: String = ""
    @Published var pincome: String = ""

    @Published var pthings: [String] = ["More", "Products", "Servis", "Online", "Gifts", "Education", "Health"]
    @Published var pcurrent_thing: String = ""
    
    @Published var pthings2: [String] = ["More", "Products", "Servis", "Online", "Gifts", "Education", "Health"]
    @Published var pcurrent_thing2: String = ""
    
    @Published var ppayment_sys: String = ""
    @Published var pcomission: String = ""
    @AppStorage("history3") var history3: [String] = []
    
    @Published var operations: [String] = ["Income", "Expenses"]
    @Published var current_operation = "Income"

    struct PlanModel: Identifiable, Hashable {
        
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
    
    @AppStorage("poper") var poper = ""

    @State var pdateFrom: Date = Date()
    @State var pdateTo: Date = Date()
}
