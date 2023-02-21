//
//  gonennseiView.swift
//  CapselSample
//
//  Created by cmStudent on 2022/11/29.
//

import SwiftUI

struct gonennseiView: View {
    @StateObject var gonenn = gonenViewMOdel()
    @StateObject var manager1: dispManager = .DispManager
    @StateObject var manager2 = NormaldispManager()
    @StateObject var viewModel = DataManeger()

    @StateObject var viewModel1 = QuestionViewModel()
    @StateObject var viewModel2 = NormalQuestionViewModel()

    var body: some View {
        ZStack{
            Image("back")
                    .resizable()
                    .frame(width: phone.w, height: phone.h)
                    .ignoresSafeArea()
            VStack(spacing:20){
                Spacer()
                Text("難易度を選択してね")
                    .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(width:  phone.w*0.8, height:  phone.h*0.1)
                        .foregroundColor(Color(.white))
                        .background(Color( red : 0.3, green : 0, blue : 0.6))
                        .cornerRadius(24)
                Text("これは脱出ゲームです。問題を解いて、最後のドアの鍵を見つけてクリアしてください。早くクリアすればするほどスコアが高くなります。")
                    .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width:  phone.w*0.8, height:  phone.h*0.3)
                        .foregroundColor(Color(.white))
                        .background(Color( red : 0.3, green : 0, blue : 0.6))
                        .cornerRadius(24)
                Spacer()
                Button(action: {
                   
                    manager1.count = 0.0
                    manager1.questionview = 2
                    gonenn.showingModal = true
                        manager1.setbuttons()
                        manager1.setitem()
                  
                }, label: {
                    Text("easy")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(width:  phone.w*0.46, height:  phone.h*0.1)
                        .foregroundColor(Color(.white))
                        .background(Color( red : 0.3, green : 0, blue : 0.6))
                        .cornerRadius(24)
                        .fullScreenCover(isPresented: $gonenn.showingModal) {
                            GonenEasyView(gonenn: gonenn, dataManeger: viewModel, viewModel: viewModel1)
                                }
                    
                })
                Button(action: {
                  
                    manager2.questionview = 2
                    gonenn.showingModa2 = true
                    manager2.setbuttons()
                    manager2.setitem()
                    manager2.count = 0.0

                }, label: {
                    Text("nomal")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(width:  phone.w*0.46, height:  phone.h*0.1)
                        .foregroundColor(Color(.white))
                        .background(Color( red : 0.3, green : 0, blue : 0.6))
                        .cornerRadius(24)
                  
                    
                        .fullScreenCover(isPresented: $gonenn.showingModa2) {
                            GonenNormalView(gonenn: gonenn ,dataManeger: viewModel ,viewModel: viewModel2 )
                                }
                })
                Button(action: {
                    manager1.count = 0.0
//                    manager1.questionview = 2
                    gonenn.showingModa3 = true
//                    manager1.setbuttons()
//                    manager1.setitem()
                }, label: {
                    Text("hard")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(width:  phone.w*0.46, height:  phone.h*0.1)
                        .foregroundColor(Color(.white))
                        .background(Color( red : 0.3, green : 0, blue : 0.6))
                        .cornerRadius(24)
                    
                        .fullScreenCover(isPresented: $gonenn.showingModa3) {
                            GonenHardView(gonenn: gonenn, dataManeger: DataManeger() ,viewModel: HardgonenQuestionViewModel())
                                }
                })
                Spacer()
                
            }
        }
    }
}


