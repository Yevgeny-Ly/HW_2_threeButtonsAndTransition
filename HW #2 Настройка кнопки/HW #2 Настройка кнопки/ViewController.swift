//
//  ViewController.swift
//  HW #2 Настройка кнопки
//
//  Created by Евгений Л on 05.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let buttonFirst  = UIButton()
    private let buttonSecond = UIButton()
    private let buttonThird  = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        firstButton()
        secondMediumButton()
        thirdButton()
    }
    
    //MARK: - setup buttons
    func firstButton() {
        buttonFirst.configuration                      = .borderedProminent()
        buttonFirst.configuration?.baseBackgroundColor = .systemBlue
        buttonFirst.configuration?.title               = "Button First"
        buttonFirst.configuration?.baseForegroundColor = .white
        buttonFirst.configuration?.image               = UIImage(systemName: "arrow.right.circle.fill")
        buttonFirst.semanticContentAttribute           = .forceRightToLeft
        
        buttonFirst.addTarget(self, action: #selector(animateDown), for: [.touchDown])
        buttonFirst.addTarget(self, action: #selector(animateUp), for: [.touchUpInside])
        
        buttonFirst.configuration?.imagePadding           = 8
        buttonFirst.configuration?.contentInsets.top      = 10
        buttonFirst.configuration?.contentInsets.bottom   = 10
        buttonFirst.configuration?.contentInsets.leading  = 14
        buttonFirst.configuration?.contentInsets.trailing = 14
        
        addButtonConstraints()
    }
    
    func secondMediumButton() {
        buttonSecond.configuration                      = .borderedProminent()
        buttonSecond.configuration?.baseBackgroundColor = .systemBlue
        buttonSecond.configuration?.title               = "Second Medium Button"
        buttonSecond.configuration?.baseForegroundColor = .white
        buttonSecond.configuration?.image               = UIImage(systemName: "arrow.right.circle.fill")
        buttonSecond.semanticContentAttribute           = .forceRightToLeft
        
        buttonSecond.addTarget(self, action: #selector(animateDown), for: [.touchDown])
        buttonSecond.addTarget(self, action: #selector(animateUp), for: [.touchUpInside])
        
        buttonSecond.configuration?.imagePadding           = 8
        buttonSecond.configuration?.contentInsets.top      = 10
        buttonSecond.configuration?.contentInsets.bottom   = 10
        buttonSecond.configuration?.contentInsets.leading  = 14
        buttonSecond.configuration?.contentInsets.trailing = 14
        
        addButtonConstraints()
    }
    
    func thirdButton() {
        buttonThird.configuration                      = .borderedProminent()
        buttonThird.configuration?.baseBackgroundColor = .systemBlue
        buttonThird.configuration?.title               = "Third"
        buttonThird.configuration?.baseForegroundColor = .white
        buttonThird.configuration?.image               = UIImage(systemName: "arrow.right.circle.fill")
        buttonThird.semanticContentAttribute           = .forceRightToLeft
        
        buttonThird.addTarget(self, action: #selector(animateDown), for: [.touchDown])
        buttonThird.addTarget(self, action: #selector(animateUp), for: [.touchUpInside])
        buttonThird.addTarget(self, action: #selector(transitionModalController(sender:)), for: .touchUpInside)
        
        buttonThird.configuration?.imagePadding           = 8
        buttonThird.configuration?.contentInsets.top      = 10
        buttonThird.configuration?.contentInsets.bottom   = 10
        buttonThird.configuration?.contentInsets.leading  = 14
        buttonThird.configuration?.contentInsets.trailing = 14
        
        addButtonConstraints()
    }
    
    //MARK: - constraints
    func addButtonConstraints() {
        [buttonFirst, buttonSecond, buttonThird].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            buttonFirst.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            buttonFirst.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonSecond.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            buttonSecond.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonThird.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            buttonThird.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //MARK: - selector
    @objc private func transitionModalController(sender: Any) {
        let modalController = ModalViewController()
        present(modalController, animated: true)
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    //MARK: - adjusting the button animation
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.15,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
            button.transform = transform
        })
    }
    
    
    private func animateView(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.15,
                       delay: 0,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseIn,
                       animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            UIView.animate(withDuration: 0.15,
                           delay: 0,
                           usingSpringWithDamping: 0.4,
                           initialSpringVelocity: 2,
                           options: .curveEaseIn,
                           animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
}

