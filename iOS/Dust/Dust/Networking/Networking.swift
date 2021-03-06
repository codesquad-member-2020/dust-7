//
//  Networking.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/30.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Networking {
    static func requestNearestStation(x: Double,
                                      y: Double,
                                      completion: @escaping (Result<NearestStationResponse, Error>) -> Void) {
        guard let url = APIRouter.station(x: x, y: y).url else { return }
        
        URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(NearestStationResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    static func requestDustStatus(station: String,
                                  completion: @escaping (Result<DustStatusResponse, Error>) -> Void) {
        guard let url = APIRouter.dust(station: station).url else { return }
        
        URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(.observationTimeDecodingFormatter)
                let response = try decoder.decode(DustStatusResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    static func requestForecast(completion: @escaping (Result<ForecastResponse, Error>) -> Void) {
        guard let url = APIRouter.forecast.url else { return }
        
        URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    static func requestImage(with url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            completion(.success(data))
        }.resume()
    }
}
