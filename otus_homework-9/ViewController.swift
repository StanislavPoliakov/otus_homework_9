//
//  ViewController.swift
//  otus_homework-9
//
//  Created by Поляков Станислав Денисович on 04.05.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var jobTitleLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    @IBOutlet private weak var showNameButton: UIButton!
    @IBOutlet private weak var copyToClipboardButton: UIButton!
    
    private var user = User(
        firstName: "Станислав",
        lastName: "Поляков",
        jobTitle: "Инженер",
        address: "115580, г. Москва, ул. Мусы Джалия, 9к5, кв. 416"
    )
    
    private var isFullNameShown: Bool = false {
        didSet {
            nameLabel.text = isFullNameShown ? user.fullName : user.firstName
        }
    }
    
    @IBAction private func didTapOnShowButton(_ sender: UIButton) {
        isFullNameShown.toggle()
        showNameButton.isSelected = isFullNameShown
    }
    
    @IBAction func didTabOnCopyToClipboardButton(_ sender: UIButton) {
        UIPasteboard.general.string = addressLabel.text
        
        let alert = UIAlertController(title: "", message: "Адрес: \(String(describing: UIPasteboard.general.string!)) скопирован!", preferredStyle: .alert)
        alert.addAction(.init(title: "Понятно", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        isFullNameShown = false
        jobTitleLabel.text = user.jobTitle
        addressLabel.text = user.address
        addressLabel.sizeToFit()
        
        imageView.image = UIImage(resource: .photo)
        imageView.contentMode = .scaleAspectFill
        
        showNameButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        showNameButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
    }
}

private enum LabelConstants {
    static let fullName = "Фамилия Имя Отчество"
    static let nameOnly = "Имя"
}

