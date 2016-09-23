/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.yuqar.hibernate;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Devcon
 */
public class YuQarHelper {
    
    Session session = null;

    public YuQarHelper() {
        this.session = YuQarHibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public List<Logon> selectDataFromDB(String var)
    {
        List<Logon> logonList=null;
        Transaction tx=null;
        try
        {
        tx = session.beginTransaction();
   //Query resultSet = session.createQuery("select logon0_.id.username,logon0_.id.password from Logon where logon0_.id.username='"+var+"'");
        Query resultSet=session.createQuery("select from Logon where logon0_.id.username='"+var+"'");
        logonList =(List<Logon>)resultSet.list();
         
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
       
        return logonList;
    }
  public void insertIntoLogTable(String[] set,String success,String comments,String page,String loc)
    {
        Transaction trans= null;
        try
        {
         trans = session.beginTransaction();
        LogId logid=new LogId();
        logid.setUsername(set[0]);
        logid.setPasssword(set[1]);
        logid.setEmail(set[2]);
        
        Log log =new Log();
        log.setDatee(set[3]);
        log.setIpAddress(set[4]);
        log.setComments(comments);
        log.setPage(page);
        log.setSuccess(success);
        log.setLocation(loc);
      log.setId(logid);
        //save into database
        this.session.save(log);
        
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    
    }
  public void insertIntoLogonTable(String[] set)
  {
      Transaction trans= null;
        try
        {
        trans = session.beginTransaction();
        LogonId logonid=new LogonId();
        logonid.setUsername(set[0]);
        logonid.setPassword(set[1]);
        logonid.setEmail(set[2]); 
        
        Logon logon =new Logon();
        logon.setRegisteredDate(set[3]);
        logon.setId(logonid);
        //save into database
        this.session.save(logon);
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
  }
  public int updateLogonTable(String username, String password)
  {
      int i=0;
      Transaction transaction=null;
      try
      {
      transaction=session.beginTransaction();
      Query update = session.createQuery("update Logon set logon0_.id.password='"+password+"' where logon0_.id.username='"+username+"'");
      i=update.executeUpdate();
      }
      catch(Exception e)
      {
          System.out.println(e.getMessage());
      }
      finally
        {
            //transaction.commit();
        }
      return i;
  }
  public void close()
  {
      this.session.close();
  }
}
