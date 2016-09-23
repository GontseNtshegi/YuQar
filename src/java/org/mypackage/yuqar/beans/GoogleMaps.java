/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.yuqar.beans;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.netbeans.saas.google.GoogleMapService;
import org.netbeans.saas.RestResponse;

/**
 *
 * @author A199026
 */
public class GoogleMaps {

    
    public static void main(String[] args)
    {
        try {
         String address = "16 Network Circle, Menlo Park";
        java.lang.Integer zoom = 15;
        String iframe = "false";

            
                RestResponse result = GoogleMapService.getGoogleMap(address, zoom, iframe);
                //TODO - Uncomment the print Statement below to print result.
                System.out.println("The SaasService returned: "+result.getDataAsString());
            
           }
   catch (IOException ex) {
            Logger.getLogger(GoogleMaps.class.getName()).log(Level.SEVERE, null, ex);
        }
    catch(Exception ex) 
    {
             ex.printStackTrace();
    }
    }
}
