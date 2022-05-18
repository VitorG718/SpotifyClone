//
//  SearchViewController.swift
//  SpotifyClone
//
//  Created by Vitor Gledison Oliveira de Souza on 05/05/22.
//

import UIKit
import SnapKit
import Components

class SearchViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SearchCard.Cell.self, forCellWithReuseIdentifier: SearchCard.Cell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    private lazy var searchField: SearchField = {
        let search = SearchField()
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.0)
        
        collectionView.dataSource = self
        view.addSubview(collectionView)
        view.addSubview(searchField)
        
        addConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumLineSpacing = view.frame.width * 0.035
        layout?.itemSize = CGSize(width: view.frame.width * 0.45, height: view.frame.width * 0.225)
    }
    
    private func addConstraints() {
        searchField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(view.frame.width * 0.03)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.06)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(searchField)
            make.top.equalTo(searchField.snp_bottomMargin).inset(-(view.frame.height * 0.025))
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCard.Cell.identifier, for: indexPath) as! SearchCard.Cell
        cell.configure(with: data[indexPath.row])
        return cell
    }
}

let data = [
    SearchCard.ViewModel(title: "Pop", imageUrl: "playlist_image_1", color: .purple),
    SearchCard.ViewModel(title: "Rock", imageUrl: "playlist_image_1", color: .red),
    SearchCard.ViewModel(title: "Pop", imageUrl: "playlist_image_1", color: .purple),
    SearchCard.ViewModel(title: "Rock", imageUrl: "playlist_image_1", color: .blue),
    SearchCard.ViewModel(title: "Pop", imageUrl: "playlist_image_1", color: .purple),
    SearchCard.ViewModel(title: "Rock", imageUrl: "playlist_image_1", color: .red),
    SearchCard.ViewModel(title: "Pop", imageUrl: "playlist_image_1", color: .purple),
    SearchCard.ViewModel(title: "Rock", imageUrl: "playlist_image_1", color: .blue),
    SearchCard.ViewModel(title: "Pop", imageUrl: "playlist_image_1", color: .purple),
    SearchCard.ViewModel(title: "Rock", imageUrl: "playlist_image_1", color: .red),
    SearchCard.ViewModel(title: "Pop", imageUrl: "playlist_image_1", color: .purple),
    SearchCard.ViewModel(title: "Rock", imageUrl: "playlist_image_1", color: .blue),
    SearchCard.ViewModel(title: "Pop", imageUrl: "playlist_image_1", color: .purple),
    SearchCard.ViewModel(title: "Rock", imageUrl: "playlist_image_1", color: .red),
    SearchCard.ViewModel(title: "Pop", imageUrl: "playlist_image_1", color: .purple),
    SearchCard.ViewModel(title: "Rock", imageUrl: "playlist_image_1", color: .blue),
]
