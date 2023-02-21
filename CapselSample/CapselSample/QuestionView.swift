//
//  QuestionView.swift
//  CapselSample
//
//  Created by cmStudent on 2022/11/29.
//

import SwiftUI

struct QuestionView: View {
    @ObservedObject var manager: dispManager = .DispManager
    var body: some View {
    
            ZStack{
                Image("back")
                    .resizable()
                    .frame(width: phone.w, height: phone.h)
                    .ignoresSafeArea()
                VStack(spacing: 30){
                    Spacer()
                    Text("学年を選択してください")
                        .font(.largeTitle)
                            .fontWeight(.semibold)
                            .frame(width:  phone.w, height:  phone.h*0.1)
                            .foregroundColor(Color(.white))
                            .background(Color( red : 0.3, green : 0, blue : 0.6))
                            .cornerRadius(24)
                    
                Spacer()
                    NavigationLink(destination: gonennseiView()) {
                     
                        Text("５年生")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .frame(width:  phone.w*0.6, height:  phone.h*0.1)
                            .foregroundColor(Color(.white))
                            .background(Color( red : 0.3, green : 0, blue : 0.6))
                            .cornerRadius(24)
                    }
                    NavigationLink(destination: rokunennseiView()) {
                        Text("6年生")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .frame(width:  phone.w*0.6, height:  phone.h*0.1)
                            .foregroundColor(Color(.white))
                            .background(Color( red : 0.3, green : 0, blue : 0.6))
                            .cornerRadius(24)
                    }
                    
                    Spacer()
                }
                
            }
            
        
        
        
        
    }
}




