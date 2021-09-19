//
//  CategoriesColViewCell.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 18/09/2021.
//

import UIKit

class CategoriesColViewCell: UICollectionViewCell {

    static let identifier = "CategoriesColViewCell"
    
    @IBOutlet weak var categoryImageIV      : UIImageView!
    @IBOutlet weak var categoryTitle        : UILabel!
    @IBOutlet weak var categoryDescription  : UILabel!
    @IBOutlet weak var categoryImageOV      : UIView!
    @IBOutlet weak var categoryOV           : UIView!
    
    var index = 0
    
    func setCell(forCategory category: Category){
        categoryImageIV.image = UIImage(named: category.categoryIconImage ?? "")
        categoryTitle.text = category.categoryName ?? ""
        categoryDescription.text = String(category.storeCountUnderCategory ?? 0) + " stores"
        categoryImageOV.layer.backgroundColor = UIColor.init(hexColor: category.categoryIconImageOVColor ?? "83DFC6").cgColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
