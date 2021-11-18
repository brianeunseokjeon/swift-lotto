//
//  LottoNumberGenerator.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

protocol LottoNumberGeneratable {
	func generate() throws -> Lotto
}

struct AutomaticGenerator: LottoNumberGeneratable {
	let randomNumberGenerator: RandomNumberGenerator
	
	init(randomNumberGenerator: RandomNumberGenerator) {
		self.randomNumberGenerator = randomNumberGenerator
	}

	func generate() throws -> Lotto {
		try Lotto(numbers: generateLottoNumbers(), numberRange: LottoOption.numberRange)
	}
	
	private func generateLottoNumbers() -> [Int] {
		var lottoNumbers = [Int]()
		randomNumberGenerator.appendNonDuplicateNumbers(in: &lottoNumbers)
		return lottoNumbers
	}
}