//
//  ViewController.swift
//  AwasonBrowser
//
//  Created by Kaznacheev on 21.10.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var urlTF: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var backButtom: UIButton!
    @IBOutlet weak var forwardButtom: UIButton!
    
    let myURL = "https://apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTF.delegate = self
        
        urlTF.text = myURL
        let url = URL(string: myURL)
        let myBrowser = URLRequest(url: url!)
        webView.load(myBrowser)
        
    }

    @IBAction func backButtom(_ sender: Any) {
    }
    
    @IBAction func forwardButtom(_ sender: Any) {
    }
}

extension ViewController: UITextFieldDelegate, WKNavigationDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = textField.text!
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        webView.load(request)
        
        return true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        urlTF.text = webView.url?.absoluteString
    }
    
}

