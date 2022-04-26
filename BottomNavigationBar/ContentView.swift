//
//  ContentView.swift
//  BottomNavigationBar
//
//  Created by Gian Barboza on 24/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    @State var fullScreenCoverPresentd: Bool = false
    
    let tabBarImageName = ["house", "cart", "plus.circle.fill", "message", "gearshape"]

    var body: some View {
        
        VStack(spacing: 0){
            ZStack{
                    
                Spacer().fullScreenCover(isPresented: $fullScreenCoverPresentd, content: {
                    Button(action: {fullScreenCoverPresentd.toggle()}, label: {
                        Text("Full Screen Cover")
                    })
                })
                
                switch selectedIndex{
                    case 0:
                        NavigationView{
                            ScrollView {
                                ForEach(0..<100) { num in
                                    Text("\(num)")
                                }
                            }
                            .navigationTitle("First Tab")
                        }
                        
                    default:
                        Text("Remaning tabs")
                }
            }
            Spacer()
            
            Divider()
        
            HStack{
                ForEach(0..<5){ num in
                    Button(action: {
                        if num == 2 {
                            fullScreenCoverPresentd.toggle()
                            return
                        }
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        //Custumize just PlUS button
                        if num == 2 {
                            Image(systemName: tabBarImageName[num])
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.white, .pink)
                                .font(.system(size: 50, weight: .bold))
                                .shadow(color: .pink, radius: 10, y: 5)
                        }else{
                            Image(systemName: tabBarImageName[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.label) : .init(white: 0.7))
                        }
                        
                        
                        Spacer()
                    })
                }
            }
            .padding(.top,10)
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
