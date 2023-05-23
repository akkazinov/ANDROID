//
//  ViewController.swift
//  Погода
//
//  Created by admin on 23.5.23.
//
import SnapKit
import UIKit

class ViewController: UIViewController {

    private var temperatureData: [String] = [] // Declare and initialize temperatureData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        APIManager.shared.getWeather { [weak self] values in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.temperatureData = values
                self.tableView.reloadData()
            }
        }
    }

    private var tableView = UITableView()
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temperatureData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let textValue = temperatureData[indexPath.row]
        cell.textLabel?.text = "\(textValue)"
        return cell
    }
}
