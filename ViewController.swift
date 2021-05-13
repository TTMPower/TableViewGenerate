//
//  ViewController.swift
//  HomeWork10.1
//
//  Created by Владислав Вишняков on 30.04.2021.
//

import UIKit

struct items {
    var price: String
    var image: UIImage?
}

class ViewController: UIViewController {
    
    var massiveData = [items]()
    
    func operation(){
        massiveData.append(contentsOf: [
            items(price: "1500 грошей", image: UIImage(named: "1")),
            items(price: "2000 грошей", image: UIImage(named: "2")),
            items(price: "1500 грошей", image: UIImage(named: "3")),
            items(price: "2000 грошей", image: UIImage(named: "4")),
            items(price: "1500 грошей", image: UIImage(named: "5")),
            items(price: "2000 грошей", image: UIImage(named: "6")),
            items(price: "1500 грошей", image: UIImage(named: "7")),
            items(price: "2000 грошей", image: UIImage(named: "8")),
        ])
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentInset.bottom = 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operation()
        
        self.title = "HW1"

    }


}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return massiveData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellPicture", for: indexPath) as! PictureCollectionViewCell
        let dataS = massiveData[indexPath.row]
        cell.ImageCell.image = dataS.image
        cell.textLabel.text = dataS.price
        return cell
        
    }

}

