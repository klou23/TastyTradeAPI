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
    
    private static func getEndpoint(_ sandbox: Bool, _ path: [String]) -> String {
        var ret = sandbox ? sandboxRoot : standardRoot
        for p in path {
            ret += "/" + p
        }
        return ret
    }
    
    private static func buildRequest(
        useSandbox: Bool,
        path: [String],
        method: String,
        headers: [String: String],
        params: [String: String]?,
        body: Data?
    ) throws -> URLRequest {
        guard var urlComponents = URLComponents(string: getEndpoint(useSandbox, path)) else {
            throw RequestError.badURL
        }
        
        if let params = params {
            urlComponents.queryItems = []
            for (name, value) in params {
                urlComponents.queryItems?.append(URLQueryItem(name: name, value: value))
            }
        }
        
        guard let requestURL = urlComponents.url else {
            throw RequestError.badURL
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
    
    private static func sendRequest(_ request: URLRequest) async throws -> (Int, Data) {
        
        guard let (data, urlResponse) = try? await URLSession.shared.data(for: request) else {
            throw RequestError.requestFailure
        }
        
        guard let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode else {
            throw RequestError.noStatusCode
        }
        
        return (statusCode, data)
        
    }
    
    static func post(
        useSandbox: Bool,
        path: [String],
        headers: [String: String],
        body: Data
    ) async throws -> (Int, Data) {
        
        let request = try buildRequest(
            useSandbox: useSandbox,
            path: path,
            method: "POST",
            headers: headers,
            params: nil,
            body: body
        )
        
        return try await sendRequest(request)
        
    }
    
    static func get(
        useSandbox: Bool,
        path: [String],
        headers: [String: String],
        params: [String: String]
    ) async throws -> (Int, Data) {
        
        let request = try buildRequest(
            useSandbox: useSandbox,
            path: path,
            method: "GET",
            headers: headers,
            params: params,
            body: nil
        )
        
        return try await sendRequest(request)
        
    }
}
