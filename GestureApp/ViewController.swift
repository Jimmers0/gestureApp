//
//  ViewController.swift
//  GestureApp
//
//  Created by Jamie Randall on 1/9/18.
//  Copyright © 2018 Jamie Randall. All rights reserved.
//

import UIKit
import Flurry_iOS_SDK

class ViewController: UIViewController {
  
  @IBOutlet weak var imgView: UIImageView!
  @IBOutlet weak var showLabel: UILabel!
  @IBOutlet weak var madeInJapanLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    madeInJapanLabel.isHidden = true
    showLabel.isHidden = false
    
    imgView.layer.cornerRadius = 10
    imgView.clipsToBounds = true
    imgView.layer.borderWidth = 3
    imgView.layer.borderColor = UIColor.white.cgColor
    imgView.isHidden = true
    
    let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
    let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(recognizer:)))
    let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(recognizer:)))
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
    
    view.addGestureRecognizer(swipeGesture)
    
    imgView.isUserInteractionEnabled = true
    
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
    
    imgView.gestureRecognizers = [pinchGesture, panGesture, rotationGesture, longPressGesture, tapGesture]
    
  }
  
  @objc func pinchGesture(sender: UIPinchGestureRecognizer) {
    sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
    sender.scale = 1.0
    
  }
  
  @objc func handleSwipe(recognizer: UISwipeGestureRecognizer) {
    Flurry.logEvent("User Swiped")
    imgView.isHidden = false
    imgView.isUserInteractionEnabled = true
    showLabel.text = "Skyline GTR R32"
    showLabel.textColor = .purple
  }
  
  @objc func handlePan(recognizer: UIPanGestureRecognizer) {
    Flurry.logEvent("User Panned")
    let translationInView = recognizer.translation(in: self.imgView)
    recognizer.view!.center = CGPoint(x:view.center.x + translationInView.x, y:view.center.y + translationInView.y)
  }
  
  @objc func handleRotate(recognizer: UIRotationGestureRecognizer) {
    Flurry.logEvent("User Rotated Picture")
    if let view = recognizer.view {
      view.transform = view.transform.rotated(by: recognizer.rotation)
      recognizer.rotation = 0
    }
  }
  
  @objc func handleLongPress(recognizer: UILongPressGestureRecognizer) {
    showLabel.isHidden = true
    madeInJapanLabel.isHidden = false
  }
  
  @objc func handleTap(recognizer: UITapGestureRecognizer) {
    
    Flurry.logEvent("User Tapped")
    
    print("hello")
    showLabel.text = "Nissan"
    showLabel.textColor = .gray
  }
}

