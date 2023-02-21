//
//  ContentView.swift
//  HerdSample
//
//  Created by cmStudent on 2023/01/30.
//


import SwiftUI


struct GonenHardView: View {
    @ObservedObject var manager: HerddispManager = .DispManager
    @ObservedObject var gonenn: gonenViewMOdel
    @ObservedObject var dataManeger: DataManeger
    

    // 背景画像の名前
    let aasajl = ["tatami1","tatami2","tatami3","tatami4"]
    // 背景の座標比率リスト
    let asiohf: [CGFloat] = [2.0,1.0,0,-1.0]
    // 背景の座標比率
    @State var sdijjp: CGFloat = 1.0
    @ObservedObject var viewModel: HardgonenQuestionViewModel
    var body: some View {
        if manager.questionview == 1 {
            gonenHardView(viewModel: viewModel, questionNum: 2)
                .frame(height: phone.h*0.85)
        }else if manager.questionview == 3{
            Clear(viewModel: viewModel, gonenn: gonenn, dataManeger: dataManeger)
            
        }else{
            ZStack {
                ZStack {
                    // 背景
                    HStack(spacing: 0){
                        ForEach(aasajl, id: \.self){ name in
                            Image(name)
                                .resizable()
                                .frame(width: phone.w, height: phone.h*0.8)
                                .padding(.bottom, phone.h*0.2)
                        
                        }
                    }

                    ForEach(manager.buttonArray){ status in
                        if status.isShow {
                            if status.id.prefix(3) == "Img" {
                                Image(status.imageName)
                                    .resizable()
                                    .frame(width: status.size_w, height: status.size_h)
                                    .position(x: phone.w*status.ratio_x,
                                              y: phone.h*status.ratio_y)
                            } else {
                                Button(action: {
                                    manager.buttonShori(id: status.id)
                                }, label: {
                                    Image(status.imageName)
                                        .resizable()
                                        .frame(width: status.size_w, height: status.size_h)
                                    //
                                     
                                })
                                .position(x: phone.w*status.ratio_x,
                                          y: phone.h*status.ratio_y)
                            }

                        }
                    
                }
                }
                .position(x: phone.w*sdijjp, y: phone.h*0.5)

                //移動
                VStack {
                    Spacer()
                    HStack {
                        ForEach(asiohf, id: \.self){ value in
                            Button(action: {
                                sdijjp = value

                            }, label: {
                                Text("　　　")
                                    .background(Color.red)
                            })
                        }
                    }


                    // アイテムバー
                   ScrollView(.horizontal){
                       HStack {
                            ForEach(manager.itemBar){ status in
                                if status.isPossession {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: phone.w*0.2, height: phone.w*0.2)
                                            .foregroundColor(Color.gray)
                                        Button(action: {
                                           manager.selectItem = status.id
                                       }, label: {
                                            Image(status.imageName)
                                                .resizable()
                                                .frame(width: phone.w*status.size_w,
                                                       height: phone.w*status.size_h)
                                        })
                                        if manager.selectItem == status.id {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(lineWidth: 5)
                                                .frame(width: phone.w*0.2, height: phone.w*0.2)
                                                .foregroundColor(Color.red)
                                       }
                                    }
                                }
                                }
                       }
                    }
                }
                Text(String(format: "%.2f", (manager.timerValue + manager.count)) + "秒")
                    .background(Color.white)
                    .padding(10)
                    .border(Color.cyan, width: 5)
                    .border(Color.gray, width: 3)
                    .padding(3)
                    .border(Color.black, width: 1)
                    .position(x: phone.w*0.5, y: phone.h*0.05)
                Text("\(viewModel.mondainunnbetr)"+"/8")
                    .position(x: phone.w*0.8, y: phone.h*0.05)
                
            }
            .onAppear{
                manager.startTimer()
            }
        }
           
    }
}



