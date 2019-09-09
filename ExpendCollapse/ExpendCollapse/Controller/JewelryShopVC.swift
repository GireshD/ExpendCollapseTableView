//
//  JewelryShopVC.swift
//  ExpendCollapse
//
//  Created by Giresh Dora on 28/08/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import UIKit

class JewelryShopVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var jewelrys = [JewelryModal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDataFromJson()
        tableView.reloadData()
    }
    
    //MARK: Custome methods
    
    // LOAD data from local json file
    private func loadDataFromJson(){
        guard let url = Bundle.main.url(forResource: "AllMenu", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let allMenu = try? jsonDecoder.decode([JewelryModal].self, from: data) else { return }
        jewelrys = allMenu
    }
}


extension JewelryShopVC: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: TableView Deleagte and DataSource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return jewelrys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let subCategory = jewelrys[section]
        if subCategory.isExpandable ?? false{
            return subCategory.subCategory?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryCell", for: indexPath) as! SubCategoryCell
        let subCategory = jewelrys[indexPath.section].subCategory![indexPath.row]
        cell.subCategory = subCategory
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width - 20, height: 50))
        headerView.delegate = self
        headerView.btn.setTitle(jewelrys[section].name?.capitalized, for: .normal)
        headerView.tag = section
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension JewelryShopVC: HeaderDeleagte {
    
    //MARK: HeaderView Delegate Methods
    func selectedHeader(index: Int) {
        print("Index \(index)")
        let isExpandable = jewelrys[index].isExpandable ?? false
        jewelrys[index].isExpandable = !isExpandable
        tableView.reloadSections([index], with: .automatic)
    }
}


