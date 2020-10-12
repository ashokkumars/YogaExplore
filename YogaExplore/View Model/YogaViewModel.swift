//
//  YogaViewModel.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 10/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit



class YogaViewModel: NSObject {

    func getImageRatingCell(for tableView: UITableView) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CustomCell.ImageRatingTableViewCell.rawValue) as? ImageRatingTableViewCell {
            
            cell.bannerImageView.layer.cornerRadius = 40
            cell.bannerImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            cell.bannerImageView.layer.masksToBounds = true
            
            cell.ratingView.layer.cornerRadius = cell.ratingView.frame.height / 2
            cell.ratingView.layer.masksToBounds = false
            cell.ratingView.dropShadow(color: UIColor.gray, opacity: 0.2, offSet: CGSize(width: 0, height: 0), radius: 10.0, scale: false)
            
            cell.ratingLabel.font = UIFont.regular(ofSize: 14.0)
            cell.ratingLabel.text = Constants.YogaScreen.rating
            
            cell.ratingCount.font = UIFont.regular(ofSize: 14.0)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    //MARK:- Address methods
    
    func getAddressCell(for tableView: UITableView) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CustomCell.AddressTableViewCell.rawValue) as? AddressTableViewCell {
            
            cell.addressLabel.attributedText = getAddress()
            cell.seeOnMapButton.setAttributedTitle(NSAttributedString(string: Constants.YogaScreen.seeOnMap, attributes: [NSAttributedString.Key.font : UIFont.regular(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.palova]), for: .normal)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    fileprivate func getAddress() -> NSAttributedString {
        
        let address = NSMutableAttributedString()
        
        let resort_name = NSAttributedString(string: Constants.YogaScreen.resort_name , attributes: [NSAttributedString.Key.font : UIFont.medium(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.charcoal])
        
        let pinImage = NSTextAttachment()
        pinImage.image = UIImage(named: Constants.ImageName.location)
        pinImage.bounds = CGRect(x: 0, y: -2, width: 15, height: 15)
        let imageString = NSAttributedString(attachment: pinImage)

        let resort_address = NSAttributedString(string: Constants.YogaScreen.resort_address, attributes: [NSAttributedString.Key.font : UIFont.regular(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.martini])
        
        address.append(resort_name)
        address.append(NSAttributedString(string: "\n"))
        address.append(imageString)
        address.append(resort_address)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 26
        address.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: resort_name.string.count, length: resort_address.string.count))
        
        return address
    }
    
    //MARK:- Opening hour methods
    
    func getOpeningHoursCell(for tableView: UITableView) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CustomCell.OpeningHoursTableViewCell.rawValue) as? OpeningHoursTableViewCell {
            cell.weekdayOpeningHours.openingHours.attributedText = getOpenHour(for: Constants.OpenHours.Weekdays)
            cell.weekendOpeningHours.openingHours.attributedText = getOpenHour(for: Constants.OpenHours.Weekend)
            return cell
        }
        
        return UITableViewCell()
    }
    
    fileprivate func getOpenHour(for duration: Constants.OpenHours) -> NSAttributedString {
        
        var timing = Constants.YogaScreen.weekdays_openHours
        
        if duration == Constants.OpenHours.Weekend {
            timing = Constants.YogaScreen.weekend_openHours
        }
        
        let openHours = NSMutableAttributedString()
        
        let day = NSAttributedString(string: duration.rawValue, attributes: [NSAttributedString.Key.font : UIFont.regular(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.charcoal])
        
        let time = NSAttributedString(string: timing, attributes: [NSAttributedString.Key.font : UIFont.regular(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.suva])
        
        openHours.append(day)
        openHours.append(NSAttributedString(string: "\n"))
        openHours.append(time)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 21
        openHours.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: day.string.count, length: time.string.count))
        
        return openHours
    }
    
    //MARK:- Description methods
    
    func getDescriptionCell(for tableView: UITableView) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CustomCell.DescriptionTableViewCell.rawValue) as? DescriptionTableViewCell {
            cell.descriptionLabel.attributedText = getDescriptionText()
            return cell
        }
        
        return UITableViewCell()
    }
    
    fileprivate func getDescriptionText() -> NSAttributedString {
        
        let _description = NSMutableAttributedString()
        
        let title = NSAttributedString(string: Constants.YogaScreen.description_title, attributes: [NSAttributedString.Key.font : UIFont.regular(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.charcoal])
        
        let message = NSAttributedString(string: Constants.YogaScreen.description_message, attributes: [NSAttributedString.Key.font : UIFont.regular(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.suva])
        
        _description.append(title)
        _description.append(NSAttributedString(string: "\n\n"))
        _description.append(message)
        
        return _description
    }
    
    //MARK:- Review cell methods
    
    func getReviewCell(for tableView: UITableView) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CustomCell.WriteReviewTableViewCell.rawValue) as? WriteReviewTableViewCell {
            return cell
        }
        
        return UITableViewCell()
    }
    
    //MARK:- Animation
    
    func openingAnimation(with cell: ImageRatingTableViewCell) {
        
        cell.bannerImageView.transform = CGAffineTransform(translationX: 0, y: -cell.bannerImageView.frame.height)
        cell.ratingView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0 ,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 0.25,
            options: [.curveEaseInOut],
            animations: {
                cell.bannerImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.ratingView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func closingAnimation(with tableView: UITableView) {
        
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ImageRatingTableViewCell {
            cell.ratingView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
            UIView.animate(
                withDuration: 0.5,
                delay: 0 ,
                usingSpringWithDamping: 1.0,
                initialSpringVelocity: 0.25,
                options: [.curveEaseInOut],
                animations: {
                    cell.bannerImageView.transform = CGAffineTransform(translationX: 0, y: -cell.bannerImageView.frame.height)
                    cell.ratingView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                    tableView.alpha = 0
            })
        }
    }
}
