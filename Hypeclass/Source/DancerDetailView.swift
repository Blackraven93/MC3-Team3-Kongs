//
//  DancerDetailView.swift
//  Hypeclass
//
//  Created by 이성노 on 2022/07/17.
//

class DancerDetailViewController: BaseViewController {
    
    //MARK: - Properties
    
    let dancerDetailScrollView: UIScrollView! = UIScrollView()
    let dancerDetailContentView: UIView! = UIView()

    private lazy var dancerCoverImage: UIImageView = {
        let imageView = UIImageView()
        let dancerCoverImage: UIImage = UIImage(named: "DancerCoverImage")!
        imageView.image = dancerCoverImage
        return imageView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        let dancerProfileImage: UIImage = UIImage(named: "DancerProfileImage")!
        imageView.image = dancerProfileImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이병헌"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.text = "방송댄스"
        label.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        label.textColor = #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1)
        return label
    }()
    
    private lazy var instagramImageView: UIImageView = {
        let imageView = UIImageView()
        let dancerProfileImage: UIImage = UIImage(named: "DancerInstagramImage")!
        imageView.image = dancerProfileImage
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTapped)))
        return imageView
    }()
    
    private lazy var dancerInfoStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [nameLabel, genreLabel, instagramImageView])
        stview.spacing = 1
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .leading
        return stview
    }()

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    //MARK: - Selectors
    
    //MARK: - Helpers
    
    func configureUI() {
        dancerDetailScrollView.translatesAutoresizingMaskIntoConstraints = false
        dancerDetailContentView.translatesAutoresizingMaskIntoConstraints = false
        dancerCoverImage.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        instagramImageView.translatesAutoresizingMaskIntoConstraints = false
        dancerInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dancerDetailScrollView)
        dancerDetailScrollView.addSubview(dancerDetailContentView)
        dancerDetailContentView.addSubview(dancerCoverImage)
        dancerDetailContentView.addSubview(profileImageView)
        dancerDetailContentView.addSubview(dancerInfoStackView)

        dancerDetailContentView.widthAnchor.constraint(equalTo: dancerDetailScrollView.widthAnchor).isActive = true

        let contentViewHeight = dancerDetailContentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        // 수직 스크롤을 적용하기 위해 contentView 와 scrollView의 width를 동일하게 잡아주고 height를 동일하게 잡아주되 priority 값을 조정하여 scroll 될 수 있도록 설정했습니다.

        NSLayoutConstraint.activate([
            dancerDetailScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dancerDetailScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dancerDetailScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            dancerDetailScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            dancerDetailContentView.leadingAnchor.constraint(equalTo: dancerDetailScrollView.contentLayoutGuide.leadingAnchor),
            dancerDetailContentView.trailingAnchor.constraint(equalTo: dancerDetailScrollView.contentLayoutGuide.trailingAnchor),
            dancerDetailContentView.topAnchor.constraint(equalTo: dancerDetailScrollView.contentLayoutGuide.topAnchor),
            dancerDetailContentView.bottomAnchor.constraint(equalTo: dancerDetailScrollView.contentLayoutGuide.bottomAnchor),
            
            dancerCoverImage.leadingAnchor.constraint(equalTo: dancerDetailContentView.leadingAnchor, constant: 0),
            dancerCoverImage.trailingAnchor.constraint(equalTo: dancerDetailContentView.trailingAnchor, constant: 0),
            dancerCoverImage.heightAnchor.constraint(equalToConstant: 220),
            dancerCoverImage.topAnchor.constraint(equalTo: dancerDetailContentView.topAnchor, constant: 0),
            
            profileImageView.leadingAnchor.constraint(equalTo: dancerDetailContentView.leadingAnchor, constant: 25),
            profileImageView.topAnchor.constraint(equalTo: dancerCoverImage.bottomAnchor, constant: 35),
            profileImageView.heightAnchor.constraint(equalToConstant: 90),
            profileImageView.widthAnchor.constraint(equalToConstant: 90),

            dancerInfoStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            dancerInfoStackView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor)
        ])
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        if let url = URL(string: "https://www.instagram.com/byunghun0712/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
}

//MARK: - Preview

import SwiftUI

struct DancerDetailViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = DancerDetailViewController

    func makeUIViewController(context: Context) -> DancerDetailViewController {
        return DancerDetailViewController()
    }

    func updateUIViewController(_ uiViewController: DancerDetailViewController, context: Context) {}
}

@available(iOS 13.0.0, *)
struct DancerDetailViewControllerPreview: PreviewProvider {
    static var previews: some View {
        DancerDetailViewControllerRepresentable()
    }
}
