//
//  Request.swift
//  BeaconSDK
//
//  Created by Julia Samol on 13.11.20.
//  Copyright © 2020 Papers AG. All rights reserved.
//

import Foundation

extension Beacon {
    
    public enum Request: Equatable {
        case permission(Permission)
        case operation(Operation)
        case signPayload(SignPayload)
        case broadcast(Broadcast)
        
        // MARK: Attributes
        
        var common: RequestProtocol {
            switch self {
            case let .permission(content):
                return content
            case let .operation(content):
                return content
            case let .signPayload(content):
                return content
            case let .broadcast(content):
                return content
            }
        }
    }
}

// MARK: Protocol

protocol RequestProtocol: MessageProtocol {
    var senderID: String { get }
    var origin: Beacon.Origin { get }
}
