//
//   Clear.swift
//  HerdSample
//
//  Created by cmStudent on 2023/02/02.
//

import SwiftUI

struct GonenEasyClear: View {
    @ObservedObject var manager: dispManager = .DispManager
    @ObservedObject var viewModel: QuestionViewModel
    
    @ObservedObject var gonenn : gonenViewMOdel
    //
    @ObservedObject var dataManeger: DataManeger
    @State private var newScore = ""
    @State private var newDog = ""
    @State var AllScore: Int = 0
    @State var All: String = ""
    @State private var isShowing = false
    var body: some View {
        ZStack{
                   Image("clear")
                       .resizable()
                       .frame(width: phone.w, height: phone.h)
                       .ignoresSafeArea()
                   VStack(spacing: 10){
                       Group{
                           Text("SCORE")
                               .font(.largeTitle)
                               .foregroundColor(Color.white.opacity(1.0))
                           Text("タイム")
                               .font(.system(size: 20))
                               .foregroundColor(Color.white.opacity(1.0))
                           HStack(spacing: 30){
                               Text(String(format: "%.4f", (manager.timerValue + manager.count)) + "秒")
                                   .foregroundColor(Color.white.opacity(1.0))
                               Text(String(format: "%.4f", (manager.timerValue + manager.count)*50))
                                   .foregroundColor(Color.white.opacity(1.0))
                               
                           }
                       }
                       Text("問題")
                           .font(.system(size: 20))
                           .foregroundColor(Color.white.opacity(1.0))
                       HStack(spacing: 30){
                           
                           Text("\(viewModel.mondainunnbetr)" + "問")
                               .foregroundColor(Color.white.opacity(1.0))
                           Text("\(viewModel.mondainunnbetr*1000)")
                               .foregroundColor(Color.white.opacity(1.0))
                           
                       }
                       Text("学年")
                           .foregroundColor(Color.white.opacity(1.0))
                           .font(.system(size: 20))
                       HStack(spacing: 30){
                           Text("5年のEasy")
                               .foregroundColor(Color.white.opacity(1.0))
                           Text("5000")
                               .foregroundColor(Color.white.opacity(1.0))
                           
                           
                       }
                       Text("合計")
                           .font(.system(size: 20))
                           .foregroundColor(Color.white.opacity(1.0))
                       Text("\(AllScore)")
                           .font(.system(size: 20))
                           .foregroundColor(Color.white.opacity(1.0))
                       TextField("名前を入力してください", text:$newDog)
                           .foregroundColor(Color.white)
                           .background(Color(white: 0.5))
                       //ついか
                       Button("タイトルがめんにもどる") {
                           
                           isShowing = true
                           gonenn.showingModal = false

                 
                           dataManeger.add(dogBreed: newDog,dogScore: All)
                  
                           print("\(All)")
                       }
                      
                       
                   }
                   .position(x: phone.w*0.5, y: phone.w*1.1)
               }
        
        .onAppear(){
            calcScore()
        }
    }
    
    
    func calcScore(){
        var result: Double = 0.0
        result += (manager.timerValue + manager.count)*50 // タイム
        result += Double(viewModel.mondainunnbetr*1000) // 問題
        result += 5000.0
        AllScore = Int(result)
        //ついか
        All = String(AllScore)
        
    }
 
}




