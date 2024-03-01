//
//  TabBarViewController.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/1/24.
//


import UIKit

// 생각보다 높게 나오는 느낌
final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarConfig()
        
        view.backgroundColor = .white
    }
    
    private func tabBarConfig() {
        tabBar.barTintColor = .pointGray
        tabBar.tintColor = .pointPurple
        tabBar.isTranslucent = false
        
        let trendingViewController = UINavigationController(
            rootViewController: TrendingViewController()
        )
        
        let searchViewController = UINavigationController(
            rootViewController: SearchViewController()
        )
        
        let myFavoriteViewController = UINavigationController(
            rootViewController: MyFavoriteViewController()
        )
        
        let myPageViewController = UINavigationController(
            rootViewController: MyPageViewController()
        )
        
        trendingViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "chart.line.uptrend.xyaxis")?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(.lightGray),
            selectedImage: UIImage(systemName: "chart.line.uptrend.xyaxis")
        )
        
        
        searchViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "magnifyingglass")?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(.lightGray),
            selectedImage: UIImage(systemName: "magnifyingglass")
        )
        
        myFavoriteViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "folder")?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(.lightGray),
            selectedImage: UIImage(systemName: "folder")
        )
        
        myPageViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person")?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(.lightGray),
            selectedImage: UIImage(systemName: "person")
        )
        
        
        let tabItems = [
            trendingViewController,
            searchViewController,
            myFavoriteViewController,
            myPageViewController
        ]
        
        setViewControllers(tabItems, animated: true)
    }

}
