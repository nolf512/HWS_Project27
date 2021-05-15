//
//  ViewController.swift
//  HWS_Project27
//
//  Created by J on 2021/05/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var currentDrawType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawRectangle()
        
    }

    @IBAction func redrawTapped(_ sender: Any) {
        
        currentDrawType += 1
        
        if currentDrawType > 5 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
        case 1:
            drawCircle()
        default:
            break
        }
        
    }
    
    func drawRectangle(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let img = renderer.image { ctx in //ctx: UIGraphicsImageRendererContextへの参照パラメーター
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor) //長方形の内側の色
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor) //エッジ周りの色
            ctx.cgContext.setLineWidth(10) //線の幅　内側に5、外側に5
            
            ctx.cgContext.addRect(rectangle) //現在のパスに追加
            ctx.cgContext.drawPath(using: .fillStroke) //パスを描く
        }
        
        imageView.image = img
        
    }
    
    func drawCircle(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let img = renderer.image { ctx in //ctx: UIGraphicsImageRendererContextへの参照パラメーター
            let rectangle = CGRect(x: 0, y: 0, width: 502, height: 502)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor) //内側の色
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor) //エッジ周りの色
            ctx.cgContext.setLineWidth(10) //線の幅　内側に5、外側に5
            
            ctx.cgContext.addEllipse(in: rectangle) //現在のパスに追加 addEllipse → 円
            ctx.cgContext.drawPath(using: .fillStroke) //パスを描く
        }
        
        imageView.image = img
    }
    
}

