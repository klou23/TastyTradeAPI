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
    
    static func post(
        useSandbox: Bool,
        path: [String],
        headers: [String: String],
        body: Data
    ) async throws -> (Int, Data) {
        guard let requestURL = URL(string: getEndpoint(useSandbox, path)) else {
            throw RequestError.badURL
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        request.httpBody = body
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        guard let (data, urlResponse) = try? await URLSession.shared.data(for: request) else {
            throw RequestError.requestFailure
        }
        
        guard let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode else {
            throw RequestError.noStatusCode
        }
        
        return (statusCode, data)
    }
    
    
}
