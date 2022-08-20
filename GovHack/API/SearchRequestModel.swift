//
//  SearchRequestModel.swift
//  GovHack
//
//  Created by Max Chuquimia on 20/8/2022.
//

import Foundation

struct SearchRequestModel: Codable {

    let lat: Double
    let long: Double
    let radius: Int

    let maxPrice: Double?
    let includedFacilities: [String]?
    let spaceNames: [String]?
    let capacity: Int?
}

/*
 {
 Lat: Int
 Long: Int
 Radius: Int # metres
 MaxPrice: Float?
 IncludedFacilities: Facility?
 SpaceNames: [Spaces.Name]?
 Capacity: Int?
 }

 */