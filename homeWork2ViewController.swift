//
//  homeWork2ViewController.swift
//  HomeWork10.1
//
//  Created by Владислав Вишняков on 03.05.2021.
//

import UIKit



class homeWork2ViewController: UIViewController {
    
    struct Data {
        var title: String
        var settings: [DataType]
    }
    
    struct DataType {
        var data: String
        var images: UIImage?
        var colors: UIColor
    }
    
    var models = [Data]()
    
    
    func configurate() {
        models.append(Data(title: "Upper", settings: [
            DataType(data: "Авиарежим", images: UIImage(systemName: "airplane"), colors: UIColor.systemOrange),
            DataType(data: "Wi-Fi", images: UIImage(systemName: "house"), colors: UIColor.systemBlue),
            DataType(data: "Bluetooth", images: UIImage(systemName: "infinity.circle"), colors: UIColor.systemBlue),
            DataType(data: "Сотовая связь", images: UIImage(systemName: "antenna.radiowaves.left.and.right"), colors: UIColor.systemGreen),
            DataType(data: "Режим модема", images: UIImage(systemName: "apps.iphone.landscape"), colors: UIColor.systemBlue)]))

        models.append(Data(title: "Middle", settings: [
            DataType(data: "Уведомления", images: UIImage(systemName: "airplane"), colors: UIColor.systemRed),
            DataType(data: "Звуки", images: UIImage(systemName: "house"), colors: UIColor.systemRed),
            DataType(data: "Тактильные сигналы", images: UIImage(systemName: "infinity.circle"), colors: UIColor.systemPurple),
            DataType(data: "Не беспокоить", images: UIImage(systemName: "antenna.radiowaves.left.and.right"), colors: UIColor.systemGreen),
            DataType(data: "Экранное время", images: UIImage(systemName: "apps.iphone.landscape"), colors: UIColor.systemBlue)]))

        models.append(Data(title: "Bottom", settings: [
            DataType(data: "Основные", images: UIImage(systemName: "airplane"), colors: UIColor.systemGray),
            DataType(data: "Пункт управления", images: UIImage(systemName: "house"), colors: UIColor.systemBlue),
            DataType(data: "Экран и яркость", images: UIImage(systemName: "infinity.circle"), colors: UIColor.systemOrange)]))
    
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurate()
        print(models.count)
        
        
        
    }
    
    
    
}


extension homeWork2ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension homeWork2ViewController: UITableViewDataSource {
    
    
    
    

    
    func  tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].settings.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.section].settings[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "headcell", for: indexPath)
        

        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.accessoryView = UISwitch()
            } else {
                cell.accessoryType = .disclosureIndicator
            }
        } else if indexPath.section != 0 {
                cell.accessoryType = .disclosureIndicator
            }
        cell.imageView?.image = model.images
        cell.imageView?.backgroundColor = model.colors
        cell.textLabel?.text = model.data
        cell.imageView?.layer.cornerRadius = 4
        cell.imageView?.tintColor = .white
        cell.tag = indexPath.row
        return cell
    }
}

