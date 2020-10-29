//
//  MINRNDViewController.swift
//  MINRND
//
//  Created by madhav sharma on 10/29/20.
//

import UIKit

class MINRNDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.8705882353, blue: 0.4392156863, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "viewController")
                            else {
                                return
                        }
                        //to switch default annoying card-view to fullscreen-view
                        //using a segue programmatically
                        viewController.modalPresentationStyle = .fullScreen
                self.presentDetail(viewController)
            }
        }

}
