//
//  movies.swift
//  MovieDB
//
//  Created by kaidong pei on 12/1/17.
//  Copyright © 2017 kaidong pei. All rights reserved.
//

import Foundation

class Movies{
    var title: String?
    var imgUrl: String?
    var release: String?
    var overall: String?
    
    init(MovieTitle: String, MovieImg: String, MovieReleaseData: String, MovieDes: String) {
        title = MovieTitle
        imgUrl = MovieImg
        release = MovieReleaseData
        overall = MovieDes
    }
}
