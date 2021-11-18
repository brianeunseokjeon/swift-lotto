//
//  WinningLotto.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/10.
//

import Foundation

protocol WinningLottoInputable {
	var lotto: Lotto { get }

	var bonusNumber: Int { get }
	init(inputWinningLotto: InputWinningLotto, inputBonusNumber: BonusNumber)
}

struct WinningLotto: WinningLottoInputable {
	let lotto : Lotto
	let bonusNumber: Int
	
	init(inputWinningLotto: InputWinningLotto, inputBonusNumber: BonusNumber) {
		self.lotto = inputWinningLotto.lotto
		self.bonusNumber = inputBonusNumber.unwrapped
	}
}