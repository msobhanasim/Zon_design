//
//  TabNavigationMenu.swift
//  CustomTabNavigation
//
//  Created by Sprinthub on 14/10/2019.
//  Copyright © 2019 Sprinthub Mobile. All rights reserved.
//
// Changed by Agha Saad Rehman



import UIKit

class TabNavigationMenu: UIView {
    
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    var tabWidthConstraints: [NSLayoutConstraint] = [NSLayoutConstraint]()
    
    var tabViews: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
        
        print(frame)
        
        self.isUserInteractionEnabled = true
        
        self.clipsToBounds = true
        
        for i in 0 ..< menuItems.count {
            let itemView = self.createTabItem(item: menuItems[i])
            itemView.tag = i
            
            self.addSubview(itemView)
            
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.clipsToBounds = true
            
            tabViews.append(itemView)
        }
        
        for i in 0 ..< menuItems.count {
            
            let itemView = tabViews[i]
            
            NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: self.heightAnchor),
                itemView.topAnchor.constraint(equalTo: self.topAnchor),
            ])
            
            switch i {
            case 0:
                let view1 = tabViews[1]
                let view2 = tabViews[2]
                let view3 = tabViews[3]
                
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
                view1.leadingAnchor.constraint(equalTo: itemView.trailingAnchor, constant: 0.0).isActive = true
                view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 0.0).isActive = true
                view3.leadingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 0.0).isActive = true
                view3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
                
                itemView.widthAnchor.constraint(equalToConstant: frame.width * 0.4).isActive = true
                view1.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
                view2.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
                view3.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
                
            case 1:
                let view1 = tabViews[0]
                let view2 = tabViews[2]
                let view3 = tabViews[3]
                
                view1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
                itemView.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 0.0).isActive = true
                view2.leadingAnchor.constraint(equalTo: itemView.trailingAnchor, constant: 0.0).isActive = true
                view3.leadingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 0.0).isActive = true
                view3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20.0).isActive = true
                
//                itemView.widthAnchor.constraint(equalToConstant: frame.width * 0.4).isActive = true
//                view1.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
//                view2.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
//                view3.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
                
            case 2:
                let view1 = tabViews[0]
                let view2 = tabViews[1]
                let view3 = tabViews[3]
                
                view1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
                view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 0.0).isActive = true
                itemView.leadingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 0.0).isActive = true
                view3.leadingAnchor.constraint(equalTo: itemView.trailingAnchor, constant: 0.0).isActive = true
                view3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
                
//                itemView.widthAnchor.constraint(equalToConstant: frame.width * 0.4).isActive = true
//                view1.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
//                view2.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
//                view3.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
                
            case 3:
                let view1 = tabViews[0]
                let view2 = tabViews[1]
                let view3 = tabViews[2]
                
                view1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
                view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 0.0).isActive = true
                view3.leadingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 0.0).isActive = true
                itemView.leadingAnchor.constraint(equalTo: view3.trailingAnchor, constant: 0.0).isActive = true
                itemView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
                
//                itemView.widthAnchor.constraint(equalToConstant: frame.width * 0.4).isActive = true
//                view1.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
//                view2.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
//                view3.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
                
            default:
                let view1 = tabViews[1]
                let view2 = tabViews[2]
                let view3 = tabViews[3]
                
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
                view1.leadingAnchor.constraint(equalTo: itemView.trailingAnchor, constant: 0.0).isActive = true
                view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 0.0).isActive = true
                view3.leadingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 0.0).isActive = true
                view3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
                
//                itemView.widthAnchor.constraint(equalToConstant: frame.width * 0.4).isActive = true
//                view1.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
//                view2.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
//                view3.widthAnchor.constraint(equalToConstant: frame.width * 0.2).isActive = true
            }
            
            
            
            
        }
        
        /// `Old code was good for n number of tabs with smae width. As we wil be having different width per different tab so we will have to do it manually`
        
        /*
        for i in 0 ..< menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingAnchor = itemWidth * CGFloat(i)
            
            let itemView = self.createTabItem(item: menuItems[i])
            itemView.tag = i
            
            self.addSubview(itemView)
            
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.clipsToBounds = true
            
            tabWidthConstraints.append(itemView.widthAnchor.constraint(equalToConstant: CGFloat(itemWidth)))
            tabWidthConstraints[i].isActive = true
            
            NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: self.heightAnchor), // fixing width
                
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                itemView.topAnchor.constraint(equalTo: self.topAnchor),
            ])
        }*/
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.activateTab(tab: 0)
    }
    
    func createTabItem(item: TabItem) -> UIView {
        let tabBarItem = UIView(frame: CGRect.zero)
        let itemTitleLabel = UILabel(frame: CGRect.zero)
        let itemIconView = UIImageView(frame: CGRect.zero)
        let selectedItemView = UIView(frame: CGRect.zero)
        
        // adding tags to get views for modification when selected/unselected
        
        tabBarItem.tag = 11
        itemTitleLabel.tag = 12
        itemIconView.tag = 13
        selectedItemView.tag = 14
        selectedItemView.backgroundColor = UIColor(hexColor: "0095FF")
        selectedItemView.translatesAutoresizingMaskIntoConstraints = false
        selectedItemView.clipsToBounds = true
        tabBarItem.addSubview(selectedItemView)
        
        var width = 0
        
        switch item {
        case .home:
            width = 99
        case .quotations:
            width = 127
        case .delivery:
            width = 110
        case .profile:
            width = 101
        }
        
        NSLayoutConstraint.activate([
            selectedItemView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            selectedItemView.centerYAnchor.constraint(equalTo: tabBarItem.centerYAnchor, constant: -8),
            selectedItemView.heightAnchor.constraint(equalToConstant: 42),
            selectedItemView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 15),
            selectedItemView.trailingAnchor.constraint(equalTo: tabBarItem.trailingAnchor, constant: -15),
            
        ])
        
        selectedItemView.layer.cornerRadius = 8
        tabBarItem.sendSubviewToBack(selectedItemView)
        
        selectedItemView.isHidden = true
        
        
        itemTitleLabel.text = item.displayTitle
        itemTitleLabel.font = UIFont.init(name: "Helvetica-Regular", size: 10.0)
//        itemTitleLabel.adjustsFontSizeToFitWidth = true
        itemTitleLabel.textColor = .white // changing color to white
        itemTitleLabel.textAlignment = .left
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemTitleLabel.clipsToBounds = true
        itemTitleLabel.isHidden = true // hiding label for now
        
        
        
        switch item {
        case .home:
            itemIconView.image = item.selectedIcon.withRenderingMode(.automatic)
        case .quotations:
            itemIconView.image = item.selectedIcon.withRenderingMode(.automatic)
        case .delivery:
            itemIconView.image = item.selectedIcon.withRenderingMode(.automatic)
        case .profile:
            itemIconView.image = item.selectedIcon.withRenderingMode(.automatic)
        }
        
        itemIconView.image = item.unSelectedIcon!.withRenderingMode(.automatic)
        itemIconView.contentMode = .scaleAspectFit // added to stop stretching
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        itemIconView.clipsToBounds = true
        tabBarItem.layer.backgroundColor = UIColor.clear.cgColor
        tabBarItem.addSubview(itemIconView)
        tabBarItem.addSubview(itemTitleLabel)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.clipsToBounds = true
        NSLayoutConstraint.activate([
            itemIconView.heightAnchor.constraint(equalToConstant: 20), // Fixed height for our tab item(25pts) changed to 15
            itemIconView.widthAnchor.constraint(equalToConstant: 20), // Fixed width for our tab item icon changed to 15
            itemIconView.leadingAnchor.constraint(equalTo: selectedItemView.leadingAnchor, constant: 8),
//            itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            itemIconView.centerYAnchor.constraint(equalTo: tabBarItem.centerYAnchor, constant: -8), // adding to make icon exact center
            //itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 8), // Position menu item icon 8pts from the top of it's parent view; commenting old y position
            //itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 35), s: fixed height of its superview so don't need this, thus commenting
            
            itemTitleLabel.leadingAnchor.constraint(equalTo: itemIconView.trailingAnchor, constant: 4),
            itemTitleLabel.trailingAnchor.constraint(equalTo: selectedItemView.trailingAnchor, constant: 0),
            itemTitleLabel.centerYAnchor.constraint(equalTo: tabBarItem.centerYAnchor, constant: -8)
            //itemTitleLabel.topAnchor.constraint(equalTo: itemIconView.bottomAnchor, constant: 4), // Position title label 4pts below item icon, s: changinf postion of label so don't need this
            ])
        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap))) // Each item should be able to trigger and action on tap
        return tabBarItem
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
    }
    
    func switchTab(from: Int, to: Int) {
        if from != to {
            self.deactivateTab(tab: from)
            self.activateTab(tab: to)
        }
    }
    
    func activateTab(tab: Int) {
        
        let tabToActivate = self.subviews[tab]
        
        // showing title label on selection
        
        tabToActivate.viewWithTag(12)?.isHidden = false // showing label
        tabToActivate.viewWithTag(14)?.isHidden = false // showing selected tab background
        
        switch tab {
        case 0:
            (tabToActivate.viewWithTag(13) as? UIImageView)?.image = #imageLiteral(resourceName: "home_tab_selected_ic")
        case 1:
            (tabToActivate.viewWithTag(13) as? UIImageView)?.image = #imageLiteral(resourceName: "quotation_tab_selected_ic")
        case 2:
            (tabToActivate.viewWithTag(13) as? UIImageView)?.image = #imageLiteral(resourceName: "delivery_tab_selected_ic")
        case 3:
            (tabToActivate.viewWithTag(13) as? UIImageView)?.image = #imageLiteral(resourceName: "profile_tab_selected_ic")
        default:
            (tabToActivate.viewWithTag(13) as? UIImageView)?.image = #imageLiteral(resourceName: "home_tab_selected_ic")
        }
        
        
        // changing constraints for animation
        
        NSLayoutConstraint.deactivate(tabToActivate.constraints.filter({$0.firstItem === tabToActivate.viewWithTag(13) && $0.firstAttribute == .centerX}))
        
        NSLayoutConstraint.activate([tabToActivate.viewWithTag(13)!.centerXAnchor.constraint(equalTo: tabToActivate.centerXAnchor, constant: -20)])
        
        // transform effect for selectedtab background
        UIView.animate(withDuration: 0.25, animations: {
            tabToActivate.viewWithTag(14)?.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.layoutIfNeeded()
        }) { (Bool) in
            
            tabToActivate.viewWithTag(14)?.isHidden = false
        }
        
        self.itemTapped?(tab)
        
        self.activeItem = tab
    }
    
    func deactivateTab(tab: Int) {
        
        let inactiveTab = self.subviews[tab]
        
        // hiding label again when deselected
        inactiveTab.viewWithTag(12)?.isHidden = true
        
        //inactiveTab.viewWithTag(14)?.isHidden = true
        
        NSLayoutConstraint.deactivate(inactiveTab.constraints.filter({$0.firstItem === inactiveTab.viewWithTag(13) && $0.firstAttribute == .centerX}))
        
        NSLayoutConstraint.activate([inactiveTab.viewWithTag(13)!.centerXAnchor.constraint(equalTo: inactiveTab.centerXAnchor)])
        
        switch tab {
        case 0:
            (inactiveTab.viewWithTag(13) as? UIImageView)?.image = #imageLiteral(resourceName: "home_tab_unselected_ic")
            
        case 1:
            (inactiveTab.viewWithTag(13) as? UIImageView)?.image = #imageLiteral(resourceName: "quotation_tab_unselected_ic")
        case 2:
            (inactiveTab.viewWithTag(13) as? UIImageView)?.image = #imageLiteral(resourceName: "delivery_tab_unselected_ic")
        case 3:
            (inactiveTab.viewWithTag(13) as? UIImageView)?.image = #imageLiteral(resourceName: "profile_tab_unselected_ic")
        default:
            (inactiveTab.viewWithTag(13) as? UIImageView)?.image = #imageLiteral(resourceName: "home_tab_unselected_ic")
        }
        
        
        
            self.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.25, animations: {
            inactiveTab.viewWithTag(14)?.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.layoutIfNeeded()
        }) { (Bool) in
            inactiveTab.viewWithTag(14)?.isHidden = true
        }
    }
}
