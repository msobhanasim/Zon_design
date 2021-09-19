//
//  TabItem.swift
//  CustomTabNavigation
//
//  Created by Sprinthub on 09/10/2019.
//  Copyright © 2019 Sprinthub Mobile. All rights reserved.
//

// Changed by Agha Saad Rehman

import UIKit

enum TabItem: String, CaseIterable {
    case home = "Home"
    case quotations = "Quotations"
    case delivery = "Delivery"
    case profile = "Profile"
    
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: HomeVC.identifier) as! HomeVC
        case .quotations:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: QuotationsVC.identifier) as! QuotationsVC
        case .delivery:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: DeliveryVC.identifier) as! DeliveryVC
        case .profile:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ProfileVC.identifier) as! ProfileVC
        }
    }
    
    var selectedIcon: UIImage {
        switch self {
        case .home:
            return #imageLiteral(resourceName: "home_tab_selected_ic")
        case .quotations:
            return #imageLiteral(resourceName: "quotation_tab_selected_ic")
        case .delivery:
            return #imageLiteral(resourceName: "delivery_tab_selected_ic")
        case .profile:
            return #imageLiteral(resourceName: "profile_tab_selected_ic")
        }
    }
    
    var unSelectedIcon: UIImage? {
        switch self {
        case .home:
            return #imageLiteral(resourceName: "home_tab_unselected_ic")
        case .quotations:
            return #imageLiteral(resourceName: "quotation_tab_unselected_ic")
        case .delivery:
            return #imageLiteral(resourceName: "delivery_tab_unselected_ic")
        case .profile:
            return #imageLiteral(resourceName: "profile_tab_unselected_ic")
        }
    }
    
    var displayTitle: String {
        return self.rawValue
    }
}
