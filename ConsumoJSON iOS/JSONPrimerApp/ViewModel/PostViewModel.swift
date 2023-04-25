//
//  PostViewModel.swift
//  JSONPrimerApp
//
//  Created by Ivan Cruz on 24/04/23.
//

import Foundation


class PostViewModel: ObservableObject {
    
    @Published var authenticated = 0
    init() {
        if let sesion = UserDefaults.standard.object(forKey: "sesion") as? Int {
            authenticated = sesion
        }else{
            authenticated = 0
        }
    }
    
    func login(email : String, password: String){
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        let parametros = ["email" : email, "password" : password]
        // Se convierten los datos en JSON
        let body = try! JSONSerialization.data(withJSONObject: parametros)
        var request = URLRequest(url: url)
        //Metodo del WS
        request.httpMethod = "POST"
        // El cuerpo que se va a mandar al WS
        request.httpBody = body
        // Headers que lleva el WS
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Aqui es donde se reciben los datos o el error en caso de haberlo
        URLSession.shared.dataTask(with: request){data,response,error in
            if let response = response{
                print(response)
            }
            
            guard let data = data else { return }
            
            do{
                let datos = try JSONDecoder().decode(PostModel.self, from: data)
                if !datos.token.isEmpty{
                    DispatchQueue.main.async {
                        print(datos.token)
                        self.authenticated = 1
                        UserDefaults.standard.setValue(1, forKey: "sesion")
                    }
                }
            }catch let error as NSError{
                print("Error al hacer post", error.localizedDescription)
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
            }
            
         //obligatorio poner el .resume()
        }.resume()
    }
}
