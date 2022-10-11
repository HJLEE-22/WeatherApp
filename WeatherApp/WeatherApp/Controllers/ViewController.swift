//
//  ViewController.swift
//  WeatherApp
//
//  Created by 이형주 on 2022/10/07.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - properties
    

    lazy var listButton: UIBarButtonItem = {
        let btn = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(listButtonTapped))
        return btn
    }()
    
    
    lazy var settingButton: UIBarButtonItem = {
        let btn = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingButtonTapped))
        return btn
    }()
    
    
    
    let firstVC = FirstViewController()
    
//    let firstVC: FirstViewController = {
//       let vc = FirstViewController()
//
//
//        return vc
//
//    }()
    

    
    let secondVC = SecondViewController()
    
    let todayWeatherView = TodayWeatherView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPageVC()
        setupPageControll()
        naviSetup()
    }

    
    
    
    // MARK: - Helpers
    

    
    func naviSetup() {
        
        navigationItem.title = "현재 위치"
        navigationController?.navigationBar.tintColor = .purple
        navigationItem.rightBarButtonItem = listButton
        navigationItem.leftBarButtonItem = settingButton
        
    }
    
    
    func initPageVC() {
        
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageVC.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(pageVC.view)
        addChild(pageVC)
        pageVC.dataSource = self
        pageVC.delegate = self
        
        let viewControllers = [FirstViewController()]
        pageVC.setViewControllers(viewControllers, direction: .reverse, animated: true)
        
        
        
    }
    
    
    func setupPageControll() {
        let pageControl = UIPageControl()

        
        
    }
    

    // MARK: - Actions
    
    @objc func listButtonTapped() {
        show(CitiesViewController(), sender: self)
        
    }
    
    @objc func settingButtonTapped() {
        show(SettingViewController(), sender: self)
        
    }
    
}





extension ViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController as? FirstViewController != nil {
            return nil
        }
        return FirstViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController as? SecondViewController != nil {
            return nil
        }
        return SecondViewController()
    }
}


extension ViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let currentVC = pageViewController.viewControllers?[0] as? FirstViewController {
                
            }
                
                
        }
    }
}
