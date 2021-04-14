//
//  NextViewController.swift
//  MYLNetwork_Example
//
//  Created by yulong mei on 2021/4/14.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import MYLNetwork
import Moya

class NextViewController: ViewController {

    lazy var lable: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    var cancellable: Cancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.view.addSubview(lable)
        
        cancellable = MProvider.request(protocol: MBaseClass<LoginModel>(), target: .login) { (result) in
            switch result {
            case let .success(response):
                debugPrint("response.code:",response.code, "response.message:", response.message)
                self.lable.text = response.message
            case let .failure(response):
                debugPrint(response.message)
            }
        }
    }
    
    deinit {
        cancellable?.cancel()
        debugPrint("deinit---NextViewController")
    }

}
