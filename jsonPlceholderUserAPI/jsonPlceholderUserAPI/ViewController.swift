//
//  ViewController.swift
//  jsonPlceholderUserAPI
//
//  Created by Mac on 02/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // registerXIB()
        fetchingAPI()
        collectionViewdelgateanddatasource()
    }
    func collectionViewdelgateanddatasource(){
        
    }
//    let uiNib = UINib(nibName: "CollectionViewCell", bundle: nil)
//       self.collectionView.register(uiNib, forCellWithReuseIdentifier: "CollectionViewCell")
    func fetchingAPI(){
        let urlstring = "https://jsonplaceholder.typicode.com/users"
        let url = URL(string: urlstring)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request){
            data , response , error in
            print("Data--\(data)")
            print("Response--\(response)")
            print("Error--\(error)")
         
            let jsonDecoder = JSONDecoder()
            let userResponse = try! jsonDecoder.decode([User].self, from: data!)
            self.users = userResponse
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        }.resume()
    }
}

extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CollectionViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        var eachuser = users[indexPath.row]
        cell.idlbl.text = "ID : \(eachuser.id)"
        cell.namelbl.text = "Name : \(eachuser.name)"
        cell.emaillbl.text = "Email : \(eachuser.email)"
        cell.phonelbl.text = "Website : \(eachuser.website)"
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 5
        cell.layer.borderColor = .init(genericCMYKCyan: 6, magenta: 3, yellow: 1, black: 5, alpha: 2)
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.user = users[indexPath.row]
        
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

