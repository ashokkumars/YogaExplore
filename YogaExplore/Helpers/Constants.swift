//
//  Constants.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 10/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

class Constants: NSObject {

    static let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
    
    enum YogaScreen {
        static let rating = "Rating"
        static let resort_name = "Efficitur Resort Yoga centre"
        static let resort_address = "  755, Brickyard St., Lake Zurich, IL 60047"
        static let weekdays_openHours = "09.00 - 18.00"
        static let weekend_openHours = "08.30 - 17.30"
        static let description_title = "Description"
        static let description_message = "Integer ac interdum lacus. Nunc porta semper lacus a varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis"
        static let seeOnMap = "See on map"
    }
    
    enum OpenHours: String {
        case Weekdays = "Weekdays"
        case Weekend = "Weekend"
    }
    
    enum Generic {
        static let chat_screen_title = "Chat"
        static let articles_screen_title = "Articles"
        static let settings_screen_title = "Settings"
        static let message = "Page is not implemented yet"
    }
    
    enum ImageName {
        static let back_button = "back_button"
        static let location = "location"
    }
    
    enum CustomCell: String {
        case ImageRatingTableViewCell = "ImageRatingTableViewCell"
        case AddressTableViewCell = "AddressTableViewCell"
        case OpeningHoursTableViewCell = "OpeningHoursTableViewCell"
        case DescriptionTableViewCell = "DescriptionTableViewCell"
        case WriteReviewTableViewCell = "WriteReviewTableViewCell"
        case OpeningHoursView = "OpeningHoursView"
    }
    
    var shouldRepositionTabbar: Bool {
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: "defaultTabbarPosition")
        }
        get {
            return UserDefaults.standard.bool(forKey: "defaultTabbarPosition")
        }
    }
    
    var shouldMoveBackButtonWithImage: Bool {
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: "shouldMoveBackButtonWithImage")
        }
        get {
            return UserDefaults.standard.bool(forKey: "shouldMoveBackButtonWithImage")
        }
    }
}

