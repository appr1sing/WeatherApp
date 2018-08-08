//
//  ViewController.swift
//  WeatherApp
//
//  Created by Arvin San Miguel on 8/7/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var data = [WeatherInfo]()
    
    var collectionView: UICollectionView!
    var titleLabel: UILabel!
    var indicator : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        indicator.startAnimating()
        AerisAPIClient.shared.requestWeatherData { json in
            OperationQueue.main.addOperation { [unowned self] in
                self.data = Worker.parse(json)
                self.collectionView.reloadData()
                self.indicator.stopAnimating()
                self.indicator.hidesWhenStopped = true
                }
            }
        }
}

extension WeatherViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCollectionViewCell
        cell.dateLabel.text = dateToString(data[indexPath.row].date)
        cell.minTempLabel.text = String(data[indexPath.row].minF) + "˚"
        cell.maxTempLabel.text = String(data[indexPath.row].maxF) + "˚"
        cell.imageView.image = UIImage(named: data[indexPath.row].icon)
        return cell
    }
    
}


extension WeatherViewController {
    func dateToString(_ dateString: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        let dateObj = formatter.date(from: dateString)
        formatter.dateFormat = "MM-dd-yyyy"
        return formatter.string(from: dateObj!)
    
    }
}

extension WeatherViewController {
    
    func setupViews() {
        
        view.backgroundColor = .white
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.5)
        layout.minimumInteritemSpacing = 1.0
        layout.minimumLineSpacing = 1.0
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "WeatherCell")
        collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        collectionView.isPagingEnabled = true
        
        titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        titleLabel.text = "New York City"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "SFCompactDisplay-Semibold", size: 32)!
        titleLabel.textAlignment = .left
        
        indicator = UIActivityIndicatorView()
        indicator.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        indicator.center = view.center
        view.addSubview(indicator)
    }
    
}

