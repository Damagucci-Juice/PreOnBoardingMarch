//
//  ImageViewController.swift
//  ConcurrentlyImageApp
//
//  Created by YEONGJIN JANG on 2023/02/23.
//

import UIKit

class ImageViewController: UIViewController {

    private let imageService = ImageService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var imageView5: UIImageView!
    
    
    @IBAction func tappedLoadImage1(_ sender: Any) {
        imageService.loadImage { result in
            switch result {
            case .success(let imageSource):
                Task {
                    self.imageView1.image = UIImage(data: imageSource)
                }
            case .failure(let error):
                return debugPrint(error)
            }
        }
    }
    
    @IBAction func tappedLoadImage2(_ sender: Any) {
        imageService.loadImage { result in
            switch result {
            case .success(let imageSource):
                Task {
                    self.imageView2.image = UIImage(data: imageSource)
                }
            case .failure(let error):
                return debugPrint(error)
            }
        }
    }
    
    @IBAction func tappedLoadImage3(_ sender: Any) {
        imageService.loadImage { result in
            switch result {
            case .success(let imageSource):
                Task {
                    self.imageView3.image = UIImage(data: imageSource)
                }
            case .failure(let error):
                return debugPrint(error)
            }
        }
    }
    
    @IBAction func tappedLoadImage4(_ sender: Any) {
        imageService.loadImage { result in
            switch result {
            case .success(let imageSource):
                Task {
                    self.imageView4.image = UIImage(data: imageSource)
                }
            case .failure(let error):
                return debugPrint(error)
            }
        }
    }
    
    @IBAction func tappedLoadImage5(_ sender: Any) {
        imageService.loadImage { result in
            switch result {
            case .success(let imageSource):
                Task {
                    self.imageView5.image = UIImage(data: imageSource)
                }
            case .failure(let error):
                return debugPrint(error)
            }
        }
    }
    
    @IBAction func tappedLoadAllImages(_ sender: Any) {
        tappedLoadImage1(sender)
        tappedLoadImage2(sender)
        tappedLoadImage3(sender)
        tappedLoadImage4(sender)
        tappedLoadImage5(sender)
    }
    
    @IBAction func tappedRemoveAllImages(_ sender: Any) {
        Task {
            self.imageView1.image = UIImage(systemName: "photo")
            self.imageView2.image = UIImage(systemName: "photo")
            self.imageView3.image = UIImage(systemName: "photo")
            self.imageView4.image = UIImage(systemName: "photo")
            self.imageView5.image = UIImage(systemName: "photo")
        }
    }
}


