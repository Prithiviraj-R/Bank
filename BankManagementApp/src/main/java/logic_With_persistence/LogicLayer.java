package logic_With_persistence;

import java.lang.reflect.InvocationTargetException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import Details.AccountDetails;
import Details.Customer;
import newexception.MistakeOccuredException;
import util.HelperUtil;

public class LogicLayer
{
	Persistence storageObj=null;

	Properties storageChoice=new Properties();
	
	public LogicLayer(boolean flag)
	{
		String path="";
	    storageChoice.setProperty("File","storage.FileStorage");
	    storageChoice.setProperty("DB", "storage.Database");
	    if(flag)
	    {
	    	path=storageChoice.getProperty("File");
	    }
	    else
	    {
	    	path=storageChoice.getProperty("DB");
	    }
	  
	    	try 
	    	{
				Class storageClass=Class.forName(path);
				Object interfaceObj=storageClass.getDeclaredConstructor().newInstance();
				storageObj=(Persistence) interfaceObj;
				
			}
	    	catch (ClassNotFoundException e) 
	    	{
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    
	}	
	Cache cacheObj= new Cache();
	

    //    Method to load cache
	public void preLoadCustomerMap() throws MistakeOccuredException
	{
		Map<Integer,Customer> returned=storageObj.getCustomer();
		
		cacheObj.preload(returned);
	}
    
	
	//	Method to load Cache
	public void preLoadAccountMap() throws MistakeOccuredException
	{
		Map<Integer,Map<Long,AccountDetails>> returned=storageObj.getAccount();
		
		cacheObj.preloadAccount(returned);
	}
	
	
	
	// Method to create Customer
	public void addCustomerInfo(Customer cusObj)
			throws MistakeOccuredException 
	{
		
		HelperUtil.objectCheck(cusObj);
		
		
			preLoadCustomerMap();
		
		int id=storageObj.addCustomer(cusObj);
		
		
		cacheObj.putCustomer(id, cusObj);
		
	}

//	Method to get Customer Details.
	public Customer getCustomerDetails(int id) throws MistakeOccuredException
	{
		preLoadCustomerMap();
		
		HelperUtil.numberCheck(id);

		return cacheObj.getDetails(id);
		
	}
	
    //	Method to create AccountDetails.
	public void accountToCustomerId(int id,AccountDetails accObj) throws MistakeOccuredException
	{
		
	    preLoadCustomerMap();
			
	    preLoadAccountMap();	
		
		
		long accNo=storageObj.addAccount(id, accObj);
		
	    cacheObj.putAccount(id, accNo, accObj);
	
	}

    //Method to get AccountDetails
	public Map<Long,AccountDetails> getAccountdetails(int id) throws MistakeOccuredException
	{
		preLoadCustomerMap();
		
		preLoadAccountMap();
	
		return cacheObj.getAccount(id);
	}
	
//	Method to Set customer status.
	public void setCustomerStatus(int id,int status) throws MistakeOccuredException
	{
        preLoadCustomerMap();
		
		preLoadAccountMap();
		
		storageObj.updateCustomerStatus(id, status);
		
		cacheObj.setCustomerStatus(id, status);
	}

//	Method to get customer status. 
	public boolean getCustomerStatus(int id) throws MistakeOccuredException
	{
        
		preLoadCustomerMap();
		
		preLoadAccountMap();

		return cacheObj.getCustomerStatus(id);
		
		
	}
	
//	Method to set AccountStatus
	public void setAccountStatus(int id,long accNo,int status) throws MistakeOccuredException
	{
        preLoadCustomerMap();
		
		preLoadAccountMap();
		
		storageObj.updateAccountStatus(id, accNo, status);
		
		cacheObj.setAccountStatus(id, accNo, status);
	
	}
	
//	Method to get Account status.
	public boolean getAccountStatus(int id,long accNo) throws MistakeOccuredException
	{
        preLoadCustomerMap();
		
		preLoadAccountMap();
	
	    return cacheObj.getAccountStatus(id, accNo);
	}
	
//	Method to deposit.
	public void deposit(int id,long accNo,double amount) throws MistakeOccuredException
	{
        preLoadCustomerMap();
		
		preLoadAccountMap();
		
		storageObj.deposit(id,accNo,amount);
		
		cacheObj.deposit(id, accNo, amount);
	}
	
//	Method to withDraw
    public void withDraw(int id,long accNo,double amount) throws MistakeOccuredException
    {
    	 preLoadCustomerMap();
 		
 		preLoadAccountMap();
 		
 		storageObj.withDraw(id,accNo,amount);
 		
 		cacheObj.withDraw(id, accNo, amount);
    }
    
//    Method to get Balance.
    public double getBalance(int id,long accNo) throws MistakeOccuredException
    {

   	    preLoadCustomerMap();
		
		preLoadAccountMap();
		
		return cacheObj.getBalance(id, accNo);
    }
    public Map<Integer,Customer> getAllCustomer() throws MistakeOccuredException
    {
    	preLoadCustomerMap();
    	
    	return cacheObj.getAllCustomer();
    }
    
    public Map<Integer,Map<Long,AccountDetails>> getAllAccount() throws MistakeOccuredException
    {
    	preLoadAccountMap();
    	
    	return cacheObj.getAllAccount();
    }
    
    public void amountTransfer(long fromAcc,long toAcc,double amount) throws MistakeOccuredException
    {
    	preLoadAccountMap();
    	
    	storageObj.amountTransfer(fromAcc, toAcc, amount);
    	
    	System.out.println("transaction SucessFully");
    }
    
    public void updateCustomer(int id,String name,String dob,String address,long phno) throws MistakeOccuredException
    {
    	storageObj.updateCustomer(id, name, dob, address, phno);
    }
    
    public int lastCustomer() throws MistakeOccuredException
    {
    	return storageObj.lastRegisteredCustomer();
    }
    
    public List<Integer> getAllActiveCustomerId() throws MistakeOccuredException
    {
    	preLoadAccountMap();
    	preLoadCustomerMap();
    	return cacheObj.getAllActiveCustomerId();
    }
    public boolean getRole(String id,String passWord) throws MistakeOccuredException
    {
    	return storageObj.getRole(id, passWord);
    }
    
    public Map<Integer,Customer> getInactiveCustomer() throws MistakeOccuredException
    {
    	preLoadCustomerMap();
    	return cacheObj.getAllInactiveCustomer();
    }
    
    public Map<Integer,Customer> getactiveCustomer() throws MistakeOccuredException
    {
    	preLoadCustomerMap();
    	return cacheObj.getAllactiveCustomer();
    }
    
    public long getLastAccountId() throws MistakeOccuredException
    {
    	preLoadAccountMap();
    	
    	return cacheObj.getAllAccountId();
    }
	}




