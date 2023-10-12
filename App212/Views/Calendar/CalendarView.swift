//
//  CalendarView.swift
//  App212
//
//  Created by IGOR on 07/10/2023.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = CalendarViewModel()
    
    func getNextDates() -> [Date] {
        
        let nextDates = (0...13).map { Calendar.current.date(byAdding: .day, value: $0, to: Date())! }
        
        return nextDates
    }
    
    @Binding var show: Bool
    
    @State var result: Int = 0
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                show = true
                            }
                            
                        }, label: {
                            
                            VStack(spacing: 3) {
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.white)
                                    .frame(width: 20, height: 2)
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.white)
                                    .frame(width: 20, height: 2)
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.white)
                                    .frame(width: 20, height: 2)
                            }
                            .padding(9)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.3)))
                            
                        })
                        
                        Text("Calendar")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {

                            withAnimation(.spring()) {
                                
                                viewModel.isAddPlan = true
                            }
                            
                        }, label: {
                            
                            Text("+")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .regular))
                        })
                        .frame(width: 30, height: 30)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack {
                            
                            ForEach(getNextDates(), id: \.self) { date in
                                
                                DateView(date: date)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 100)
                }
                .padding()
                .background(Color("b").ignoresSafeArea())

                if viewModel.history3.isEmpty {
                    
                    VStack {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text("No any dairy")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.history3, id: \.self) { index in

                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                    Spacer()
                                    
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("b")))
                                
                            }
                        }
                    }
                }
                
                Spacer()

            }
            .overlay (
                
                withAnimation(.spring()) {
                    
                    oper2()

                }
            )
        }
    }
    
    @ViewBuilder
    func oper2() -> some View {
        
        ZStack {
            
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .opacity(viewModel.isAddPlan ? 1 : 0)
                .onTapGesture {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddPlan = false
                    }
                }
            
            VStack {
                
                Text("What do you want to add?")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold))
                
                HStack {
                
                ForEach(viewModel.poperations, id: \.self) { index in
                    
//                    if let curOper = viewModel.current_operation {
                        
                        NavigationLink(destination: {
                            
                            AddPlanView(mainModel: viewModel)
                                .navigationBarBackButtonHidden()
                                .onAppear {
                                    
                                    viewModel.pcurrent_operation = index
                                }
                            
                        }, label: {
                            
                            HStack {
                                
                                VStack(alignment: .leading, content: {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                })
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 5).stroke(.gray.opacity(0.15)))
                        })
//                    }
                }
            }
            }
            .padding()
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 0).fill(Color("b")))
            .frame(maxHeight: .infinity, alignment: .bottom)
            .offset(y: viewModel.isAddPlan ? 0 : UIScreen.main.bounds.height)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(show: .constant(true))
    }
}
