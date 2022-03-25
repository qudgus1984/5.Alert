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
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert) // UIAlertController 생성
            
            let offAction = UIAlertAction(title: "네",
                style: UIAlertAction.Style.default, handler:  {
                ACTION in self.lampImg.image = self.imgOff
                self.isLampOn=false // UIAlertAction 생성.
            })
            let cancelAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default, handler: nil)
            // UIAlertAction를 추가로 생성 특별한 동작 하지 않을 경우 핸들러를 nil로 함
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction) // 생성된 offAction, cancelAction을 얼럿에 추가
            
            present(lampOffAlert, animated: true, completion: nil) // present 메서드를 실행
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert) // UIAlertController 생성
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn=false
        }) // UIAlertAction을 생성. 전구를 꺼야하므로 handler에 {,}을 넣어 추가적으로 작업
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertAction.Style.default) {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn=true
        } // UIAlertAction을 생성. 전구를 켜야하므로 handler에 {,}을 넣어 추가적으로 작업
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn=false
        }) // UIAlertAction을 추가로 생성한 후 전구를 제거하는 동작을 추가
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction) // 생성된 on,off,removeAction을 얼럿에 추가
        present(lampRemoveAlert, animated: true, completion: nil) // present 메서드를 실행
    }
}

