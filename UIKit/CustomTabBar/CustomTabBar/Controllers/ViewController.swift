//
//  ViewController.swift
//  CustomTabBar
//
//  Created by 장재훈 on 2022/11/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setBlurEffect(on: imageView)
        getRandomImage()
    }

    @IBAction func refreshButtonTapped(_ sender: Any) {
        getRandomImage()
    }

    private func getRandomImage() {
        DispatchQueue.global().async {
            guard let url = URL(string: "https://random.imagecdn.app/500/500"),
                  let data = try? Data(contentsOf: url) else {
                return
            }

            DispatchQueue.main.async { [weak self] in
                let image = UIImage(data: data)

                self?.imageView.image = UIImage(data: data)

                UIView.animate(withDuration: 1, delay: 0) {
                    self?.view.backgroundColor = image?.averageColor
                }
            }
        }
    }

    private func setBlurEffect(on view: UIView) {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
}

#if DEBUG
    import SwiftUI
    struct ViewControllerRepresentable: UIViewControllerRepresentable {
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            // leave this empty
        }

        @available(iOS 13.0.0, *)
        func makeUIViewController(context: Context) -> some UIViewController {
            ViewController()
        }

        @available(iOS 13.0, *)
        struct SnapKitVCRepresentable_PreviewProvider: PreviewProvider {
            static var previews: some View {
                Group {
                    ViewControllerRepresentable()
                        .ignoresSafeArea()
                        .previewDisplayName("Preview")
                        .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
                }
            }
        }
    } #endif
