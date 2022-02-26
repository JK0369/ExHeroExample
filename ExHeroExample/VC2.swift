//
//  VC2.swift
//  ExHeroExample
//
//  Created by 김종권 on 2022/02/26.
//

import UIKit
import Hero

class VC2: UIViewController {
  private enum Constants {
    static let itemSize = CGSize(width: 60, height: 72)
    static let lineSpacing = 4.0
    static let minimumInteritemSpacing = 0.0
    static let collectionViewContentInset = UIEdgeInsets(top: 10, left: 6, bottom: 10, right: 6)
  }
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.backgroundColor = .systemGray
    label.textAlignment = .center
    label.text = "예제 타이틀"
    label.isHeroEnabled = true
    label.hero.id = "myAnimation"
    return label
  }()
  private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
    let view = UICollectionViewFlowLayout()
    view.itemSize = Constants.itemSize
    view.minimumLineSpacing = Constants.lineSpacing
    view.minimumInteritemSpacing = Constants.minimumInteritemSpacing
    return view
  }()
  private lazy var collectionView: UICollectionView = {
    let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
    view.contentInset = Constants.collectionViewContentInset
    view.backgroundColor = UIColor.clear
    view.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
    return view
  }()
  
  private var dataSource: [Int] { (0...50).map { $0 } }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
    self.view.addSubview(self.collectionView)
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false
    self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -56).isActive = true
    self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
    self.collectionView.dataSource = self
    
    self.view.addSubview(self.titleLabel)
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
    self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120).isActive = true
    self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    self.titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    self.titleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    self.collectionView.hero.modifiers = [.cascade]
  }
}

extension VC2: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    self.dataSource.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
    cell.prepare(text: "\(self.dataSource[indexPath.item])")
    cell.hero.modifiers = [.fade, .scale(0.5)]
    return cell
  }
}

final class MyCell: UICollectionViewCell {
  private let label: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.contentView.backgroundColor = .red
    self.contentView.addSubview(self.label)
    self.label.translatesAutoresizingMaskIntoConstraints = false
    self.label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    self.label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    self.label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    self.contentView.layer.cornerRadius = 14
    self.contentView.layer.cornerCurve = .continuous
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare(text: nil)
  }
  
  func prepare(text: String?) {
    self.label.text = text
  }
}
