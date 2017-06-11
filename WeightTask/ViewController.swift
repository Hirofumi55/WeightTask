//
//  ViewController.swift
//  WeightTask
//
//  Created by Sasakura Hirofumi on 2017/06/11.
//  Copyright © 2017 Sasakura Hirofumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //ウエイトメニューを保存するリスト
    var weightList = [WeightData]()
    
    let sectionTitle = ["Day1", "Day2", "Day3"]
    
    //TableViewのOutLet定義
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //+ボタンをタップで呼ばれるメソッド
    @IBAction func tapAddButton(_ sender: Any) {
        //アラートダイアログを生成
        let alertController = UIAlertController(title: "トレーニングメニュー追加",
                                                message: "トレーニングメニューを入力してください",
                                                preferredStyle: UIAlertControllerStyle.alert)
        
        //テキストエリアを追加
        alertController.addTextField(configurationHandler: nil)
        
        //OKボタンを追加
        let okAction = UIAlertAction(title: "OK",
                                     style: UIAlertActionStyle.default) {(action:UIAlertAction) in
                                        
                                        //OKボタンがタップされた時の処理
                                        if let textField = alertController.textFields?.first {
                                            //ウエイトメニューをリストに追加
                                            let weightData = WeightData()
                                            weightData.menu = textField.text!
                                            self.weightList.insert(weightData, at: 0)
                                            
                                            //テーブルに行が追加されたことを通知
                                            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)],
                                                                      with: UITableViewRowAnimation.right)
                                            
                                            //保存処理
                                        }
                                        
        }
    }
    
    //セクションの個数を決める
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    //セクションごとの行数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //セクションのタイトルを決める
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    //セルを作る
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        if weightList.count != 0 {
            let sectionData = weightList[(indexPath as NSIndexPath).section]
            //let cellData = sectionData[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = sectionData.menu
            cell.detailTextLabel?.text = sectionData.rep + " " + sectionData.set
        }
        
        return cell
    }
    
    
    
    
    
}
