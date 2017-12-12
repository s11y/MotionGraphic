//
//  ViewController.swift
//  MotionGraphic
//
//  Created by hahahahahanananana on 2017/10/31.
//  Copyright © 2017年 片岡. All rights reserved.
//

import UIKit
import C4

class ViewController: CanvasController {
    
    private var blueShape: Shape!
    var number: Int!
    
    private func createCircle() -> Circle {
        let rect = Rect(0, 0, 50, 50)
        return Circle(frame: rect)
    }
    override func setup() {
        canvas.backgroundColor = black
        ShapeLayer.disableActions = true
        loadShape()
    }
    
    
    func createShape(center: Point, color: Color, radius: Double) -> Shape {
        
        let shape = Circle(center: center, radius: radius)
        shape.lineWidth = 20.0
        shape.strokeColor = color
        shape.fillColor = clear
        self.canvas.add(shape)
        return shape
        
    }
    var blueshapenumber: Int = 1
    
    override func viewWillAppear(_ animated: Bool) {
        //始まる方向を指定
        blueShape.rotation = -0.5 * Double.pi
    }
    
    func loadShape(){
        //radius円の大きさ
        blueShape = createShape(center: canvas.center, color: Color(red: 0.933, green: 1.0, blue:0.0, alpha: 1.0), radius: 55.0)
        blueShape.strokeStart = 0.0
        blueShape.strokeEnd = 0.001
    }
    
    func blueshape1(){
        
        let move = ViewAnimation(duration: 1.0){
            self.blueShape.strokeEnd = 1
        }
        move.animate()
        blueshapenumber = 0
        wait(1.1){
            let disapper = ViewAnimation(duration:1.0){
                self.blueShape.strokeEnd = -1
            }
            disapper.animate()
            self.blueshapenumber = 1
        }
    }
    
    func rect(){
        
        let orange = createCircle()
        let orangeColor = Color(red: 0.933, green: 1.0, blue:0.0, alpha: 1.0)
        orange.fillColor = orangeColor
        orange.strokeColor = orangeColor
        orange.center = canvas.center
        canvas.add(orange)
        
        // MARK: - Animations
        let scale = Transform.makeScale(100, 100)
        let fadeOutColor = orangeColor
        
        let orangeAnim = ViewAnimation(duration: 1.0) {
            orange.transform = scale
            orange.fillColor = fadeOutColor
        }
        let sequence = ViewAnimationSequence(animations: [
            orangeAnim
            ])
        sequence.duration = 0.5
        wait(0.5) {
            sequence.animate()
            
            wait(0.45){
            self.canvas.backgroundColor = Color(red: 0.933, green: 1.0, blue:0.0, alpha: 1.0)
            }
        }
    }
        
    @IBAction func didTapCanvas(_ sender: Any){
//        number = Int(arc4random_uniform(2))
//        if number == 1{
//            blueshape1()
//            print("blueShape")
//        } else {
            rect()
            print("Rect")
//        }
    }
}



