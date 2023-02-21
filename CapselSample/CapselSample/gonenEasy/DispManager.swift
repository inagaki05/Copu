//
//  DispManager.swift
//  EasySample1
//
//  Created by cmStudent on 2023/01/05.
//

import Foundation
import SwiftUI


class dispManager: ObservableObject {
    static let DispManager: dispManager = dispManager()
    //ボタンの配列
        @Published var buttonArray: [buttons] = []
        
    
    
    // アイテムバー
    @Published var itemBar: [items] = []
    
    //選んだアイテム
    @Published var selectItem = ""
    @Published var number = 1
    //写真のView
    @Published var questionview = 0
    
    //タイマー
    @Published var timerHandler: Timer?
    @Published var count = 0.0
    @AppStorage ("timer_value")var timerValue = 600.0
    
    init(){
        setbuttons()
        setitem()
    }
    
    func setitem(){
        itemBar = [
        //アイテムが増えるたびに追加する
        //ビン
        items(id: "bin", imageName: "bin03", size_w: 0.2, size_h: 0.2, isPossession: false),
        //ボックスの鍵
        items(id: "key1", imageName: "boxkey", size_w: 0.2, size_h: 0.2, isPossession: false),
        items(id: "key2", imageName: "boxkey", size_w: 0.2, size_h: 0.2, isPossession: false),
        //脱出ドアの鍵
        items(id: "doorkey", imageName: "doorkey", size_w: 0.2, size_h: 0.2, isPossession: false),
        ]
    }
    func setbuttons() {
        buttonArray = [
                //ボタンが増えるたびに追加する
                // 読み方　buttons(id: "ボタンのID", imageName: "画像の名前", ratio_x: 横の座標, ratio_y: 縦の座標, size_w: 横の画像のサイズ, size_h: 縦の画像のサイズ）
                //バケツ
                buttons(id: "baketu", imageName: "baketu06", ratio_x: 1.8, ratio_y: 0.65, size_w: phone.w*0.32, size_h: phone.h*0.16, isClear: false, isShow: true),
                //ボックス
                buttons(id: "box1", imageName: "box1", ratio_x: 0.3, ratio_y: 0.6, size_w: phone.w*0.26 , size_h:phone.h*0.13, isClear: false, isShow: true),
                buttons(id: "box2", imageName: "box1", ratio_x: 3.6, ratio_y: 0.7, size_w: phone.w*0.26 , size_h:phone.h*0.13, isClear: false, isShow: true),
                //問題の本
                buttons(id: "book1", imageName: "book2", ratio_x: 3.2, ratio_y: 0.7, size_w: phone.w*0.25, size_h: phone.h*0.12, isClear: false, isShow: true),
                buttons(id: "book2", imageName: "book", ratio_x: 0.57, ratio_y: 0.36, size_w: phone.w*0.05, size_h: phone.h*0.1, isClear: false, isShow: true),
                buttons(id: "book3", imageName: "book1", ratio_x: 2.8, ratio_y: 0.7, size_w: phone.w*0.2, size_h: phone.h*0.1, isClear: false, isShow: true),
                //ドア
                buttons(id: "door", imageName: "door1", ratio_x: 2.5, ratio_y: 0.5, size_w: phone.w*0.45, size_h: phone.h*0.47, isClear: false, isShow: true),
                //ボックスの鍵
                buttons(id: "key1", imageName: "boxkey", ratio_x: 3.5, ratio_y: 0.4, size_w: phone.w*0.08 , size_h:phone.w*0.08, isClear: false, isShow: true),
                //写真だけ
                //本棚(写真だけ）
                buttons(id: "Img_books", imageName: "books", ratio_x: 0.43, ratio_y: 0.35, size_w: phone.w*0.25, size_h: phone.h*0.12, isClear: false, isShow: true),
                //本棚(写真だけ）
                buttons(id: "Img_sofa", imageName: "sofa", ratio_x: 1.3, ratio_y: 0.55, size_w: phone.w*0.53, size_h: phone.h*0.21, isClear: false, isShow: true),
                //本棚(写真だけ）
                buttons(id: "Img_plant", imageName: "plant", ratio_x: 3.7, ratio_y: 0.5, size_w: phone.w*0.4, size_h: phone.h*0.2, isClear: false, isShow: true),
                //本(写真だけ）
                buttons(id: "Img_book1", imageName: "book1", ratio_x: 0.7, ratio_y: 0.05,  size_w: phone.w*0.107, size_h: phone.h*0.05 , isClear: false, isShow: true),
                buttons(id: "Img_book2", imageName: "book1", ratio_x: 1.7, ratio_y: 0.05,  size_w: phone.w*0.107, size_h: phone.h*0.05 , isClear: false, isShow: true),
                buttons(id: "Img_book3", imageName: "book1", ratio_x: 2.7, ratio_y: 0.05,  size_w: phone.w*0.107 , size_h: phone.h*0.05 , isClear: false, isShow: true),
                buttons(id: "Img_book4", imageName: "book1", ratio_x: 3.7, ratio_y: 0.05,  size_w: phone.w*0.107 , size_h: phone.h*0.05, isClear: false, isShow: true),
            
        ]
    }
    
    // ボタンの処理(idによってぶんき)
    func buttonShori(id: String) {
        //問題が正解したら同じ問題に触れれなくなる
        if buttonArray[getIndex(id: id, isItem: false)].isClear {
            print("[\(id)] クリア済み")
        } else {
            print("[\(id)]")
            switch id {
                //case "buttonsのID" : やりたいしょり
                //バケツタップ
            case "baketu": tapBaketu()
                //タップ便
                // case "bin": tapBin()
                //問題の入ってるボックス開ける
            case "box1": openbox1(id: id);
            case "box2": openbox2(id: id);
                //タップ鍵
            case "key1": tapkey()
                //問題
                //倒れてる本
            case "book1": Qestion(id: id); fallbook()
                //本
            case "book2": Qestion(id: id)
            case "book3": Qestion(id: id); standingbook(); questionkey()
                //脱出ドア
            case "door": opendoor()
                
            default : break
            }
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
    
    //たってる本
    func standingbook() {
        // 本の画像を差し替える　文字を書いてる風
        buttonArray[getIndex(id: "book3", isItem: false)].imageName = "book3"
        
    }
    //倒れてる本
    func fallbook() {
        // 本の画像を差し替える　文字を書いてる風
        buttonArray[getIndex(id: "book1", isItem: false)].imageName = "book4"
        
    }
    
    //便を選択してる時だけ画像切り替え
    func tapBaketu() {
        // 瓶を選択しているとき
        if itemBar[0].isPossession && selectItem == "bin"{
            // バケツの画像を差し替える
            buttonArray[getIndex(id: "baketu", isItem: false)].imageName = "baketu05"
            // アイテムバーのびんの画像を差し替える
            itemBar[0].imageName = "bin05"
            doorkey()
        }
    }
    //ボックスを選択してる時だけ画像切り替え
    func openbox1(id: String) {
        // ボックスを選択しているとき
        if itemBar[1].isPossession && selectItem == "key1"{
            // バケツの画像を差し替える
            // itemBarに鍵を追加

            buttonArray[getIndex(id: "box1", isItem: false)].imageName = "questionbox"
            tapBin()
            Qestion(id: id)

            //            // アイテムバーのびんの画像を差し替える
            //            itemBar[1].imageName = "box2"
        }
    }
    //ボックスを選択してる時だけ画像切り替え
    func openbox2(id: String) {
        // ボックスを選択しているとき
        if itemBar[2].isPossession && selectItem == "key2"{
            // バケツの画像を差し替える
            // itemBarに鍵を追加

            buttonArray[getIndex(id: "box2", isItem: false)].imageName = "questionbox"
            tapBin()
            Qestion(id: id)

            //            // アイテムバーのびんの画像を差し替える
            //            itemBar[1].imageName = "box2"
        }
    }
    //脱出ドアを選択してる時だけ画像切り替え
    func opendoor() {
        // doorkeyを選択しているとき
        if itemBar[3].isPossession && selectItem == "doorkey"{
            // ドアの画像を差し替える
            buttonArray[getIndex(id: "door", isItem: false)].imageName = "door2"
            // アイテムバーのdoorkeyの画像を差し替える
            itemBar[3].imageName = ""
           stopTimer()
            questionview = 3
        }
    }
    
    
 
    //瓶入手
    func tapBin() {
        // ??
        // itemBarにビンを追加
        itemBar[getIndex(id: "bin", isItem: true)].isPossession = true
        
    }
    //鍵入手Viewにある時
    func tapkey() {
        // itemBarに鍵を追加
        itemBar[getIndex(id: "key1", isItem: true)].isPossession = true
        // 画面上から鍵ボタンを消す
        buttonArray[getIndex(id: "key1", isItem: false)].isShow = false
    }
    //鍵Viewにないとき
    func questionkey() {
        // itemBarに鍵を追加
        itemBar[getIndex(id: "key2", isItem: true)].isPossession = true
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
