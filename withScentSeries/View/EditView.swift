//
//  MainView.swift
//  withScentSeries
//
//  Created by LOUIE MAC on 2023/08/29.
//

import UIKit

class EditView: BaseView {
    
    var user: CustomUser? {
        didSet {
            guard let user = user else { return }
            self.mainImageView.image = user.photo
            self.titleLabel.text = user.title
            self.writtenDate.text = user.writtenDate
            self.descriptionLabel.text = user.description
        }
    }
    
    var mainImageView: UIImageView = {
        var view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear
        return view
    }()
    
    var titleLabel: UITextField = {
        let label = UITextField()
        label.textAlignment = .left
        label.textColor = .black
        label.font = FontPreset.title
        return label
    }()
    
    let writtenDate: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = FontPreset.writtenDate
        return label
    }()
    
    var descriptionLabel: UITextView = {
        let tv = UITextView()
        tv.isEditable = true
        tv.font = FontPreset.description
        tv.textAlignment = .left
        tv.textColor = .black
        return tv
    }()
    
    override func configureView() {
        self.addSubview(mainImageView)
        self.addSubview(titleLabel)
        self.addSubview(writtenDate)
        self.addSubview(descriptionLabel)
    }
    
    override func setConstraints() {
        DispatchQueue.main.async {
            self.mainImageView.snp.makeConstraints { make in
                make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
                make.height.equalTo(self).multipliedBy(0.3)
            }
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(4)
            make.leading.equalTo(self).offset(8)
            make.width.equalTo(self).multipliedBy(0.4)
            make.height.equalTo(self).multipliedBy(0.1)
        }
        
        writtenDate.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(self).offset(-12)
            make.height.equalTo(titleLabel)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(self).inset(12)
            make.height.equalTo(self.safeAreaLayoutGuide)
        }
    }
        
    
}
