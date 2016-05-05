//
//  TGConstants.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/4/19.
//  Copyright © 2016年 TUTK. All rights reserved.
//

enum TGLeftMenuIndex: Int {
    case Index_IPHubs = 0, Index_IPCamera, Index_Account, Index_Help, Index_About
}

let kTGCommonUXBundleIdentifierKey = "com.tutk.common"

// MARK:- NSNotification

let kTGLeftMenuDidSelectedIPHubs    = "com.tutk.smarthome.leftMenuDidSelectedIPHubs"
let kTGLeftMenuDidSelectedCamera    = "com.tutk.smarthome.leftMenuDidSelectedCamera"
let kTGLeftMenuDidSelectedAccount   = "com.tutk.smarthome.leftMenuDidSelectedAccount"
let kTGLeftMenuDidSelectedHelp      = "com.tutk.smarthome.leftMenuDidSelectedHelp"
let kTGLeftMenuDidSelectedAbout     = "com.tutk.smarthome.leftMenuDidSelectedAbout"

let kTGPopMenuDidSelectedAll                    = "com.tutk.smarthome.popMenuDidSelectedAll"
let kTGPopMenuDidSelectedFilterByDeviceType     = "com.tutk.smarthome.popMenuDidSelectedFilterByDeviceType"
let kTGPopMenuDidSelectedLightingAndControls    = "com.tutk.smarthome.popMenuDidSelectedLightingAndControls"
let kTGPopMenuDidSelectedDoorsAndWindows        = "com.tutk.smarthome.popMenuDidSelectedDoorsAndWindows"
let kTGPopMenuDidSelectedDamagePrevention       = "com.tutk.smarthome.popMenuDidSelectedDamagePrevention"


// MARK: - Pop Menu
let kTGPopMenuWidth                 =   220.0 as CGFloat
let kTGPopMenuHeight                =   88.0 as CGFloat


// MARK:- User Class
// Field keys
let kPAPUserDisplayNameKey                          = "displayName"
let kPAPUserFacebookIDKey                           = "facebookId"
let kPAPUserPhotoIDKey                              = "photoId"
let kPAPUserProfilePicSmallKey                      = "profilePictureSmall"
let kPAPUserProfilePicMediumKey                     = "profilePictureMedium"
let kPAPUserFacebookFriendsKey                      = "facebookFriends"
let kPAPUserAlreadyAutoFollowedFacebookFriendsKey   = "userAlreadyAutoFollowedFacebookFriends"
let kPAPUserEmailKey                                = "email"
let kPAPUserAutoFollowKey                           = "autoFollow"

// MARK:- Photo Class

// Class key
let kPAPPhotoClassKey = "Photo"

// Field keys
let kPAPPhotoPictureKey         = "image"
let kPAPPhotoThumbnailKey       = "thumbnail"
let kPAPPhotoUserKey            = "user"
let kPAPPhotoOpenGraphIDKey     = "fbOpenGraphID"

// MARK:- Push Notification Payload Keys

let kAPNSAlertKey = "alert"
let kAPNSBadgeKey = "badge"
let kAPNSSoundKey = "sound"


// the following keys are intentionally kept short, APNS has a maximum payload limit

let kPAPPushPayloadPayloadTypeKey          = "p"
let kPAPPushPayloadPayloadTypeActivityKey  = "a"

let kPAPPushPayloadActivityTypeKey      = "t"
let kPAPPushPayloadActivityLikeKey      = "l"
let kPAPPushPayloadActivityCommentKey   = "c"
let kPAPPushPayloadActivityFollowKey    = "f"

let kPAPPushPayloadFromUserObjectIdKey  = "fu"
let kPAPPushPayloadToUserObjectIdKey    = "tu"
let kPAPPushPayloadPhotoObjectIdKey     = "pid"
