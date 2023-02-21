//
//  HerdViewModel.swift
//  HerdSample
//
//  Created by cmStudent on 2023/01/30.
//

import Foundation

import SwiftUI


class HerddispManager: ObservableObject {
    static let DispManager: HerddispManager = HerddispManager()
    
  
    
    
        init(){
            setbuttons()
            setitem()
        }
    
    
    func setitem(){
        itemBar = [
            //アイテムが増えるたびに追加する
            
            //脱出ドアの鍵
            items(id: "doorkey", imageName: "doorkey", size_w: 0.2, size_h: 0.2, isPossession: false),
            //コイん
            items(id: "coin", imageName: "coin", size_w: 0.2, size_h: 0.2, isPossession: false),
            //ボックスの鍵
            items(id: "key1", imageName: "boxkey", size_w: 0.2, size_h: 0.2, isPossession: false),
            //tbんかち
            items(id: "hammer", imageName: "hammer", size_w: 0.2, size_h: 0.2, isPossession: false),
        ]
    }
    func setbuttons() {
        buttonArray = [
            //ボタンが増えるたびに追加する
                    //追加した順番に重なる
                    // 読み方　buttons(id: "ボタンのID", imageName: "画像の名前", ratio_x: 横の座標, ratio_y: 縦の座標, size_w: 横の画像のサイズ, size_h: 縦の画像のサイズ）
                    //問題の本
                    buttons(id: "book1", imageName: "book2", ratio_x: 1.2, ratio_y: 0.7, size_w: phone.w*0.2, size_h: phone.h*0.1, isClear: false, isShow: true),
                    buttons(id: "book2", imageName: "book1", ratio_x: 1.7, ratio_y: 0.05, size_w: phone.w*0.107 , size_h: phone.h*0.05, isClear: false, isShow: true),
                    buttons(id: "book3", imageName: "book6", ratio_x: 0.7, ratio_y: 0.7, size_w: phone.w*0.2 , size_h: phone.h*0.1, isClear: false, isShow: true),
                    buttons(id: "book4", imageName: "book2", ratio_x: 2.2, ratio_y: 0.7, size_w: phone.w*0.2, size_h: phone.h*0.1, isClear: false, isShow: true),
                    //たな

                    buttons(id: "tana1", imageName: "tana6", ratio_x: 1.7, ratio_y: 0.52, size_w: phone.w*0.25, size_h:  phone.h*0.09, isClear: false, isShow: true),
                    buttons(id: "tana2", imageName: "tana7", ratio_x: 1.7, ratio_y: 0.6, size_w: phone.w*0.23, size_h:  phone.h*0.07, isClear: false, isShow: true),
                    buttons(id: "tana3", imageName: "tana1", ratio_x: 2.65, ratio_y: 0.5, size_w: phone.w*0.25, size_h: phone.h*0.17, isClear: false, isShow: true),
                    //ドア
                    buttons(id: "door", imageName: "door1", ratio_x: 3.32, ratio_y: 0.53, size_w: phone.w*0.41, size_h: phone.h*0.4, isClear: false, isShow: true),
                    
                    //
                    buttons(id: "gatya", imageName: "gatya", ratio_x: 3.7, ratio_y: 0.65, size_w: phone.w*0.4, size_h: phone.h*0.2, isClear: false, isShow: true),
                    //ボックス（問題あり）
                    buttons(id: "box1", imageName: "box1", ratio_x: 1.3, ratio_y: 0.6, size_w: phone.w*0.26 , size_h:phone.h*0.13, isClear: false, isShow: true),
                    
                    //透明（問題あり）
                    buttons(id: "tomei", imageName: "tomei1", ratio_x: 0.3, ratio_y: 0.6, size_w: phone.w*0.26 , size_h:phone.h*0.13, isClear: false, isShow: true),
                    
                    
                    
                    //本(写真だけ）
                    buttons(id: "Img_book1", imageName: "book1", ratio_x: 0.7, ratio_y: 0.05, size_w: phone.w*0.107 , size_h: phone.h*0.05, isClear: false, isShow: true),
                    buttons(id: "Img_book2", imageName: "book1", ratio_x: 2.7, ratio_y: 0.05, size_w: phone.w*0.107 , size_h: phone.h*0.05, isClear: false, isShow: true),
                    buttons(id: "Img_book4", imageName: "book1", ratio_x: 3.7, ratio_y: 0.05, size_w: phone.w*0.107 , size_h: phone.h*0.05, isClear: false, isShow: true),

        ]
    }
    
    //ボタンの配列
    @Published var buttonArray: [buttons] = []
    // アイテムバー
    @Published var itemBar: [items] = []


    //写真のView
    @Published var questionview = 0
    
    //選んだアイテム
    @Published var selectItem = ""
    @Published var number = 1
    //たな
    @Published var opentana1 = 0
    @Published var opentana2 = 0
    @Published var opentana3 = 0
    //タイマー
    @Published var timerHandler: Timer?
    @Published var count = 0.0
    @AppStorage ("timer_value")var timerValue = 600.0


    // ボタンの処理(idによってぶんき)
    func buttonShori(id: String) {
        //問題が正解したら同じ問題に触れれなくなる
        if buttonArray[getIndex(id: id, isItem: false)].isClear {
            print("[\(id)] クリア済み")
        } else {
            print("[\(id)]")
            switch id {
        
            case "tana1": Opentana1(id: id)
            case "tana2": Opentana2()
            case "tana3" : Opentana3()
                //本
            case "book1":Qestion(id: id);fallbook()
            case "book2": Qestion(id: id)
            case "book3": Qestion(id: id)
            case "book4": Qestion(id: id);fallbook()
            case "tomei":toumei(id:id)
                //ボックス
            case "box1": openbox1(id: id)
                //脱出ドア
            case "door": opendoor()
            
            case "gatya" :gatya(id: id)
            default : break

            }
        }

    }

    
    
    
    //ボックスを選択してる時だけ画像切り替え
    func openbox1(id: String) {
        // ボックスを選択しているとき
        if itemBar[2].isPossession && selectItem == "key1"{
            // itemBarに鍵を追加

            buttonArray[getIndex(id: "box1", isItem: false)].imageName = "questionbox"
            Qestion(id: id)
        }
    }
    //ボックスを選択してる時だけ画像切り替え
    func toumei(id: String) {
        // ボックスを選択しているとき
        if itemBar[3].isPossession && selectItem == "hammer"{

            buttonArray[getIndex(id: "tomei", isItem: false)].imageName = "tomei2"
            Qestion(id: id)
            doorkey()
        }
    }
    
    
    
  
    
    
    //たなを選択してる時だけ画像切り替え
    func Opentana1(id: String) {

        
        if opentana1 == 0{
            // たなの画像を差し替える
            buttonArray[getIndex(id: "tana1", isItem: false)].imageName = "tana8"
            opentana1 = 1
            Qestion(id: id)
            

        }else if opentana1 == 1 {
            buttonArray[getIndex(id: "tana1", isItem: false)].imageName = "tana6"
            opentana1 = 2
        }else if opentana1 == 2 {
            buttonArray[getIndex(id: "tana1", isItem: false)].imageName = "tana8"
            opentana1 = 1
        }
    }
    //たなを選択してる時だけ画像切り替え
    func Opentana2() {
    
        if opentana2 == 0{
            // たなの画像を差し替える
            //コインの画像
            buttonArray[getIndex(id: "tana2", isItem: false)].imageName = "tana9"
            opentana2 = 1
            coin()

        }else if opentana2 == 1 {
            buttonArray[getIndex(id: "tana2", isItem: false)].imageName = "tana9"
            opentana2 = 2
        }else if opentana2 == 2 {
            buttonArray[getIndex(id: "tana2", isItem: false)].imageName = "tana7"
            opentana2 = 1
        }
    }
    
    //たなを選択してる時だけ画像切り替え
    func Opentana3() {
        if opentana3 == 0{
            // たなの画像を差し替える
            buttonArray[getIndex(id: "tana3", isItem: false)].imageName = "tanaa"
            opentana3 = 1
            
            
            
        }else if opentana3 == 1 {
            buttonArray[getIndex(id: "tana3", isItem: false)].imageName = "tana3"
            hammer()
            opentana3 = 3
        }else if opentana3 == 2 {
            buttonArray[getIndex(id: "tana3", isItem: false)].imageName = "tana3"
            
        }
    }
    
    
    
    func Qestion(id: String) {
        questionview = 1
        isClearChecker(id: id)
    }
    // id指定したidのisClearをtrueに変更
    func isClearChecker(id: String) {
        buttonArray[getIndex(id: id, isItem: false)].isClear = true
    }
    
    
    
    
    //脱出ドアを選択してる時だけ画像切り替え
    func opendoor() {
        // doorkeyを選択しているとき
        if itemBar[0].isPossession && selectItem == "doorkey"{
            // ドアの画像を差し替える
            buttonArray[getIndex(id: "door", isItem: false)].imageName = "door2"
           stopTimer()
            questionview = 3
            
        }
    }
    //ガチャコイン選択してる時だけ画像切り替え
    func gatya(id: String) {
        // doorkeyを選択しているとき
        if itemBar[1].isPossession && selectItem == "coin"{
            Qestion(id: id)
            questionkey()
            
            
        }
    }
    
    //倒れてる本
    func fallbook() {
        // 本の画像を差し替える　文字を書いてる風
        buttonArray[getIndex(id: "book1", isItem: false)].imageName = "book4"
        
    }
    
    //鍵Viewにないとき
    func questionkey() {
        // itemBarに鍵を追加
        itemBar[getIndex(id: "key1", isItem: true)].isPossession = true
    }
    
    //コインViewにないとき
    func coin() {
        // itemBarにコインを追加
        itemBar[getIndex(id: "coin", isItem: true)].isPossession = true
    }
    //hammerViewにないとき
    func hammer() {
        // itemBarにhammerを追加
        itemBar[getIndex(id: "hammer", isItem: true)].isPossession = true
    }


    
  
    //doorkeyViewにないとき
    func doorkey() {
        // itemBarにdoorkeyを追加
        itemBar[getIndex(id: "doorkey", isItem: true)].isPossession = true
    }
    
    
  
  
    
    
    
    //タイマー
    //スタート
    func startTimer(){

        if let unwrapedTimerHandler = timerHandler{
            if unwrapedTimerHandler.isValid == true {
                return
            }
        }

        timerHandler = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){_ in
            self.conuntDownTime()
        }
    }
    //カウントダウン
    func conuntDownTime() {
        count -= 0.01

    }
    //ストップ
    func stopTimer(){
        if let unwrapedTimerHandler = timerHandler {
            if unwrapedTimerHandler.isValid {
                unwrapedTimerHandler.invalidate()
            }
        }
    }


    // idを参照して、buttonArrayの何番目にあるか返す
    // 使い方 buttonArray[getIndex(id: aaa1)] -> 0
    // アンミカはbuttonArrayの0番目だということ
    func getIndex(id: String, isItem: Bool) -> Int {
        if isItem {
            // アイテムの場合
            if let index = itemBar.firstIndex(where: {$0.id.elementsEqual(id)}){
                print("[item] index:\(index), id: \(itemBar[index].id)")
                return index
            } else {
                return 99
            }
        } else {
            // ボタンの場合
            if let index = buttonArray.firstIndex(where: {$0.id.elementsEqual(id)}){
                print("[button] index:\(index), id: \(buttonArray[index].id)")
                return index
            } else {
                return 99
            }
        }
    }
}
