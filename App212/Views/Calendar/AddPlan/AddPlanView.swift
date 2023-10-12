//
//  AddPlanView.swift
//  App212
//
//  Created by IGOR on 07/10/2023.
//

import SwiftUI

struct AddPlanView: View {
    
    @StateObject var viewModel = AddPlanViewModel()
    @Environment(\.presentationMode) var router
    @StateObject var mainModel: CalendarViewModel
    @AppStorage("history3") var history3: [String] = []
    
    @Environment(\.presentationMode) var presentationMode
    
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
                            
                            Text("Plan")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                            
                            Text(mainModel.pcurrent_operation)
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                        }
                    }
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text(" ")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.pexpenses.isEmpty ? 1 : 0)
                            .padding(.horizontal, 15)
                        
                        TextField(" $", text: $viewModel.pexpenses)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .keyboardType(.numberPad)
                            .textContentType(.oneTimeCode)
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.1)))
                    })
                    
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
                                
                                ForEach(viewModel.pthings, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.pcurrent_thing = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 3).fill(viewModel.pcurrent_thing == index ? Color("blue") : Color.white.opacity(0.1))
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
                                .opacity(viewModel.ppayment_sys.isEmpty ? 1 : 0)
                                .padding(.horizontal, 15)
                            
                            TextField(" $", text: $viewModel.ppayment_sys)
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
                                .opacity(viewModel.pcomission.isEmpty ? 1 : 0)
                                .padding(.horizontal, 15)
                            
                            TextField(" $", text: $viewModel.pcomission)
                                .foregroundColor(.gray)
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
                            
                            DatePicker("", selection: $viewModel.pdateFrom, displayedComponents: .hourAndMinute)
                                .datePickerStyle(.graphical)
                                .labelsHidden()
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.pdateTo, displayedComponents: .date)
                                .labelsHidden()
                        }
                        
                        Button(action: {
                            
                            if mainModel.current_operation == "Expenses" {
                                
                              history3.append("Expenses(\(viewModel.pcurrent_thing2))  Comission:\(viewModel.pcomission)$        Payment system: \(viewModel.ppayment_sys)    \(viewModel.pdateFrom.convertDate(format: "HH:mm"))      \(viewModel.pdateTo.convertDate(format: "MMM d"))")

                            } else {

                              history3.append("Income(\(viewModel.pcurrent_thing2))  Comission:\(viewModel.pcomission)$        Payment system: \(viewModel.ppayment_sys)    \(viewModel.pdateFrom.convertDate(format: "HH:mm"))      \(viewModel.pdateTo.convertDate(format: "MMM d"))")

                            }

                            presentationMode.wrappedValue.dismiss()
                            
                            
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

struct AddPlanView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlanView(mainModel: CalendarViewModel())
    }
}
