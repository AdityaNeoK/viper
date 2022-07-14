//
//  Interactor.swift
//  VIPERDEMO
//
//  Created by Neosoft1 on 07/07/22.
//

import Foundation
import RealmSwift

protocol InteractorProtocol{
    func didFinishGettingData(data:[Products])
}


class Interactor{
    
    var interactor : InteractorProtocol?

    func fetch(){
        URLSession.shared.request(url: Urls.url, expecting: ProductData.self) { result in
            switch result{
            case .success(let user):
                self.interactor?.didFinishGettingData(data: user.data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
