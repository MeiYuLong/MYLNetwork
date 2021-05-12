//
//  ViewController.swift
//  MYLNetwork
//
//  Created by longjiao914@126.com on 04/13/2021.
//  Copyright (c) 2021 longjiao914@126.com. All rights reserved.
//

import UIKit
import MYLNetwork
import HandyJSON

class LoginModel: MBaseModel{
    public var code: Int?

    public var message: String?
    
    override func willStartMapping() {
        
    }
    
    override func mapping(mapper: HelpingMapper) {
        
    }
    override func didFinishMapping() {
        
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        MStubProvider.request(protocol: MBaseClass<LoginModel>(), target: .login) { (result) in
            switch result {
            case let .success(response):
                debugPrint("response.code:",response.code, "response.message:", response.message)
            case let .failure(response):
                debugPrint(response.message)
            }
        }
    }

    @IBAction func goNextAction(_ sender: Any) {
        let next = NextViewController()
        self.show(next, sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

