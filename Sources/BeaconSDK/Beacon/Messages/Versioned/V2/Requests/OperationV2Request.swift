//
//  OperationV2Request.swift
//  BeaconSDK
//
//  Created by Julia Samol on 13.11.20.
//  Copyright © 2020 Papers AG. All rights reserved.
//

import Foundation

extension Beacon.Message.Versioned.V2 {
    
    struct OperationRequest: Codable {
        let type: `Type`
        let version: String
        let id: String
        let senderID: String
        let network: Beacon.Network
        let operationDetails: [Tezos.Operation]
        let sourceAddress: String
        
        init(
            version: String,
            id: String,
            senderID: String,
            network: Beacon.Network,
            operationDetails: [Tezos.Operation],
            sourceAddress: String
        ) {
            type = .operationRequest
            self.version = version
            self.id = id
            self.senderID = senderID
            self.network = network
            self.operationDetails = operationDetails
            self.sourceAddress = sourceAddress
        }
        
        // MARK: BeaconMessage Compatibility
        
        init(from beaconMessage: Beacon.Request.Operation, version: String, senderID: String) {
            self.init(
                version: version,
                id: beaconMessage.id,
                senderID: senderID,
                network: beaconMessage.network,
                operationDetails: beaconMessage.operationDetails,
                sourceAddress: beaconMessage.sourceAddress
            )
        }
        
        func toBeaconMessage(
            with origin: Beacon.Origin,
            using storage: ExtendedStorage,
            completion: @escaping (Result<Beacon.Message, Error>) -> ()
        ) {
            storage.findAppMetadata(where: { $0.senderID == senderID }) { result in
                let message = result.map { appMetadata in
                    Beacon.Message.request(
                        Beacon.Request.operation(
                            Beacon.Request.Operation(
                                id: id,
                                senderID: senderID,
                                appMetadata: appMetadata,
                                network: network,
                                operationDetails: operationDetails,
                                sourceAddress: sourceAddress,
                                origin: origin
                            )
                        )
                    )
                }
                
                completion(message)
            }
        }
        
        // MARK: Codable
        
        enum CodingKeys: String, CodingKey {
            case type
            case version
            case id
            case senderID = "senderId"
            case network
            case operationDetails
            case sourceAddress
        }
    }
}