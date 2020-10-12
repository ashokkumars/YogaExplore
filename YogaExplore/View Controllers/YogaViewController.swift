//
//  YogaViewController.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 06/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

class YogaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var openForPositionAdjustment = false
    var viewModel: YogaViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        setupBackbutton()
                
        viewModel = YogaViewModel()
        
        setupTableView()
        
        registerTableViewCells()
        
        startAnimation()        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        openForPositionAdjustment = true
    }
    
    fileprivate func startAnimation() {
        
        tableView.alpha = 0.0
        tabBarController?.tabBar.alpha = 0.0
        navigationController?.navigationBar.alpha = 0.0
        
        UIView.animate(withDuration: 0.5) {
            self.tableView.alpha = 1.0
            self.tabBarController?.tabBar.alpha = 1.0
            self.navigationController?.navigationBar.alpha = 1.0
        }
    }
    
    fileprivate func setupNavigationBar() {
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        if let navigationBar = navigationController?.navigationBar {
            let gradient = CAGradientLayer()
            var bounds = navigationBar.bounds
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            gradient.colors = [UIColor.lightGray.cgColor, UIColor.clear.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 1)
            
            if let image = getImageFrom(gradientLayer: gradient) {
                navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            }
        }
    }
    
    fileprivate func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
    fileprivate func setupBackbutton() {
        
        self.navigationItem.setHidesBackButton(true, animated:false)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: Constants.ImageName.back_button)
        view.addSubview(imageView)
        
        let backTap = UITapGestureRecognizer(target: self, action: #selector(didTapBackButton))
        view.addGestureRecognizer(backTap)
        
        let leftBarButtonItem = UIBarButtonItem(customView: view)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        var inset = UIApplication.shared.statusBarFrame.height
        
        if let safeAreaInset = UIApplication.shared.keyWindow?.safeAreaInsets.top {
            inset = safeAreaInset
        }
        
        tableView.contentInset = UIEdgeInsets(top: -((navigationController?.navigationBar.frame.height ?? 0) + inset), left: 0, bottom: 40, right: 0)
    }
    
    fileprivate func registerTableViewCells() {
        let imageRatingCell = UINib(nibName: Constants.CustomCell.ImageRatingTableViewCell.rawValue, bundle: nil)
        self.tableView.register(imageRatingCell, forCellReuseIdentifier: Constants.CustomCell.ImageRatingTableViewCell.rawValue)
        
        let addressCell = UINib(nibName: Constants.CustomCell.AddressTableViewCell.rawValue, bundle: nil)
        self.tableView.register(addressCell, forCellReuseIdentifier: Constants.CustomCell.AddressTableViewCell.rawValue)
        
        let openingHoursCell = UINib(nibName: Constants.CustomCell.OpeningHoursTableViewCell.rawValue, bundle: nil)
        self.tableView.register(openingHoursCell, forCellReuseIdentifier: Constants.CustomCell.OpeningHoursTableViewCell.rawValue)
        
        let descriptionCell = UINib(nibName: Constants.CustomCell.DescriptionTableViewCell.rawValue, bundle: nil)
        self.tableView.register(descriptionCell, forCellReuseIdentifier: Constants.CustomCell.DescriptionTableViewCell.rawValue)
        
        let reviewCell = UINib(nibName: Constants.CustomCell.WriteReviewTableViewCell.rawValue, bundle: nil)
        self.tableView.register(reviewCell, forCellReuseIdentifier: Constants.CustomCell.WriteReviewTableViewCell.rawValue)
    }
    
    @objc func didTapBackButton() {
        
        perform(#selector(pop), with: nil, afterDelay: 0.1)
        viewModel?.closingAnimation(with: tableView)
    }
    
    @objc func pop() {
        self.parent?.parent?.navigationController?.popViewController(animated: false)
    }
}

extension YogaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return UIScreen.main.bounds.height / 2
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if let cell = cell as? ImageRatingTableViewCell {
                viewModel?.openingAnimation(with: cell)
            }
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch indexPath.row {
        case 0:
            cell = viewModel?.getImageRatingCell(for: tableView)
        case 1:
            cell = viewModel?.getAddressCell(for: tableView)
        case 2:
            cell = viewModel?.getOpeningHoursCell(for: tableView)
        case 3:
            cell = viewModel?.getDescriptionCell(for: tableView)
        case 4:
            cell = viewModel?.getReviewCell(for: tableView)
        default:
            break
        }
        
        return cell ?? UITableViewCell()
    }
}

extension YogaViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if openForPositionAdjustment, let tabbarController = tabBarController {
            
            openForPositionAdjustment = false
            
            Animator().animateTabbar(tabbarController: tabbarController, view: self.view)
        }
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
        if Constants().shouldMoveBackButtonWithImage {
            if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
                navigationController?.setNavigationBarHidden(true, animated: true)
                
            } else {
                navigationController?.setNavigationBarHidden(false, animated: true)
            }
        }
    }
}
