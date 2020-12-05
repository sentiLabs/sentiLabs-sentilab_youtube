//
//  ViewController.swift
//  sentiTable
//
//  Created by sentilab on 2019/11/26.
//  Copyright © 2019 sentilab. All rights reserved.
//

import UIKit

//tableview 테이블로 된 뷰 - 여러개의 행이 모여있는 목록 뷰(화면)
//정갈하게 보여줄려고~ 전화번호부

//1. 데이터 무엇? - 전화번호부 목록
//2. 데이터 몇개? - 100, 1000, 10000
//3.(옵션) 데이터 행 눌렀다! - 클릭
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    var newsData :Array<Dictionary<String, Any>>?
    //1. http 통신 방법 - urlsession
    //2. JSON 데이터 형태 {"돈":"1000"} - 뉴스
    //3. 테이블뷰의 데이터 매칭!! <- 통보! 그리기!
    //!!!! background : network / ui : Main
//    {
//        [
//            {"돈":"1000"},
//            {"돈":"1000"},
//            {"돈":"1000"}
//        ]
//
//    }
    
    func getNews() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=1593b98f30bc424dbda991b7228aac2f")!) { (data, response, error) in
            
            if let dataJson = data {
                 
                //json parsing
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
             
                    //Dictionary
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    self.newsData = articles
                    
                    DispatchQueue.main.async {
                        self.TableViewMain.reloadData() //Main
                    }
                   

                }
                catch {}
            }
           
        }
        
        task.resume()
    }
    
    
    //셀을 반복할 횟수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //몇개? 숫자
        
        if let news = newsData {
            return news.count
        }
        else {
             return 0
        }
       
    }
    
    //위의 numberOfRowsInSection 숫자 만큼 반복
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //1번 방법 - 임의의 셀 만들기 : 연습
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
//        cell.textLabel?.text = "\(indexPath.row)"
        
        //2번 방법 - 스토리보드 + id : 실전
        //as? as! - 부모 자식 친자확인
        //as? : 이거 맞아?
        //as! : 이거 맞아!
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        
        let idx = indexPath.row
        print("idx :: \(idx)")
        if let news = newsData {
            
            let row = news[idx]
            print("row :: \(row)")
            if let r = row as? Dictionary<String, Any> {
                print("TITLE :: \(r)")
                if let title = r["title"] as? String {
                    cell.LabelText.text = title
                }
                
            }
            
        }
        
        
        return cell
        
    }
    
    //1. 옵션 - 클릭 감지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("CLICK !!! \(indexPath.row)")
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "NewsDetailController") as! NewsDetailController
        
        if let news = newsData {
            let row = news[indexPath.row]
            print("row :: \(row)")
            if let r = row as? Dictionary<String, Any> {
              
                if let imageUrl = r["urlToImage"] as? String {
                    controller.imageUrl = imageUrl
                }
                if let desc = r["description"] as? String {
                    controller.desc = desc
                }
            }
        }
        
        //이동! - 수동!
        showDetailViewController(controller, sender: nil)
    }
    
    //2. 세그웨이 : 부모(가나다)-자식(가나다)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
        if let id = segue.identifier, "NewsDetail" == id {
            if let controller = segue.destination as? NewsDetailController {
                
                if let news = newsData {
                    if let indexPath = TableViewMain.indexPathForSelectedRow {
                        let row = news[indexPath.row]
                        print("row :: \(row)")
                        if let r = row as? Dictionary<String, Any> {
                          
                            if let imageUrl = r["urlToImage"] as? String {
                                controller.imageUrl = imageUrl
                            }
                            if let desc = r["description"] as? String {
                                controller.desc = desc
                            }
                        }
                    }
                    
                    
                }
            }
        }
        
        
        //이동! - 자동
    }
    
    
    //1. 디테일 (상세) 화면 만들기
    //2. 값을 보내기 2가지!!
    //1. tableview delegate / 2. storyboard (segue)
    //3. 화면 이동 (이동하기전에 값을 미리 셋팅해야한다!!!!)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
    }

    
    

}

