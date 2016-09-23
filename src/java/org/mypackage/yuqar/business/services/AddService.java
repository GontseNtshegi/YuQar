/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.yuqar.business.services;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mypackage.yuqar.hibernate.Services;
import org.mypackage.yuqar.hibernate.SubServices;
import org.mypackage.yuqar.hibernate.YuQarHibernateUtil;

/**
 *
 * @author Devcon
 */
public class AddService {
    Session session=null;
    
    public AddService()
    {
         this.session = YuQarHibernateUtil.getSessionFactory().getCurrentSession();
    }
    //add service in database
    public void addService(String service)
    {
        try{
            Transaction trans = session.beginTransaction();
            Services svc = new Services();
            svc.setServiceName(service);
            this.session.save(svc);
            
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
   //add sub service in database
    public void addSubService(String subService, String service)
    {
    
        try{
            Transaction trans = session.beginTransaction();
            Query query = session.createQuery("insert into SubServices(SubServices0_.sid) select from Services where Services0_.serviceName='"+service+"'");
            SubServices svc = new SubServices();
            svc.setServiceName(subService);
            this.session.save(svc);
            
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
