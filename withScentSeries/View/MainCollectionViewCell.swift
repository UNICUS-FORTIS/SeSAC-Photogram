//
//  CollectionViewCell.swift
//  withScentSeries
//
//  Created by LOUIE MAC on 2023/08/30.
//

import UIKit
import SnapKit
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {
    
    var user: CustomUser? {
        didSet {
            mainImageView.image = user?.photo
        }
    }
    
    var splashData: UnsplashResult? {
        didSet {
            let url = splashData?.urls.regular
            print("SplashData DidSet: \(url)")
//            mainImageView.kf.setImage(with: url)
        }
    }
    
    var mainImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        contentView.addSubview(mainImageView)
    }
    
    func setConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
