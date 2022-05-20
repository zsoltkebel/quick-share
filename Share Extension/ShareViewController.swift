//
//  ShareViewController.swift
//  Share Extension
//
//  Created by Zsolt Kébel on 20/05/2022.
//

import UIKit

class ShareViewController: UIViewController {
    
    @IBOutlet weak var QRCodeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray6

        if let item = extensionContext?.inputItems.first as? NSExtensionItem,
           let itemProvider = item.attachments?.first as? NSItemProvider,
            itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil) { (url, error) in
                    if let shareURL = url as? URL {
                        // do what you want to do with shareURL
                        let address = "https://api.qrserver.com/v1/create-qr-code/?data="
                        let codeURL = address + shareURL.absoluteString
                        if let imageURL = URL(string: codeURL) {
                            self.QRCodeImageView.load(url: imageURL)
                        }
                    }

                }
            }
    }
    
    @IBAction func onDonePressed(_ sender: UIBarButtonItem) {
        extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }

    // code to dismiss with error below
//        let error = NSError(domain: "some.bundle.identifier", code: 0, userInfo: [NSLocalizedDescriptionKey: "An error description"])
//        extensionContext?.cancelRequest(withError: error)


}
