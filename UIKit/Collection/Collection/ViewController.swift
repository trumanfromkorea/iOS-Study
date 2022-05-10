//
//  ViewController.swift
//  Collection
//
//  Created by 장재훈 on 2022/05/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 아이템 사이즈를 정하기 위함
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        
        // 커스텀 cell 과 연결하기 위함
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate {
    // cell 이 눌렸을때 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        print("tapped!")
    }
}

extension ViewController: UICollectionViewDataSource {
    // cell 개수 지정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    // cell 리턴해주는 메소드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        // 이미지 연결해주는 부분
        cell.configure(with: UIImage(named: "image")!)

        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    // 사이즈를 지정해줌
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
