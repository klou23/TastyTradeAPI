//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/17/24.
//

import Foundation

/// Class used to make API requests
///
/// TastyAPI contains all of the methods that are used to interact with the TastyTrade API. This class also
/// contains all of the error types that the methods can throw.
public class TastyAPI {
    
    /// The authorization object to use for all API requests
    public static var auth: TastyTradeAuth?
   
    private init() { }
    
}
