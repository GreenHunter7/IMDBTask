//
//  NetworkManager.swift
//  ImdbTask
//
//  Created by Mohamed Hussien on 26/06/2018.
//  Copyright © 2018 Mohamed Hussien. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper


typealias JSONDictionary = [String: AnyObject]

class NetworkManager {
    
    var commanHttpHeader: HTTPHeaders = [:]
    var commanParametres: Parameters = [:]
    
    static let share: NetworkManager = NetworkManager()
    
    func InvokeGet(urlString: String, parameters: Parameters?, httpHeader: HTTPHeaders?, complationHandler: @escaping (Any?) -> Void ){
        
        if httpHeader != nil {
            for item in httpHeader! {
                commanHttpHeader.updateValue(item.value, forKey: item.key)
            }
        }
        
        if parameters != nil {
            for item in parameters! {
                commanParametres.updateValue(item.value, forKey: item.key)
            }
        }
        
        Alamofire.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.default).responseArray (keyPath:"Search") { (response: DataResponse<[MovieResponse]>) in
            
            if response.result.isFailure{
                print(response.result.error)
            }else{
                complationHandler(response.result.value)
            }
        }
        
    }
    
}
