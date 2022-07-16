//
//  SearchDetailViewController.swift
//  Hypeclass
//
//  Created by Hong jeongmin on 2022/07/13.
//

import UIKit

class SearchDetailViewController: BaseViewController {
    
    //MARK: - Properties
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.tintColor = .white
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 12.0)
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.backgroundColor = .searchBarBackgroud
        searchBar.searchTextField.leftViewMode = .never
        searchBar.returnKeyType = .google
        
        return searchBar
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarUI()
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    
    func configureUI() {
        //레이아웃 구성
    }
    
    func setNavigationBarUI() {
        self.navigationItem.titleView = searchBar
    }
}

//MARK: - Preview

import SwiftUI

struct SearchDetailViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = SearchDetailViewController

    func makeUIViewController(context: Context) -> SearchDetailViewController {
        return SearchDetailViewController()
    }

    func updateUIViewController(_ uiViewController: SearchDetailViewController, context: Context) {}
}

@available(iOS 13.0.0, *)
struct SearchDetailViewControllerPreview: PreviewProvider {
    static var previews: some View {
        SearchDetailViewControllerRepresentable()
    }
}
