//
//  SCExtension.swift
//  ownself
//
//  Created by maccli1 on 2017. 11. 29..
//  Copyright © 2017년 myoung. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

//새로운 폰트
let Bold   : String = "HelveticaNeue-Bold"
let Light  : String = "HelveticaNeue-Light"
let Medium : String = "HelveticaNeue-Medium"

class SCExtension: NSObject { }

var deviceType: String {
    switch screenHeight {
    case 812.0: return "x"
    case 736.0: return "5.5"
    case 667.0: return "4.7"
    case 568.0: return "4"
    case 480.0: return "3.5"
    default: return ""
    }
}


public func printa(_ message: Any, file: String = #file, function: String = #function, line: Int = #line ) {
    let arr = file.components(separatedBy: "/")
    print("Start from \(arr.last!):\(line):\(function) = \(message)")
}


extension NSDictionary {
    
    func string_check(_ key: String) -> String { //String 체크
        if let value: String = self.object(forKey: key) as? String {
            return value
        } else {
            return ""
        }
    }
    
    func int_check(_ key: String) -> Int { //Int 체크
        if let value: Int = self.object(forKey: key) as? Int {
            return value
        } else {
            return 0
        }
    }
    
    func bool_check(_ key: String) -> Bool { //Bool 체크
        if let value: Bool = self.object(forKey: key) as? Bool {
            return value
        } else {
            return false
        }
    }
    
    func dic_check(_ key: String) -> [String: Any] { //swift dic 체크
        if let value: [String: Any] = self.object(forKey: key) as? [String: Any] {
            return value
        } else {
            return [:]
        }
    }
    
    func double_check(_ key: String) -> Double { //Double 체크
        if let value: String = self.object(forKey: key) as? String {
            return Double(value)!
        } else {
            return 0.0
        }
    }
    func array_check(_ key: String) -> [Any] { //배열 체크
        if let value: [Any] = self.object(forKey: key) as? [Any] {
            return value
        } else {
            return []
        }
    }
}

extension Double {
    
    func dateFormatString() -> String {
        let date_create = Date(timeIntervalSince1970: self/1000.0)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dayTimePeriodFormatter.string(from: date_create)
        return dateString
    }
}

extension UITextField {
    
    func setLeftPaddingPoints(_ amount: CGFloat) { //왼쪽만 패딩
        let view_left = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = view_left
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount: CGFloat) { //오른쪽만 패딩
        let view_right = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = view_right
        self.rightViewMode = .always
    }
    
    
    func setBothSidePaddingPoints(_ amount: CGFloat) { //양쪽 다 패딩
        let view_left = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = view_left
        self.leftViewMode = .always
        
        let view_right = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = view_right
        self.rightViewMode = .always
    }
}

extension UnicodeScalar {
    
    var isEmoji: Bool { //이모티콘 제외
        switch value {
        case 0x3030, 0x00AE, 0x00A9,
             0x1D000 ... 0x1F77F,
             0xFE00 ... 0xFE0F,
             0x1F900 ... 0x1F9FF:
            return true
        case 0xFFFD:
            return false
        default:
            return false
        }
    }
}

extension String {
    
    var glyphCount: Int {
        let richText = NSAttributedString(string: self)
        let line = CTLineCreateWithAttributedString(richText)
        return CTLineGetGlyphCount(line)
    }
    
    var isSingleEmoji: Bool {
        return glyphCount == 1 && containsEmoji
    }
    
    var containsEmoji: Bool {
        return unicodeScalars.map { $0 }.first { $0.isEmoji } != nil
    }
    
    var localized: String { //다국어 지원 스트링
        return NSLocalizedString(self, comment: "")
    }
    
    func localizedWithComment(comment: String) -> String { //다국어 지원 스트링 힌트 포함
        return NSLocalizedString(self, comment:comment)
    }
    
    var phoneNumSetting: String {
        return self.replacingOccurrences(of: "(\\d{3})(\\d+)(\\d{4})", with: "$1-$2-$3", options: .regularExpression, range: nil)
    }
    
    var changeBoldFontOnlyNum: NSMutableAttributedString { //숫자만 볼드 처리 해주기
        let attr = NSMutableAttributedString(string: self)
        let digitSet = CharacterSet.decimalDigits
        for (index, ch) in self.unicodeScalars.enumerated() {
            if digitSet.contains(ch) {
                attr.addAttributes([.font: UIFont(name: Bold, size: 13)!], range: NSMakeRange(index, 1))
            } else {
                attr.addAttributes([.font: UIFont(name: Light, size: 13)!], range: NSMakeRange(index, 1))
            }
        }
        return attr
    }
    
    var reduceFromCount: String { //10개이상 …해주기
        var str_complete: String = ""
        var i_count: Int = 0
        for element in self {
            let temp = String(element)
            if temp.utf8.count == 1 { i_count += 1 }
            else { i_count += 2 }
            str_complete.append(element)
            if i_count > 10 {
                str_complete = String(str_complete.dropLast())
                str_complete.append("...")
                break
            }
        }
        return str_complete
    }
    
    var initialCharacter: String {
        var initialString = ""
        let arrKoreaInitials: [String] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        for element in self {
            for ch in element.unicodeScalars {
                if ch.value >= 44032 && ch.value <= 55203 { // korean
                    let unicode = ch.value-44032
                    let resultInitial = unicode / 21 / 28
                    initialString += arrKoreaInitials[Int(resultInitial)]
                } else {
                    initialString += String(element)
                }
            }
        }
        return initialString
    }
    
    var isValidEmail: Bool { // email check
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
}


extension Int {
    
    func decimal_number() -> String { // 세자리 콤마 찍어주기
        let value: NSNumber = self as NSNumber
        let numFormatter : NumberFormatter = NumberFormatter();
        numFormatter.numberStyle = .decimal
        return numFormatter.string(from: value)!
    }
}

extension CALayer {
    
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, thickness: CGFloat) {
        
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: thickness)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: thickness, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
    
    func border_width_color(_ width: CGFloat, color: UIColor) {
        self.borderWidth = width
        self.borderColor = color.cgColor
    }
}

extension UIView
{
    func copyView() -> AnyObject {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self))! as AnyObject
    }
    
    func betweenYView() -> CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    func betweenXView() -> CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    func addDashedLine(strokeColor: UIColor, lineWidth: CGFloat) { //점선 만들기
        backgroundColor = .clear
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "DashedTopLine"
        shapeLayer.bounds = bounds
        shapeLayer.position = CGPoint(x: frame.width / 2, y: 0)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = [1, 2]
        
        let path = CGMutablePath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        shapeLayer.path = path
        
        layer.addSublayer(shapeLayer)
        
    }
}


extension UIColor
{
    class func color_one(_ f_value: CGFloat) -> UIColor {
        return UIColor(red: f_value/255.0, green: f_value/255.0, blue: f_value/255.0, alpha: 1.0)
    }
}


extension UIImage {
    
    func imageWithColor(_ tintColor: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        tintColor.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIApplication {
    
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? { //어디뷰에서든 실행가능한 뷰를 찾아서 리턴해줌
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}

extension DispatchQueue {
    
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
    
}

extension NSMutableAttributedString {
    
    func func_labelHeight(_ width: CGFloat) -> CGFloat {
        let lb: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 9999))
        lb.attributedText = self
        lb.sizeToFit()
        return lb.frame.size.height
    }
    
}


extension Data {
    
    var dataSize: String {
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useMB] // optional: restricts the units to MB only
        bcf.countStyle = .file
        return bcf.string(fromByteCount: Int64(self.count))
    }
    
}

extension UIViewController {
    
    func rootDismiss(_ rootViewcontroller: UIViewController) { //루트뷰로 돌아가기
        var vc_present = self.presentingViewController
        while true {
            if (vc_present?.isKind(of: rootViewcontroller.classForCoder))! {
                vc_present?.dismiss(animated: true, completion: nil)
                break
            } else {
                vc_present = vc_present?.presentingViewController
            }
        }
    }
}
