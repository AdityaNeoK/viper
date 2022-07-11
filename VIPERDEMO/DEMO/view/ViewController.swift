//
//  ViewController.swift
//  VIPERDEMO
//
//  Created by Neosoft1 on 07/07/22.
//

import UIKit

class ViewController: UIViewController,PresenterProtocol {
   
    @IBOutlet weak var tableView: UITableView!

    var presenter : Presenter?
    var products = [Products]()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDataFromInteractor()
        
    }

    
    func reloadTable(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
      
    }
    
    
    func didFinishGettingDataFromPresenter(data: [Products]) {
        print(data)
        products = data
        reloadTable()
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
     //   cell.productImage.sd_setImage(with: URL(string: products[indexPath.row].product_images), completed: nil)
        //cell.productName.text = "Hello"
        return cell
    }
    
}
