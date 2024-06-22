//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/16/24.
//

import Foundation

struct RequestUtil {
    private static let standardRoot = "https://api.tastyworks.com"
    private static let sandboxRoot = "https://api.cert.tastyworks.com"
    
    private init() { }
    
    private static func getEndpoint(_ sandbox: Bool, _ path: [String]) -> String {
        var ret = sandbox ? sandboxRoot : standardRoot
        for p in path {
            ret += "/" + p
        }
        return ret
    }
    
    static func buildRequest(
        useSandbox: Bool,
        path: [String],
        method: String,
        headers: [String: String],
        params: [String: Any?]? = nil,
        body: Data? = nil
    ) throws -> URLRequest {
        guard var urlComponents = URLComponents(string: getEndpoint(useSandbox, path)) else {
            throw TastyAPI.RequestError.urlCreationFailure
        }
        
        if let params = params {
            
            let queryItems = params.compactMap { (key, value) -> [URLQueryItem]? in
                guard let value = value else {
                    return nil
                }
                
                switch value {
                case let stringArray as [String]:
                    return stringArray.map {
                        URLQueryItem(name: "\(key)[]", value: $0)
                    }
                case let intArray as [Int]:
                    return intArray.map {
                        URLQueryItem(name: "\(key)[]", value: String($0))
                    }
                case let string as String:
                    return [URLQueryItem(name: key, value: string)]
                case let int as Int:
                    return [URLQueryItem(name: key, value: String(int))]
                default:
                    return nil
                }
            }.flatMap { $0 }
            
            urlComponents.queryItems = queryItems.isEmpty ? nil : queryItems
        }
        
        guard let requestURL = urlComponents.url else {
            throw TastyAPI.RequestError.urlCreationFailure
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = method
        
        if let body = body {
            request.httpBody = body
        }
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
    
    static func sendRequest(_ request: URLRequest) async throws -> (Int, Data) {
        
        guard let (data, urlResponse) = try? await URLSession.shared.data(for: request) else {
            throw TastyAPI.RequestError.requestFailure
        }
        
        guard let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode else {
            throw TastyAPI.ApiError.noStatusCode
        }
        
        return (statusCode, data)
        
    }
    
    static func handleHttpErrors(statusCode: Int, data: Data) throws {
        if statusCode >= 200 && statusCode < 300 {
            return
        }
        if statusCode == 404 {
            throw TastyAPI.ApiError.http404
        }
        
        let e = try? JSONDecoder().decode(ErrorResponse.self, from: data).error
        
        switch statusCode {
        case 400:
            throw TastyAPI.ApiError.http400(code: e?.code, message: e?.message)
        case 401:
            throw TastyAPI.ApiError.http401(code: e?.code, message: e?.message)
        case 403:
            throw TastyAPI.ApiError.http403(code: e?.code, message: e?.message)
        case 429:
            throw TastyAPI.ApiError.http429(code: e?.code, message: e?.message)
        case 500:
            throw TastyAPI.ApiError.http500(code: e?.code, message: e?.message)
        default:
            throw TastyAPI.ApiError.other(code: statusCode)
        }
    }
    
    static func decode<T: Decodable>(_ t: T.Type, from: Data) throws -> T {
        guard let res = try? JSONDecoder().decode(t, from: from) else {
            throw TastyAPI.RequestError.decodingFailure
        }
        return res
    }
    
    static func encode<T: Encodable>(_ data: T) throws -> Data {
        guard let res = try? JSONEncoder().encode(data) else {
            throw TastyAPI.RequestError.encodingFailure
        }
        return res
    }
    
    static func authHeader(auth: TastyTradeAuth?) throws -> [String: String] {
        guard let sessionTok = auth?.token else {
            throw TastyAPI.RequestError.noAuthorization
        }
        return [
            "authorization": sessionTok,
            "accept": "application/json",
            "content-type": "application/json"
        ]
    }
    
    static func sandbox(auth: TastyTradeAuth?) throws -> Bool {
        guard let useSandbox = auth?.sandbox else {
            throw TastyAPI.RequestError.noAuthorization
        }
        return useSandbox
    }
}
