//
//  CommonItemComponet.swift
//  JASafeDemoV
//
//  Created by Jitendra Agarwal on 28/12/22.
//

import SwiftUI

struct CommonItemComponet: View {
let itemList = [
    CommonItem(name: "Arun"),
    CommonItem(name: "Sankar"),
    CommonItem(name: "Subrat")
    ]
    
    var body: some View {
        
        VStack {
            
            ForEach(itemList) { list in
                HStack {
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 40,height: 40)
                    Text(list.name).foregroundColor(Color.black)
                    
                    Spacer()
                    
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12)
                    .fill(Color.theme2.secondaryText)
                   
                
                )
                
                .padding(.horizontal,10)
                
                
            }
            Spacer()
            
          
    }
        
        
        
       
//        NavigationView {
//            List {
//                 ForEach(itemList) { list in
//                     HStack {
//
//                         Circle()
//                             .fill(.white)
//                             .frame(width: 40,height: 40)
//                         Text(list.name).foregroundColor(Color.black)
//
//                         Spacer()
//                     }
//
////                     .padding()
////                     .background(
////                         RoundedRectangle(cornerRadius: 12)
////                             .fill(Color.theme2.secondaryText)
////                             .frame(maxWidth: .infinity,maxHeight: 56)
////
////                         )
////
//
//                     .padding(.horizontal , 10)
//                     .frame(maxWidth: .infinity,maxHeight: 56)
//                     .background(Color.theme2.secondaryText)
//                     .cornerRadius(10)
//
//
//                 }
//
//
//
//
//
//
//     //            .listRowBackground(
//     //                RoundedRectangle(cornerRadius: 12)
//     //                    .fill(.gray)
//     //                    .padding(EdgeInsets(
//     //                        top: 2,
//     //                        leading: 8,
//     //                        bottom: 2,
//     //                        trailing: 8
//     //                    ))
//     //
//     //            )
//
//                 .listRowSeparator(.hidden)
//
//
//             }
//
//
//
//             .listStyle(.plain)
//        }
        
       // .navigationBarTitle("Users", displayMode: .large)
    }
    
        
}

struct CommonItemList_Previews: PreviewProvider {
    static var previews: some View {
        CommonItemComponet()
    }
}
