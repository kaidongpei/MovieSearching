//
//  ViewController.swift
//  MovieDB
//
//  Created by kaidong pei on 12/1/17.
//  Copyright © 2017 kaidong pei. All rights reserved.
//

import UIKit
import Foundation
import TextFieldEffects

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var coview: UICollectionView!
    var getTextFieldText:HoshiTextField!
    var getUrl:String?
    var movies: Array = [Movies]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setTextField()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getData(){
        URLSession.shared.dataTask(with: URL(string: getUrl!)!) { (data, response, error) in
            if error == nil{
                
                do{
                    if let jsonresult = try JSONSerialization.jsonObject(with: data!, options: []) as? Dictionary<String, Any>{
                       let result = (jsonresult["results"] as? NSArray)!
                       
                        for i in result{
                            let movie = i as! NSDictionary
                            let title = movie["title"] as! String
                            let titleDate = movie["release_date"] as! String
                            let titleDes = movie["overview"] as! String
                        
                            if let poster = movie["poster_path"]  {
                                
                            
                                let getMovie = Movies(MovieTitle: title, MovieImg: poster as! String, MovieReleaseData: titleDate, MovieDes: titleDes)
                                self.movies.append(getMovie)
                            }
                            else {
                                let getMovie = Movies(MovieTitle: title, MovieImg: "noimg", MovieReleaseData: titleDate, MovieDes: titleDes)
                                
                                self.movies.append(getMovie)
                            }
                            
                        }
                        
                        DispatchQueue.main.async {
                            self.coview.reloadData()
                        }
                    }
                }
                catch{
                    print(error)
                }
            }
            }.resume()
        
    
    }
    
    func setView(){
        let itemSize = UIScreen.main.bounds.width/2 - 2
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        coview.collectionViewLayout = layout
    }
    
    func setTextField(){
        getTextFieldText = HoshiTextField(frame: CGRect(x: 20, y: 20, width: 200.00, height: 30.00))
        getTextFieldText?.placeholder = "Movies"
        getTextFieldText.placeholderColor = .darkGray
        
        view.addSubview(getTextFieldText)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.lb.text = movies[indexPath.row].title
        
        if movies[indexPath.row].imgUrl == "noimg" {
            cell.img.backgroundColor = UIColor.darkGray
        } else {
            
            let p = self.movies[indexPath.row].imgUrl
        let tt = "https://image.tmdb.org/t/p/w1280\(p!)"
        let url = URL(string: tt)
        let data = try? Data(contentsOf: url!)
        cell.img.image = UIImage(data: data!)
            }
        return cell
    }
    @IBAction func submit(_ sender: UIButton) {
        
        movies = []
        
        getUrl = "https://api.themoviedb.org/3/search/movie?api_key=b5f7420f86c236da58cd9bf8b3ca8ae5&language=en-US&query=\(getTextFieldText.text!))&page=1&include_adult=false"
        getData()
        
        
        DispatchQueue.main.async {
            self.coview.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cv = storyboard?.instantiateViewController(withIdentifier: "movie") as! MovieViewController
        
        cv.getDe = movies[indexPath.row].overall
        cv.getTitle = movies[indexPath.row].title
        cv.getDate = movies[indexPath.row].release
        let p = self.movies[indexPath.row].imgUrl
        let tt = "https://image.tmdb.org/t/p/w1280\(p!)"
        let url = URL(string: tt)
        let data = try? Data(contentsOf: url!)
        cv.getIm = UIImage(data: data!)
        
        self.present(cv, animated: true, completion: nil)
        
    }
    
}

