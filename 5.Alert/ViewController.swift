//
//  ViewController.swift
//  5.Alert
//
//  Created by 이병현 on 2022/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(named: "lamp-on.png") // 켜진 전구 이미지를 가지고 있는 UIImage 타입의 상수
    let imgOff = UIImage(named: "lamp-off.png") // 꺼진 전구 이미지를 가지고 있는 UIImage 타입의 상수
    let imgRemove = UIImage(named: "lamp-remove.png") // 제거된 전구 이미지를 가지고 있는 UIImage 타입의 상수
    
    var isLampOn = true // 전구가 켜졌는지의 여부를 나타내는 변수. 켜진 상태는 true, 꺼진 상태는 false
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true) {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert) // UIAertController를 생성
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            // UIAlertAction을 생성합니다. (특별한 동작을 하지 않을 경우에는 handler를 nil로 합니다.)
            lampOnAlert.addAction(onAction) // 생성된 onAction을 얼럿에 추가합니다.
            present(lampOnAlert, animated: true, completion: nil) // present 메서드를 실행합니다.
        } else {
            lampImg.image = imgOn
            isLampOn=true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
    }
}

