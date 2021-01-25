//
//  EffectDetailsViewController.swift
//  Animatify
//
//  Created by Shubham Singh on 19/06/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit

class EffectDetailsViewController: UIViewController {
    
    override class func description() -> String {
        return "EffectDetailsViewController"
    }
    
    // MARK:- outlets for the viewController
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var effectContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stepsView: UIView!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var expandButton: UIButton!
    
    // MARK:- variables for the viewController
    var backgroundOpacity: CGFloat = 1
    var effect: Effect?
    var scrollViewToggled: Bool = false {
        didSet {
            if (scrollViewToggled) {
                self.scrollView.roundCorners(cornerRadius: 32)
            } else {
                self.scrollView.roundCorners(cornerRadius: 20)
            }
        }
    }
    
    // MARK:- lifecycle methods for the viewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = effect?.title
        self.descriptionTextView.text = effect?.description
        
        self.setupViews()
        self.expandButton.sendActions(for: .touchUpInside)
        self.expandButton.isHidden = true
    }
    
    // MARK:- outlets for the viewController
    @IBAction func expandButtonPressed(_ sender: Any) {
        ViewAnimationFactory.makeEaseInOutAnimation(duration: 0.75, delay: 0) {
            self.expandButton.transform = self.expandButton.transform.rotated(by: +CGFloat.pi + 0.00000001)
            var containerViewTransform = CGAffineTransform.identity
            containerViewTransform = containerViewTransform.translatedBy(x: 0, y: self.view.frame.height - self.scrollView.frame.origin.y - 80)
            self.scrollView.transform = containerViewTransform
            self.scrollViewToggled = !self.scrollViewToggled
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK:- utility functions for the viewController
    func setupViews(){
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.expandButton.transform = self.expandButton.transform.rotated(by: +CGFloat.pi + 0.00000001)
            var scrollViewTransform = CGAffineTransform.identity
            scrollViewTransform = scrollViewTransform.translatedBy(x: 0, y: self.view.frame.height - self.scrollView.frame.origin.y - 80)
            self.scrollView.transform = scrollViewTransform
            
            ///setting the effectscontainerView
            self.effectContainerView.roundCorners(cornerRadius: 12)
            let gradient = CAGradientLayer()
            gradient.setGradientLayer(color1: self.effect!.gradientColor1, color2: self.effect!.gradientColor2, for: self.effectContainerView, cornerRadius: self.effectContainerView.layer.cornerRadius)
            self.effectContainerView.layer.addSublayer(gradient)
            
            if (self.effect?.action == EffectType.pulse) {
                let pulseLayer = PulseLayer(radius: 12, for: self.effectContainerView, scale: 1.5, with: UIColor.systemIndigo.withAlphaComponent(0.8), animationDuration: 1.25)
                self.view.layer.insertSublayer(pulseLayer, below: self.effectContainerView.layer)
            } else if (self.effect?.action == EffectType.shimmer) {
                let shimmerLayer = ShimmerLayer(for: self.effectContainerView, cornerRadius: 12)
                self.view.layer.insertSublayer(shimmerLayer, above: self.effectContainerView.layer)
                shimmerLayer.startAnimation()
            }
            self.setInstructions()
        }
    }
    
    func setInstructions(){
        guard let effect = self.effect else { return }
        
        /// getting the initial value for the y axis
        var dy: CGFloat = self.instructionLabel.frame.origin.y + self.instructionLabel.frame.height + 24
        let stepLabelSize: CGFloat = 42
        
        for (ix,instruction) in effect.instructions.enumerated() {
            let stepLabel = UILabel()
            stepLabel.font = UIFont(name: "MuseoModerno-Medium", size: 21)
            stepLabel.text = "\(ix + 1)"
            stepLabel.textAlignment = .center
            stepLabel.textColor = Colors.label
            stepLabel.setBorderAndCorner(borderColor: UIColor.systemTeal, borderWidth: 2, cornerRadius: 21)
            stepLabel.frame = CGRect(x: 24, y: dy + stepLabel.intrinsicContentSize.height / 2, width: stepLabelSize, height: stepLabelSize)
            
            let descriptionLabel = UILabel()
            descriptionLabel.font = UIFont(name: "Montserrat-Regular", size: 18.5)
            descriptionLabel.textColor = Colors.label
            descriptionLabel.text = instruction
            descriptionLabel.numberOfLines = 3
            
            descriptionLabel.frame = CGRect(x: stepLabelSize * 2, y: dy + (descriptionLabel.intrinsicContentSize.height / 1.75), width: (self.scrollView.frame.width - (24 * 3) - stepLabelSize), height: descriptionLabel.intrinsicContentSize.height)
            descriptionLabel.sizeToFit()
            
            dy += descriptionLabel.frame.size.height + 24
            // adding the labels to the scrollview
            self.stepsView.addSubview(stepLabel)
            self.stepsView.addSubview(descriptionLabel)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: dy + 72)
        }
    }
}
