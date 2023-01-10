//
//  CommonViewController.swift
//  JASafeDemoV
//
//  Created by Jitendra Agarwal on 27/12/22.
//

import SwiftUI

struct CommonViewController: View {
    @State var txt = ""
    var body: some View {
        ZStack {
            
            
            VStack() {

                    Text("Who Are You?")
                    .foregroundColor(.black)
                    .bold()
                    .padding(.top,20)
                    SearchViewComponent(searchText: $txt)
                CommonItemComponet()
                
                
                
             
                }
            
        
           
        }
    
        
        
        
        
      
       
     
    }
        
}

struct CommonViewController_Previews: PreviewProvider {
    static var previews: some View {
        CommonViewController()
    }
}
