//
//  DataProvider+Dummy.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import Foundation

struct DataDummyProvider: DataProvider {
	func getData() async -> Result<[EData], Error> {
		sleep(3)
		return .success([
			EData(mainImage: "waterfalls", listItems: [
				EDataChild(image: "Chitrakote", name: "Chitrakote Waterfalls", detail: "The Chitrakote Falls is a natural waterfall on the Indravati River"),
				.init(image: "Dudhsagar", name: "Dudhsagar falls", detail: "Dudhsagar Falls is a four-tiered waterfall on the Mandovi River in the Indian state of Goa"),
				.init(image: "Hogenakkal", name: "Hogenakkal Falls", detail: "Hogenakkal Falls is a waterfall in South India on the Kaveri river"),
				.init(image: "Jog", name: "Jog Falls", detail: "Jog Falls is a waterfall on the Sharavati river located in Sagar - Honnavar road"),
				.init(image: "Kiliyur", name: "Kiliyur Falls", detail: "Kiliyur Falls is a waterfall on the Periyaaru river in the Shervaroyan hill range in the Eastern Ghats, Tamil nadu"),
				.init(image: "MakkiyadMeenmutty", name: "Makkiyad Meenmutty Water Falls", detail: "Meenmutty WaterFall is situated in Padinjarathara in Wayanad District, Kerala"),
				.init(image: "Niagara", name: "Niagara Falls", detail: "Niagara Falls is a group of three waterfalls at the southern end of Niagara Gorge"),
				.init(image: "Soochipara", name: "Soochipara Waterfalls", detail: "Soochipara Falls also known as Sentinel Rock Waterfalls is a three-tiered waterfall in Vellarimala, Wayanad"),
				.init(image: "Talakona", name: "Talakona Waterfall", detail: "Talakona is situated in Tirupati district of Andhra Pradesh"),
				.init(image: "Yosemite", name: "Yosemite Falls", detail: "Yosemite Falls is the highest waterfall in Yosemite National Park")
			]), // Waterfalls
			EData(mainImage: "wonders", listItems: [
				.init(image: "ChichenItza", name: "Chichén Itzá", detail: "Mayan"),
				.init(image: "ChristTheRedeemer", name: "Christ the Redeemer", detail: "Rio de Janeiro"),
				.init(image: "Colosseum", name: "Colosseum", detail: "Rome"),
				.init(image: "GreatWallOfChina", name: "Great Wall of China", detail: "Beijing"),
				.init(image: "MachuPicchu", name: "Machu Picchu", detail: "Peru"),
				.init(image: "Petra", name: "Petra", detail: "Jorden"),
				.init(image: "TajMahal", name: "Taj Mahal", detail: "Agra")
			])/*, // Wonders
			   EData(mainImage: <#T##UIImage#>, listItems: <#T##[EDataChild]#>), // Jungles
			   EData(mainImage: <#T##UIImage#>, listItems: <#T##[EDataChild]#>), // Deserts
			   EData(mainImage: <#T##UIImage#>, listItems: <#T##[EDataChild]#>)*/ // Rivers
		])
	}
}
