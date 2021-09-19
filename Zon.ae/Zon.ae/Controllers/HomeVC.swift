//
//  HomeVC.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 18/09/2021.
//

import UIKit

class HomeVC: UIViewController {

    static let identifier = "HomeVC"
    
    var homeViewModel: HomeViewModel = HomeViewModel()
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var recentOrdersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getData()
    }
    
    @IBAction func didClickViewAllCategories(_ sender: Any) {
        self.showCustomAlert(title: "", message: "Feature Under Development", btnString: "Ok")
    }
    
    @IBAction func didClickViewAllRecentOrders(_ sender: Any) {
        self.showCustomAlert(title: "", message: "Feature Under Development", btnString: "Ok")
    }
    
    func getData() {
        homeViewModel.getCategoriesData(with: { categories, err in
            if let error = err {
                self.showCustomAlert(title: "Error", message: error.localizedDescription, btnString: "Ok")
            } else {
                self.getUser(withCategories: categories ?? [])
                
            }
        })
    }
    
    func getUser(withCategories categories: [Category]){
        
        homeViewModel.getUserData(with: {[weak self] user, error in
            guard let self = self else {return}
            
            if let error = error {
                self.showCustomAlert(title: "Error", message: error.localizedDescription, btnString: "Ok")
            } else {
                self.usernameLbl.text = (user?.userFirstName ?? "") + " " + (user?.userLastName ?? "")
                self.homeViewModel = HomeViewModel(user: user, categories: categories)
                self.tableViewHeight.constant = CGFloat((self.homeViewModel.getNumberOfOrders()) * 110)
                self.recentOrdersTableView.reloadData()
                self.categoriesCollectionView.reloadData()
            }
            
        })
    }
    
    func setViews(){
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: CategoriesColViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoriesColViewCell.identifier)
        
        recentOrdersTableView.delegate = self
        recentOrdersTableView.dataSource = self
        recentOrdersTableView.isScrollEnabled = false
        recentOrdersTableView.separatorStyle = .none
        recentOrdersTableView.register(UINib(nibName: RecentTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RecentTableViewCell.identifier)
        
        
        
    }
    
}

// MARK: - Table view Delegates

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return homeViewModel.getNumberOfOrders()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecentTableViewCell.identifier, for: indexPath) as! RecentTableViewCell
        cell.selectionStyle = .none
        cell.setCell(forProduct: self.homeViewModel.getOrderItemAtIndexPath(indexPath: indexPath) ?? Order())
        return cell
    }
}

// MARK: - Collection view Delegates
extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.getNumberOfCategories()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesColViewCell.identifier, for: indexPath) as! CategoriesColViewCell
            
        cell.setCell(forCategory: homeViewModel.getCategoryItemAtIndexPath(indexPath: indexPath))
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? CategoriesColViewCell else {return}
        
        cell.setCell(forCategory: homeViewModel.getCategoryItemAtIndexPath(indexPath: indexPath))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 124)
    }
}
