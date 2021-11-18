//
//  WinningStatistics.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/10.
//

import Foundation

struct WinningStatistics {
	private(set) var numberOfFirstPlace: Int = 0
	private(set) var numberOfSecondPlace: Int = 0
	private(set) var numberOfThirdPlace: Int = 0
	private(set) var numberOfFourthPlace: Int = 0
	private(set) var numberOfFifthPlace: Int = 0
	private(set) var rateOfReturn: Double = 0
	
	mutating func winning(_ winnings: Winnings) {
		switch winnings {
		case .firstPlace:
			numberOfFirstPlace += 1
		case .secondPlace:
			numberOfSecondPlace += 1
		case .thirdPlace:
			numberOfThirdPlace += 1
		case .fourthPlace:
			numberOfFourthPlace += 1
		case .fifthPlace:
			numberOfFifthPlace += 1
		default:
			break
		}
	}
	
	func numberOfWinnings(by winnings: Winnings) -> Int {
		switch winnings {
		case .firstPlace: return numberOfFirstPlace
		case .secondPlace: return numberOfSecondPlace
		case .thirdPlace: return numberOfThirdPlace
		case .fourthPlace: return numberOfFourthPlace
		case .fifthPlace: return numberOfFifthPlace
		case .notWinning: return 0
		}
	}
	
	mutating func checkLottoWinningResults(by winningLotto: WinningLotto, purchasedLottos: [Lotto]) {
		var prizeMoney: Int = 0
		purchasedLottos.forEach { lotto in
			let winnings = lotto.checkWinningRanking(with: winningLotto)
			self.winning(winnings)
			prizeMoney += winnings.prize()
		}
		
		self.rateOfReturn = calculateRateOfReturn(by: purchasedLottos.count, prizeMoney: prizeMoney)
	}
	
	private func calculateRateOfReturn(by numberOfLotto: Int, prizeMoney: Int) -> Double {
		let purchasedAmount = Double(numberOfLotto * LottoOption.amount)
		let prize = Double(prizeMoney)
		return (prize / purchasedAmount).floorTwoDecimalPlaces
	}
}