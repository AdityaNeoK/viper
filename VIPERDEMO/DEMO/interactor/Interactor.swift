//
//  Interactor.swift
//  VIPERDEMO
//
//  Created by Neosoft1 on 07/07/22.
//

import Foundation

protocol InteractorProtocol{
    func didFinishGettingData(data:[Products])
}


class Interactor{
    
    var interactor : InteractorProtocol?
    //fetching data
    
  //  var dataPassing : recall?

    func fetch(){
        URLSession.shared.request(url: Urls.url, expecting: ProductData.self) { result in
            switch result{
            case .success(let user):
      //          self.dataPassing?.fetch(user.data)
                self.interactor?.didFinishGettingData(data: user.data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
//    func getDataFromResource(){
//
//        let datas = "Hello"
//        var somData = SomeData()
//        somData.data = datas
//
//     //   interactor?.didFinishGettingData(data: somData.data!)
//
//    }
    
}
