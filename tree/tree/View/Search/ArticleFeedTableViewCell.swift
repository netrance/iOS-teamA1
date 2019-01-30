//
//  ArticleFeedTableViewCell.swift
//  tree
//
//  Created by hyerikim on 26/01/2019.
//  Copyright © 2019 gardener. All rights reserved.
//

import UIKit

class ArticleFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imageStackView: UIStackView!
    @IBOutlet weak var outerStackView: UIStackView!
    @IBOutlet weak var articleOuterView: UIView!
    @IBOutlet weak var articleImageView: ArticleImage!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var position = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingArticleOuterView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func settingArticleOuterView() {
        articleOuterView.layer.cornerRadius = 10
    }
    
    func settingData(article: Article) {
        self.titleLabel.text = article.title
        self.descriptionLabel.text = article.body
        self.dateLabel.text = article.date
        self.companyLabel.text = article.source.title
        if article.author != nil && article.author?.isEmpty == false {
            if let author = article.author?[0].name {
                self.authorLabel.text = " / \(author)"
            }
        }
        if article.image == nil {
            self.imageStackView.isHidden = true
        } else {
            self.imageStackView.isHidden = false
            self.articleImageView.loadImageUrl(articleUrl: article.image ?? "")
        }
    }
    
}
