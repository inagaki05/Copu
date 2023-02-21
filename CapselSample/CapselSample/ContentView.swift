//
//  ContentView.swift
//  CapselSample
//
//  Created by cmStudent on 2022/11/29.
//aWrzsedfj

import SwiftUI

struct ContentView: View {

    var body: some View {
        
            NavigationView {
                ZStack{
                    Image("back")
                        .resizable()
                        .frame(width: phone.w, height: phone.h)
                        .ignoresSafeArea()
                    VStack (spacing: 20){
                                    Text("スタディカプセル")
                                        .font(.largeTitle)
                                        .fontWeight(.medium)
                   

                            NavigationLink(destination: QuestionView()) {
                                Text("Start")
                                    .font(.largeTitle)
                                    .fontWeight(.medium)
                                    
                            }
                        NavigationLink(destination: ListView( dataManeger: DataManeger())) {
                            Text("ランキング")
                                .font(.largeTitle)
                                .fontWeight(.medium)
                                
                        }
                        }
                }
                
        }
        
    }
   
}


