//
//  ResourceText.swift
//  WebView
//
//  Created by Kim Nghĩa on 06/03/2023.
//

import Foundation

enum ResourceText: String {
    
    // MARK: -Common
    
    case commonOk = "Common.Ok"
    case commonCancel = "Common.Cancel"
    case commonNext = "Common.Next"
    case commonClose = "Common.Close"
    case commonInfo = "Common.Information"
    case commonConfirm = "Common.Confirmation"
    case commonWarning = "Common.Warning"
    case commonBack = "Common.Back"
    case commonYes = "Common.Yes"
    case commonNo = "Common.No"
    case commonLoading = "Common.Loading"
    case commonLogin = "Common.Login"
    case commonPassword = "Common.Password"
    case commonName = "Common.Name"
    case commonEmail = "Common.Email"
    case commonAdd = "Common.Add"
    case commonAlert = "Common.Alert"
    case commonAlertError = "Common.Alert.Error"

    // MARK: -Home
    case homeTitle = "Home.Title"
    case homeAlertLoginSuccess = "Home.Alert.LoginSuccess"
    case homeAlertChangeLanguage = "Home.Alert.ChangeLanguage"
    case homeAlertUrlOrNetworkError = "Home.Alert.UrlOrNetworkError"

    //MARK: -Setting
    case settingTitle = "Setting.Title"
    case settingNotice = "Setting.Notice"
    case settingLanguage = "Setting.Language"
    case settingLanguageVietNam = "Setting.Language.VietNam"
    case settingLanguageEnglish = "Setting.Language.English"
    case settingResetpass = "Setting.ResetPassword"
    case settingAlertLogoutSuccess = "Setting.Alert.LogoutSuccess"
    case settingAlertResetPassSuccess = "Setting.Alert.ResetPassSuccess"

    //MARK: -Network
    case networkResSuccess = "Network.Response.Success"

    //MARK: -Add
    case addTitle = "Add.Title"
    case addDomain = "Add.Domain"
    case addHTTP = "Add.HTTP"
    case addHTTPS = "Add.HTTPS"
    case addRTSP = "Add.RTSP"
    case addAutoload = "Add.Autoload"
    case addAutoloadPage = "Add.AutoloadPage"
    case addAutoloadPageTouch = "Add.AutoloadPage.Touch"
    case addAutoloadPageScadaVis = "Add.AutoloadPage.ScadaVis"
    case addAutoloadPageSchedulers = "Add.AutoloadPage.Schedulers"
    case addAutoloadPageMosaic = "Add.AutoloadPage.Mosaic"
    case addAutoloadPageAssistant = "Add.AutoloadPage.Assistant"
    case addAutoloadPagePremium = "Add.AutoloadPage.Premium"
    case addParam = "Add.Param"
    case addIcon = "Add.Icon"
    case addAlertFillInfo = "Add.Alert.FillInfo"

    case updateURL = "UpdateURL"
    
    func localizedString() -> String {
        let lang = WebViewUserDefault.getDropdownLanguage()
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self.rawValue, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}


//
extension String {
    
    var localized: String {

      var preferred = "-"
      if let pl = NSLocale.preferredLanguages.first, let pref = pl.split(separator: "-").first { preferred = String(pref) } //<- selected device language or "-"
      guard let _ = Bundle.main.path(forResource: preferred, ofType: "lproj") else {
          //PREFERRED ISN'T LISTED. FALLING BACK TO EN
          guard let en_path = Bundle.main.path(forResource: "ja", ofType: "lproj"), let languageBundle = Bundle(path: en_path) else {
              //EN ISN'T LISTED. RETURNING UNINTERNATIONALIZED STRING
              return self
          }
          //EN EXISTS
          return languageBundle.localizedString(forKey: self, value: self, table: nil)
      }
      //PREFERRED IS LISTED. STRAIGHT I18N IS OKAY
      return NSLocalizedString(self, comment: "")
    }
    
    func getDomain() -> Double {
        switch self {
        case "http".localized:
            return 1
        case "https".localized:
            return 2
        case "rtsp".localized:
            return 3
        default:
            return 0
        }
    }
    
    func getLanguage() -> Double {
        switch self {
        case "Tiếng Việt".localized:
            return 1
        case "English".localized:
            return 2
        default:
            return 0
        }
    }
    
    func getHome() -> Double {
        switch self {
        case "Touch".localized:
            return 1
        case "Scada-Vis".localized:
            return 2
        case "Schedulers".localized:
            return 3
        case "Mosaic".localized:
            return 4
        case "Assistant".localized:
            return 5
        case "Premium".localized:
            return 6
        default:
            return 0
        }
    }

    
}

