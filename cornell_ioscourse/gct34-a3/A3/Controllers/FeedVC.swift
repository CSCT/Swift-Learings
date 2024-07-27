//
//  FeedVC.swift
//  A3
//
//  Created by Vin Bui on 7/9/23.
//

import UIKit


class FeedVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private var collectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Properties (data)
       
    private var posts:[Post] = []
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ChatDev"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.a3.offWhite
        
        setupCollectionView()
        getPosts()
    }
    
    // MARK: - Networking

    //Gets list of Posts from backend
    @objc private func getPosts(){
        //weak stuff explained later
        NetworkManager.shared.fetchPosts{[weak self] posts in
            guard let self = self else {return}
            self.posts = posts
            
            //Puts task on main thread always due on UI task
            DispatchQueue.main.async {
                //reloads data
                self.collectionView.reloadData()
                //Makes refresh disapear
                self.refreshControl.endRefreshing()
            }
            
        }
    }
    

    
    
    
    
    // MARK: - Set Up Views
    
    private func setupCollectionView() {
        
        let _: CGFloat = 24   // Use this constant when configuring constraints
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        //TODO: May need to change
        flowLayout.minimumLineSpacing = 16
        flowLayout.minimumInteritemSpacing = 16
        
        //Constrain
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.a3.offWhite
        collectionView.register(CreatePostCollectionViewCell.self, forCellWithReuseIdentifier: CreatePostCollectionViewCell.reuse)
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        //Allows data to be refreshed
        refreshControl.addTarget(self, action: #selector(getPosts), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        
        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
    }
    
}

// MARK: - UICollectionViewDelegate

extension FeedVC: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension FeedVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: Return the cells for each section
        // HINT: Use `indexPath.section` with an if statement
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreatePostCollectionViewCell.reuse, for: indexPath) as? CreatePostCollectionViewCell{
                return cell
            }
        }
        else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuse, for: indexPath) as? PostCollectionViewCell{
                let post = posts[indexPath.row]
                cell.configure(post: post)
                return cell
            }
        }
        return UICollectionViewCell()   
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Return the number of rows for each section
        // HINT: Use `section` with an if statement
        if section == 0 {
            return 1
        }
        return posts.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // TODO: Return the number of sections in this table view
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // TODO: Return the inset for the spacing between the two sections
        
        return UIEdgeInsets(top: 0, left:0, bottom: 24, right: 0) // Replace this line
    }

    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: Return the size for each cell per section
        // HINT: Use `indexPath.section` with an if statement
        if indexPath.section == 0 {
            return CGSize(width:345,height: 131)
        }
        return CGSize(width:345,height: 184) // Replace this line
    }
    
}
