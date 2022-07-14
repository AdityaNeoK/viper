//
//  Presenter.swift
//  VIPERDEMO
//
//  Created by Neosoft1 on 07/07/22.
//

import Foundation

protocol PresenterProtocol{
    func didFinishGettingDataFromPresenter(data:[Products])
}


class Presenter:InteractorProtocol{
    
    var interactor : Interactor?
    
    var presenter : PresenterProtocol?
    
    // need data from interactor
    func getDataFromInteractor(){
        interactor?.fetch()
    }
    
    func didFinishGettingData(data: [Products]) {
        presenter?.didFinishGettingDataFromPresenter(data: data)
    }
}
