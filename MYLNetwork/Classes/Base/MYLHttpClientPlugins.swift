//
//  MYLHttpClientPlugins.swift
//  MYLNetwork
//
//  Created by yulong mei on 2021/4/14.
//

import Foundation
import Moya
import MBProgressHUD

public struct MYLHttpClientPlugins {
    
    public static let logger = NetworkLoggerPlugin.init(verbose: true, cURL: false, output: nil) { (data) -> (String) in
        return JSONResponseDataFormatter(data)
    } responseDataFormatter: { (data) -> (Data) in
        return data
    }


    public static let activity = NetworkActivityPlugin.init { (change, type) in
        switch change{
        case .began:
            DispatchQueue.main.async {
                if let view = UIApplication.shared.keyWindow {
                    MBProgressHUD.showAdded(to: view, animated: true)
                }
            }
        case .ended:
            DispatchQueue.main.async {
                if let view = UIApplication.shared.keyWindow {
                    MBProgressHUD.hide(for: view, animated: true)
                }
            }
        }
    }
    
}
