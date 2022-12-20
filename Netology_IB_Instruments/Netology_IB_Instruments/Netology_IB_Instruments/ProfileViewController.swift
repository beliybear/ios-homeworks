//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Beliy.Bear on 12.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var profile: ProfileView{

        let profile = Bundle.main.loadNibNamed(
            "ProfileView",
            owner: nil,
            options: nil
        )?.first as! ProfileView

        return profile
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(profile)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
