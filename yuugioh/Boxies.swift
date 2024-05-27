//
//  Boxies.swift
//  yuugioh
//
//  Created by 高橋沙久哉 on 2024/04/29.
//

import SwiftUI

class DamegeList{
     var Point:[Int]=[8000]
     var Points:[Int]=[8000]
     var DamegePoint:[String]=[""]
     var DamegePoints:[String]=[""]
    @State var PointCount=0
    //インスタンス化された時に呼び出される特別な関数(初期化処理)
    
    
    func PointSave(number:Int){
        Point.append(number)
        print(Point.count)
        
    }
    func PointSaves(number:Int){
        Points.append(number)
        print(Points.count)
        
    }
    func DamegeCount(number:String){
        DamegePoint.append(number)
    }
    func DamegeCounts(number:String){
        DamegePoints.append(number)
    }
    //この上の４つは、ログを作るための配列
    func reset()->Int{
        //Flagという機能で、Bool:true,falseのFlagでの切り替えが可能となる。場合によって、lifePoint,lifePointsの代入右切り替えが可能となった。
        //一つ前のデータに配列を使ってのアクセスは、インデックスを変数に対応させ、対応させる変数は、「配列の全要素数−１」の値をInt型で、保存できる状態変数である必要がある。
        if Point.count>1{
            Point=Point.dropLast()//droplast()は、配列の末尾を取り除いた、配列を返す関数
            return Point.last ?? 8000
        }
        else{
            return 8000
        }
    }
    
    func reset2()->Int{
        if Points.count>1{
            Points=Point.dropLast()//droplast()は、配列の末尾を取り除いた、配列を返す関数
            return Point.last ?? 8000
        }
        else{
            return 8000
        }
    }
    //配列の要素の値を全て出力
    //Textは、SwiftUIの中じゃないと、出力できない。
    
    //}
    func arraycancelar(){
        Point=[0]
        Points=[0]
        DamegePoint=[""]
        DamegePoints=[""]
        Point[0]=8000
        Points[0]=8000
        DamegePoint[0]=""
        DamegePoints[0]=""
    }
    
    
        func Boxcpy(number: inout [Int], from Point: [Int]){
            //配列コピー用の書き方
            //(number:inout[int],from //Point:[Int]この意味は、Point:[Int]from,number:[Int]へ、コピー元として、呼び出すことを意味する。また、number:inout[Int]は、この関数を呼び出した後、呼び出し引数であるnumberに配列の中身をコピーさせるつまり、numberに影響を与えるので、number:inout////[Int]じゃないといけない。）
            number = Point
            
        }
    
    func StringBoxcpy(Boxes:inout[String],from a:[String]){
        Boxes=a
    }
}
