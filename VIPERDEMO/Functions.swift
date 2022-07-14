//
//  Functions.swift
//  genericNeoProject
//
//  Created by Neosoft on 03/02/22.
//

import Foundation


protocol recall {
    func fetch(_ data:[Products])
}


struct Urls{
    static let url = URL(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1")
}
extension URLSession {
    enum CustomError: Error{
        case invalidData
    }
    
    func request<T:Codable>(url:URL?,expecting: T.Type,completion:@escaping(Result<T,Error>) -> Void){
        guard let url = url else{
            completion(.failure(CustomError.invalidData))
            return
        }
        let task = dataTask(with: url) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }else{
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
                
            }catch{
                completion(.failure(error))
            }

        }
        task.resume()
    }
}


//extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() { [weak self] in
//                self?.image = image
//            }
//        }.resume()
//    }
//    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//}
//
