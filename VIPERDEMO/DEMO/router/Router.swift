//
//  Router.swift
//  VIPERDEMO
//
//  Created by Neosoft1 on 07/07/22.
//

import Foundation
import UIKit

class Router {
    
    class func getRootScreenVC() -> ViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            //get vc object from storyboard based on identifier
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
            //init presenter
        let presenter = setUpPresenter(forViewController: vc)
        
        //init interactor
         setUpInteractor(forPresenter: presenter)
         
         //init view controller's presenter object
         vc.presenter = presenter
        vc.tableView?.reloadData()
         //finally return vc
         return vc
        
        
    }
    
    private class func setUpPresenter(forViewController vc : ViewController) -> Presenter{
    
      //init presenter
      let presenter = Presenter()
      //vc will implement presenter's protocol functions
        presenter.presenter = vc
      return presenter
    }
    
    private class func setUpInteractor(forPresenter presenter : Presenter){
      
      //init interactor
      let interactor = Interactor()
      //presenter will implement interactor protocol functions
      interactor.interactor = presenter
      
      //presenter's interactor must be initialized
      presenter.interactor = interactor
    }
    
  }
    
    

