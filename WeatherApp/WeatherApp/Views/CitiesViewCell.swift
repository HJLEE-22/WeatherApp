//
//  CitiesViewCell.swift
//  WeatherApp
//
//  Created by 이형주 on 2022/10/11.
//

import UIKit
import CoreMedia

protocol CellButtonActionDelegate: AnyObject {
    func bookmarkButtonTapped(_ id: String)
}



class CitiesViewCell: UITableViewCell {

    // MARK: - Properties
    
    var cellDelegate: CellButtonActionDelegate?

    lazy var locationLabel: UILabel = {
       
        let label = UILabel()
        label.text = "강남구"
        
        return label
        
    }()
    
   
    
    lazy var descriptionLabel: UILabel = {
       
        let label = UILabel()
        label.text = "맑음"
        
        
        return label
        
    }()
    
    lazy var leftStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [locationLabel, descriptionLabel])
        sv.axis = .vertical
        
        return sv
    }()
    
    lazy var weatherImageView: UIImageView = {
        let image = UIImage(systemName: "sun.max")
       let iv = UIImageView(image: image)
        
        return iv
        
    }()
    
    lazy var currentDegreeTitle: UILabel = {
       let label = UILabel()
        
        label.text = "18°C"
        return label
        
    }()
    
    lazy var currntStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [weatherImageView, currentDegreeTitle])
        sv.axis = .horizontal
        
        return sv
    }()


    
    lazy var maxDegreeLabel: UILabel = {
       
        let label = UILabel()
        label.text = "최고 20°"
        
        
        return label
        
    }()
    lazy var minDegreeLabel: UILabel = {
       
        let label = UILabel()
        label.text = "최저 8°"
        
        
        return label
        
    }()
    
    lazy var degreeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [maxDegreeLabel, minDegreeLabel])
        
        
        return sv
    }()
    
    lazy var rightStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [currntStackView, degreeStackView])
        sv.axis = .vertical
        
        return sv
    }()
    
    // MARK: - LifeCycle
    
    // 커스텀 셀 작성시 삽입
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()

//        self.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    // MARK: - Actions
    
    @objc func bookmarkButtonTapped() {

    }
    
    // MARK: - Helpers
    
   
    func configureUI() {
        // 테이블뷰에 코드로 ui 작성할 때 contentView 위에다가 놓기.
        
        contentView.addSubview(leftStackView)
        contentView.addSubview(rightStackView)
        
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftStackView.topAnchor.constraint(equalTo: self.topAnchor),
            leftStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            leftStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            leftStackView.widthAnchor.constraint(equalToConstant: self.frame.width / 2),
            
            rightStackView.topAnchor.constraint(equalTo: self.topAnchor),
            rightStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            rightStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            rightStackView.widthAnchor.constraint(equalToConstant: self.frame.width / 2),
            rightStackView.leadingAnchor.constraint(equalTo: leftStackView.trailingAnchor),
        ])
        

    }
    

    

}



