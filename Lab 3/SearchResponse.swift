//
//  SearchResponse.swift
//  Lab 3
//
//  Created by Luis Ligunas on 4/26/23.
//

import Foundation

struct SearchResponse: Codable {
	let totalResults: String
	let response: String
	let search: [Movie]

	enum CodingKeys: String, CodingKey {
		case totalResults
		case response = "Response"
		case search = "Search"
	}
}

struct Movie: Codable {
	let title: String
	init(title: String) {
		self.title = title
	}

	enum CodingKeys: String, CodingKey {
		case title = "Title"
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.title = try container.decode(String.self, forKey: .title)
	}
}
