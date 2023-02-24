//
//  ImageViewController.swift
//  ConcurrentlyImageApp
//
//  Created by YEONGJIN JANG on 2023/02/23.
//

import UIKit

class ImageViewController: UIViewController {

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
        loadImage { image in
            Task {
                self.imageView1.image = image
            }
        }
    }
    
    @IBAction func tappedLoadImage2(_ sender: Any) {
        loadImage { image in
            Task {
                self.imageView2.image = image
            }
        }
    }
    
    @IBAction func tappedLoadImage3(_ sender: Any) {
        loadImage { image in
            Task {
                self.imageView3.image = image
            }
        }
    }
    
    @IBAction func tappedLoadImage4(_ sender: Any) {
        loadImage { image in
            Task {
                self.imageView4.image = image
            }
        }
    }
    
    @IBAction func tappedLoadImage5(_ sender: Any) {
        loadImage { image in
            Task {
                self.imageView5.image = image
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
    
    private func loadImage(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: "https://picsum.photos/200")
        else { return }
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  let data = data
            else { return }
            if 200..<300 ~= statusCode {
                return completion(UIImage(data: data))
            }
            return completion(nil)
        }
        
        task.resume()
    }
}

