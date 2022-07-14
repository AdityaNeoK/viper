//
//  ViewController.swift
//  VIPERDEMO
//
//  Created by Neosoft1 on 07/07/22.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,PresenterProtocol {
//    func didSavedToRealm(realMSaved: String) {
//        let realM = try! Realm()
//        let prods = ProductDB()
//        prods.name = realMSaved
//        try! realM.write {
//            realM.add(prods)
//        }
//    }
    
    
    
   
    @IBOutlet weak var tableView: UITableView!

    var presenter : Presenter?
    var products = [Products]() {
        didSet{
            print(self.products)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDataFromInteractor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }

    
    func reloadTable(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
      
    }
    
    
    func didFinishGettingDataFromPresenter(data: [Products]) {
        print(data)
        products = data
        let realm = try! Realm()
        for i in data{
            let prod = DbProduct()
            prod.id = i.id
            prod.name = i.name
            prod.producer = i.producer
            try! realm.write {
                realm.add(prod)
            }
        }
    }
  
    @IBAction func reloadBtnClicked(_ sender: UIButton) {
        self.tableView.reloadData()
        print(products)
        //writeToRealm(data: self.products)
    }
    
    func writeToRealm(data:[Products]){
        let realm = try! Realm()
        let prod = DbProduct()
        for i in data{
            prod.name = i.name
            prod.producer = i.producer
            prod.id = i.id
            realm.add(prod)
        }
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! TableViewCell
        cell.productName.text = products[indexPath.row].name
        cell.productProducer.text = products[indexPath.row].producer
        cell.productCost.text = "RS \(products[indexPath.row].cost)"
        return cell
    }
}
