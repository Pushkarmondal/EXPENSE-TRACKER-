//
//  TLVM.swift
//  ExpenseTracker
//
//  Created by pushkar mondal on 20/01/23.
//

import Foundation
import Combine
import Collections

typealias transactiongroup = OrderedDictionary<String,[Transaction]>
//typealias transactionprefix = [(String, Double)]

final class TLVM:ObservableObject{
    @Published var transactions:[Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        gettransactions()
    }
    
    func gettransactions(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("INVALID URL")
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap{(data,response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                switch completion{
                case.failure(let error):
                    print("ERROR FETCHING",error.localizedDescription)
                case.finished:
                    print("finsished FETCHING TRANSACTION")
                }
            }receiveValue:{ [weak self]Result in
                self?.transactions = Result
                //                dump(self?.transactions)
                //
            }
            .store(in: &cancellables)
    }
    
    func groupbymonth() -> transactiongroup{
        guard !transactions.isEmpty else { return[:]}
        let grouptransaction = transactiongroup(grouping: transactions) { $0.month}
        
        return grouptransaction
    }
    
    //    func accumulatetransaction() -> transactionprefix {
    //        print("ACCUMULATETRANSACTION")
    //        guard !transactions.isEmpty else { return []}
    //
    //        let today = "09/02/2023".dateParsed()
    //
    //        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
    //        print("dateInterval", dateInterval)
    //
    //        var sum: Double = .zero
    //        var cumulativesum = transactionprefix()
    //
    //        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24){
    //            let dailyexpenses = transactions.filter{ $0.dateParsed == date && $0.isExpense}
    //            let dailytotal = dailyexpenses.reduce(0) { $0 - $1.signedAmount }
    //
    //            sum += dailytotal
    //            sum = sum.rounded2digits()
    //            cumulativesum.append((date.formatted(),sum))
    //            print(date.formatted(),"dailytotal:", dailytotal, "sum", sum)
    //        }
    //
    //        return cumulativesum
    //}
    //}
    
}
