//
//  MoviesViewModel.swift
//  ImdbTask
//
//  Created by Mohamed Hussien on 25/06/2018.
//  Copyright © 2018 Mohamed Hussien. All rights reserved.
//

import Foundation
import ObjectMapper
import ReactiveKit
import Alamofire
import Bond


struct MoviesViewModel {
    
    var search = Observable("Black")
    
    func getMovies() -> Signal<[MovieResponse], NoError>{
    
        return Signal (producer: { (observer) -> Disposable in
            
            let url = "http://www.omdbapi.com/"
            
            var parameters = Parameters()
            
            parameters["i"] = "tt3896198" as Any
            parameters["apikey"] = "ac47cb78" as Any
            parameters["s"] = self.search.value as Any
            parameters["type"] = "movie" as Any
            parameters["page"] = "1" as Any
            
            NetworkManager.share.InvokeGet(urlString: url, parameters: parameters, httpHeader: nil, complationHandler: { (response) in
                
                guard let movies = response as? [MovieResponse] else{return}
                observer.next(movies)
                observer.completed()
            })
            return BlockDisposable{
                
            }
        })
    }
}
