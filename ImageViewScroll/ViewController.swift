//
//  ViewController.swift
//  ImageViewScroll
//
//  Created by Ryan Wieghard on 9/23/16.
//  Copyright © 2016 Blauverschiebung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
  var scrollView: UIScrollView!
  var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    scrollView = UIScrollView(frame: view.bounds)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    let myImage = UIImage(named: "shaq")
    imageView = UIImageView(image: myImage)
    scrollView.delegate = self
    
    scrollView.addSubview(imageView)
    self.view.addSubview(scrollView)
    scrollView.minimumZoomScale = 1.0
    scrollView.maximumZoomScale = 3.0
    
    let tap = UITapGestureRecognizer()
    tap.numberOfTapsRequired = 2
    tap.addTarget(self, action: #selector(ViewController.handleDoubleTap))
    scrollView.userInteractionEnabled = true
    scrollView.addGestureRecognizer(tap)
  
    let dictionary = ["scrollView" : scrollView]
    self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[scrollView]-0-|",
      options: [],
      metrics: nil,
      views: dictionary))
    self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[scrollView]-0-|",
      options: [],
      metrics: nil,
      views: dictionary))
    
    let dictionary2 = ["imageView" : imageView]
    scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[imageView]-0-|",
      options: [],
      metrics: nil,
      views: dictionary2))
    scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[imageView]-0-|",
      options: [],
      metrics: nil,
      views: dictionary2))

  }
  
  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    return self.imageView
  }

  func handleDoubleTap(){
    if self.scrollView.zoomScale > self.scrollView.minimumZoomScale {
      self.scrollView.setZoomScale(self.scrollView.minimumZoomScale, animated: true)
    } else {
      self.scrollView.setZoomScale(self.scrollView.maximumZoomScale, animated: true)
    }
  
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

