//
//  DetailWebController.swift
//  5-Days
//
//  Created by Elif Sıla Okutucu on 12.01.2021.
//

import UIKit
import WebKit

class DetailWebController: UIViewController, UIWebViewDelegate, WKNavigationDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.navigationDelegate = self
        
        /*
        let url = "https://www.turkcell.com.tr/"
        let rUrl = URL(string: url) //değişken -> url
        let req = URLRequest(url: rUrl!) //url -> request
        webView.load(req)
        */
        
        //string hdml for webView
        let hdmlString = "<!doctype html> <html lang='en'> <head> <meta charset='utf-8'> <meta name='viewport' content='width=device-width, initial-scale=1'> <title>jQuery UI Accordion - Default functionality</title> <link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css'> <script src='https://code.jquery.com/jquery-1.12.4.js'></script> <script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script> <script> $( function() { $( '#accordion' ).accordion(); } ); </script> </head> <body> <div id='accordion'> <h3>Section 1</h3> <div> <p> Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate. </p> </div> <h3>Section 2</h3> <div> <p> Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna. </p> </div> <h3>Section 3</h3> <div> <p> Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui. </p> <ul> <li>List item one</li> <li>List item two</li> <li>List item three</li> </ul> </div> <h3>Section 4</h3> <div> <p> Cras dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia mauris vel est. </p> <p> Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. </p> </div> </div> </body> </html>"
        
        webView.loadHTMLString(hdmlString, baseURL: nil)
        
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Webview didCommit")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Webview didFinish")
    }
    
    
    /*
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("Webview webViewDidStartLoad")
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Webview webViewDidfinishLoad")
    }
    */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
