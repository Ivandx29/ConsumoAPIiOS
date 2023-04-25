//
//  DetalleView.swift
//  JSONPrimerApp
//
//  Created by Ivan Cruz on 24/04/23.
//

import SwiftUI

struct DetalleView: View {
    var id : Int
    @StateObject private var user = DetalleViewModel()
    var body: some View {
        VStack{
            if user.avatar.isEmpty{
            ProgressView()
            }else{
                Image(systemName: "person.fill")
                    .data(url: URL(string: user.avatar)!)
                    .frame(width: 140, height: 140)
                    .clipped()
                    .clipShape(Circle())
                Text(user.first_name).font(.largeTitle)
                Text(user.email).font(.title)
            }
        }.onAppear{
            user.fetch(id: id)
        }
    }
}
