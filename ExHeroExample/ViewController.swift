//
//  ViewController.swift
//  ExHeroExample
//
//  Created by 김종권 on 2022/02/26.
//

import UIKit

class ViewController: UIViewController {
  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("open", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.setTitleColor(.lightGray, for: .highlighted)
    button.backgroundColor = .systemGray
    button.layer.cornerRadius = 14
    button.layer.cornerCurve = .continuous
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.button)
    self.button.translatesAutoresizingMaskIntoConstraints = false
    self.button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -40).isActive = true
    self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
    self.button.widthAnchor.constraint(equalToConstant: 50).isActive = true
    self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
  }
  
  @objc private func didTapButton() {
    let vc2 = VC2()
    self.navigationController?.pushViewController(vc2, animated: true)
  }
}
