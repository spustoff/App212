//
//  DateView.swift
//  App212
//
//  Created by IGOR on 07/10/2023.
//

import SwiftUI

struct DateView: View {
    
    var date: Date
    
    var body: some View {
                
        VStack {
            
            Text(String(getWeekday(from: date).prefix(1)))
                .foregroundColor(.gray)
                .font(.system(size: 11, weight: .regular))
            
            Text(String(getDateString(from: date)).prefix(2))
                .foregroundColor(date.isSameDay(as: Date()) ? .white : .gray)
                .font(.system(size: 12, weight: .medium))
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 8).stroke(date.isSameDay(as: Date()) ? Color.white : .gray.opacity(0.2)))
        }
    }
    
    func getWeekday(from date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: date)
    }
    
    func getDateString(from date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd MMM"
        
        return dateFormatter.string(from: date)
    }
}


extension Date {
    
    func isSameDay(as otherDate: Date) -> Bool {
        
        let calendar = Calendar.current
        
        return calendar.isDate(self, equalTo: otherDate, toGranularity: .day)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(show: .constant(true))
    }
}
