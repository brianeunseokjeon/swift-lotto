//
//  OutputView.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

struct ResultView {
    private let statistic = WinningStatistic()
    private let statisticText = "당첨 통계\n---------"
    
    func registerWinningNumbers(_ numbers: [Int]) throws {
        guard numbers.count == 6 else {
            throw InputError.invalidWinningNumberCount
        }
        guard Set(numbers).count == 6 else {
            throw InputError.duplicateWinningNumber
        }
        statistic.registerWinningNumbers(numbers)
    }
    
    func statisticStartPrint() {
        print(statisticText)
    }
    
    func winningTypeCountPrint() {
        for winning in Winning.allCases {
            let count = statistic.statistic[winning] ?? 0
            print("\(winning.description) \(winning.price)원 - \(count)개")
        }
    }
    
    func match(_ lottos: [Lotto]) {
        for lotto in lottos {
            let winning = statistic.match(lotto.numbers)
            statistic.insertStatistic(winning)
        }
    }
    
    func lotteryYieldPrint(inputMoney: Int) {
        guard inputMoney >= 1000 else {
            print("총 수익률은 없습니다")
            return
        }
        let ratio = ratioString(numerator: statistic.winningTotalPrice(), denominator: inputMoney)
        print("총 수익률은 \(ratio) 입니다")
    }
    
    private func ratioString(numerator: Int, denominator: Int) -> String {
        let ratio = Double(numerator) / Double(denominator)
        let toTwoDecimalPlaces = String(format: "%.2f", ratio)
        return toTwoDecimalPlaces
    }
}
