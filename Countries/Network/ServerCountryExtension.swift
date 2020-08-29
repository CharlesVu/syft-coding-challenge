//
//  ServerCountryExtension.swift
//  Countries
//
//  Created by Syft on 04/03/2020.
//  Copyright © 2020 Syft. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

enum APIError: Error {
    case dataModelError
}

extension Server {
    
    func countryList(completionHandler: @escaping (Result<[Country], Error>) -> Void ) {
        
        Server.shared.request(.get, path: "all", object: Country.self) { (response: [Mappable]?, error) in

            // If we have any generic errors
            if let error = error {
                completionHandler(.failure(error))
                return
            }

            // If the data we receive is not the one we expect
            guard let countries = response as? [Country] else {
                completionHandler(.failure(APIError.dataModelError))
                return
            }

            // Otherwise everything is correct, returns the list of countries
            DispatchQueue.main.async {
                completionHandler(.success(countries))
            }
        }
    }
    
}
