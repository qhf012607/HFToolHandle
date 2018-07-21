//
//  ViewController.swift
//  RxSwiftProject
//
//  Created by rhonin on 2018/7/19.
//  Copyright © 2018年 rhonin. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Person {
    var name = ""
    var rx_age : Variable<NSInteger> = Variable(0)
    
}

extension UITextField{
    var textChange:AnyObserver<String>{
        return Binder(self) { textfield, stringText in
                textfield.text = stringText
            }.asObserver()
    }
    class func createObaserceable() -> Observable<Any> {
        return Observable.create({ (observer) -> Disposable in
            observer.onNext("")
            return Disposables.create()
        })
    }
}



class ViewController: UIViewController {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
    let lab = UITextField(frame: CGRect(x: 0, y: 100, width: 100, height: 50))
    let tag = DisposeBag()
    let person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(lab)
        view.addSubview(button)
        button.backgroundColor = .red
        
//        weak var this = self
//        let observable = Observable<String>.create{observer in
//            //对订阅者发出了.next事件，且携带了一个数据"hangge.com"
//            observer.onNext("hangge.com")
//            //对订阅者发出了.completed事件
//            observer.onCompleted()
//            //因为一个订阅行为会有一个Disposable类型的返回值，所以在结尾一定要returen一个Disposable
//            return Disposables.create()
//        }
        
        
        person.rx_age.asObservable().map { (e) -> String in
            return "\(e)"
            }.bind(to: lab.textChange).disposed(by: tag)
        
        button.addTarget(self, action: #selector(play), for: .touchUpInside)
       
        self.lab.rx.text.orEmpty.map { (string) -> NSInteger in
            var stringNum = "0";
            if string.count > 0{
               stringNum = string
            }
            return NSInteger(stringNum)!
        }.bind(to: person.rx_age).disposed(by: tag)
    }
    @objc func play(){
        self.person.rx_age.value += 1
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

