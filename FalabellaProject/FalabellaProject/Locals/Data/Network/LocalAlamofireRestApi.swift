//
//  LocalAlamofireRestApi.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import Foundation
import Alamofire

class LocalAlamofireRestApi: LocalRestApi {
    func fetchLocals(completionHandler: @escaping ([LocalModel]?, ErrorModel?) -> Void) {
        //TODO: Add enums with endpoint
        guard let url = URL(string: "http://datos.gob.cl/api/action/datastore_search?resource_id=a60f93af-6a8a-45b6-85ff-267f5dd37ad6") else {
            return
        }
        
        Alamofire.request(url)
            .validate()
            .responseJSON { response in
                guard let value = response.result.value as? [String: Any],
                    let result = value["result"] as? [String: Any],
                    let records = result["records"] as? [[String: Any]] else {
                        return
                }
                
                if let data = try? JSONSerialization.data(withJSONObject:records), let localModel = try? JSONDecoder().decode([LocalModel].self, from: data) {
                    completionHandler(localModel, nil)
                } else {
                    //TODO: Control better this:
                    let errorModel = ErrorModel(error: "Error", exception: "", message: "", path: "", status: 400, timestamp: 1)
                    completionHandler(nil, errorModel)
                }
        }
    }
    
    func filterLocals(with text: String, completionHandler: @escaping ([LocalModel]?, ErrorModel?) -> Void) {
        guard let url = URL(string: "http://datos.gob.cl/api/action/datastore_search?resource_id=a60f93af-6a8a-45b6-85ff-267f5dd37ad6&q=\(text)") else {
            return
        }
        
        Alamofire.request(url)
            .validate()
            .responseJSON { response in
                guard let value = response.result.value as? [String: Any],
                    let result = value["result"] as? [String: Any],
                    let records = result["records"] as? [[String: Any]] else {
                        return
                }
                
                if let data = try? JSONSerialization.data(withJSONObject:records), let localModel = try? JSONDecoder().decode([LocalModel].self, from: data) {
                    completionHandler(localModel, nil)
                } else {
                    //TODO: Control better this:
                    let errorModel = ErrorModel(error: "Error", exception: "", message: "", path: "", status: 400, timestamp: 1)
                    completionHandler(nil, errorModel)
                }
        }
    }
}
