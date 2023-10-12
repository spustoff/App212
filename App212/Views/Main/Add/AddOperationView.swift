//
//  AddOperationView.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI

struct AddOperationView: View {
    
    @StateObject var viewModel = AddOperationViewModel()
    @Environment(\.presentationMode) var router
    @StateObject var mainModel: MainViewModel
    @AppStorage("history") var history: [String] = []
    @AppStorage("history2") var history2: [String] = []
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack {
                        
                        HStack {
                            
                         Button(action: {
                             
                             router.wrappedValue.dismiss()
                                
                         }, label: {
                             
                             Image(systemName: "chevron.left")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 16, weight: .regular))
                             
                             Text("Back")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 16, weight: .regular))
                         })
                            
                            Spacer()
                        }
                        
                        HStack {
                            
                            Text("New")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                            
                            Text(mainModel.current_operation)
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                        }
                    }
                    
                    if mainModel.current_operation == "Expenses" {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0.00")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.expenses.isEmpty ? 1 : 0)
                                .padding(.horizontal, 15)
                            
                            TextField(" $", text: $viewModel.expenses)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.numberPad)
                                .textContentType(.oneTimeCode)
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.1)))
                        })
                        
                    } else {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0.00")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.income.isEmpty ? 1 : 0)
                                .padding(.horizontal, 15)
                            
                            TextField(" $", text: $viewModel.income)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.numberPad)
                                .textContentType(.oneTimeCode)
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.1)))
                        })
                    }
                    
                    HStack {
                        
                        Image("bitcoin")
                        
                        Text("Bitcoin")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                    }
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.1)))
                    
                    Text("Category")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                    
                    Group {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                ForEach(viewModel.things, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.current_thing = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 3).fill(viewModel.current_thing == index ? Color("blue") : Color.white.opacity(0.1))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 40))
                                        
                                    })
                                }
                            }
                        }
                        
                        Text("Payment system")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text(" ")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.payment_sys.isEmpty ? 1 : 0)
                                .padding(.horizontal, 15)
                            
                            TextField(" $", text: $viewModel.payment_sys)
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.numberPad)
                                .textContentType(.oneTimeCode)
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.1)))
                        })
                        
                        Text("Comission")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text(" ")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.comission.isEmpty ? 1 : 0)
                                .padding(.horizontal, 15)
                            
                            TextField(" $", text: $viewModel.comission)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.numberPad)
                                .textContentType(.oneTimeCode)
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.1)))
                        })
                        
                        HStack {
                            
                            Text("Time")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            DatePicker("", selection: $viewModel.dateFrom, displayedComponents: .hourAndMinute)
                                .datePickerStyle(.graphical)
                                .labelsHidden()
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.dateTo, displayedComponents: .date)
                                .labelsHidden()
                        }
                        
                        Button(action: {
                            
                            if mainModel.current_operation == "Expenses" {
                                
                                history2.append("Expenses(\(viewModel.current_thing))  Comission:\(viewModel.comission)$        Payment system: \(viewModel.payment_sys)    \(viewModel.dateFrom.convertDate(format: "HH:mm"))      \(viewModel.dateTo.convertDate(format: "MMM d"))")

                            } else {

                                history.append("Income(\(viewModel.current_thing))  Comission:\(viewModel.comission)$        Payment system: \(viewModel.payment_sys)    \(viewModel.dateFrom.convertDate(format: "HH:mm"))      \(viewModel.dateTo.convertDate(format: "MMM d"))")

                            }

                            router.wrappedValue.dismiss()
                            
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 7).fill(Color("blue")))
                                .padding(.vertical)
                        })
                    }
                }
            }
            .padding()
        }
    }
}

struct AddOperationView_Previews: PreviewProvider {
    static var previews: some View {
        AddOperationView(mainModel: MainViewModel())
    }
}
