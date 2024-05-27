//
//  File.swift
//  yuugioh
//
//  Created by 高橋沙久哉 on 2024/04/17.
//


import SwiftUI

struct YokoViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = <#type#>
    
    func makeUIViewController(context: Context) -> YokoViewController {
        return YokoViewController()
    }
    
    func updateUIViewController(_ uiViewController: YokoViewController, context: Context) {
        // 必要な場合は更新処理を追加
    }
}
