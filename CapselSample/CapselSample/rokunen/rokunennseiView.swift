//
//  rokunennseiView.swift
//  CapselSample
//
//  Created by cmStudent on 2022/11/29.
//

import SwiftUI

struct rokunennseiView: View {
   
    @StateObject var rokunenn = rokunenViewMOdel()
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
                Text("これは脱出ゲームです。問題を解いて、最後のドアの鍵を見つけてクリアしてください。" + 
                     "早くクリアすればするほどスコアが高くなります。")
                
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width:  phone.w*0.8, height:  phone.h*0.3)
                        .foregroundColor(Color(.white))
                        .background(Color( red : 0.3, green : 0, blue : 0.6))
                        .cornerRadius(24)
                Spacer()
                Button(action: {
                    rokunenn.SixEasyshowingModal = true
                }, label: {
                    Text("easy")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(width:  phone.w*0.46, height:  phone.h*0.1)
                        .foregroundColor(Color(.white))
                        .background(Color( red : 0.3, green : 0, blue : 0.6))
                        .cornerRadius(24)
                         
                    
                    .fullScreenCover(isPresented: $rokunenn.SixEasyshowingModal) {
                        SixEasyView(rokunenn: rokunenn, dataManeger: DataManeger(),viewModel: SixQuestionViewModel())
                                }
                })
                Button(action: {
                    rokunenn.SixNormalshowingModa2 = true
                }, label: {
                    Text("nomal")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(width:  phone.w*0.46, height:  phone.h*0.1)
                        .foregroundColor(Color(.white))
                        .background(Color( red : 0.3, green : 0, blue : 0.6))
                        .cornerRadius(24)
                       
                    
                        .fullScreenCover(isPresented: $rokunenn.SixNormalshowingModa2) {
                            SixNormalView(rokunenn: rokunenn,dataManeger: DataManeger(),viewModel: SixNormalQuestionViewModel())
                                }
                })
                Button(action: {
                    rokunenn.SixHardshowingModa3 = true
                }, label: {
                    Text("hard")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(width:  phone.w*0.46, height:  phone.h*0.1)
                        .foregroundColor(Color(.white))
                        .background(Color( red : 0.3, green : 0, blue : 0.6))
                        .cornerRadius(24)
                      
                    
                        .fullScreenCover(isPresented: $rokunenn.SixHardshowingModa3) {
                            SixHardView(rokunenn: rokunenn,dataManeger: DataManeger(),viewModel: SixHardQuestionViewModel())
                                }
                })
                Spacer()
                
            }
        }
    }
}


