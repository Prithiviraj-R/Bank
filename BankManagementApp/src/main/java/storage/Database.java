package storage;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

import Details.AccountDetails;
import Details.Customer;
import logic_With_persistence.Persistence;
import newexception.MistakeOccuredException;
import util.HelperUtil;
public class Database implements Persistence
{
	String url="jdbc:mysql://localhost:3306/bank";
	String uName="root";
	String pass="1234";
	private long accountId;
	private int customerId;
	
	public void idCheck(int id) throws MistakeOccuredException
	{
		Map<Integer,Customer> customerMap=getCustomer();
		if (customerMap.get(id) == null) {
			throw new MistakeOccuredException("Entered Key is not exist.");
		}
	}
	public void createTable() 
	{
		try(Connection con=DriverManager.getConnection(url, uName, pass);
		Statement st=con.createStatement();)
		{
			String query1="create table if not exists customerInfo(customerID int not null auto_increment,name varchar(25),dob varchar(10),address varchar(25),mobileNo bigint,status tinyint,primary key(customerID));";
		    String query2="create table if not exists accountInfo(accountID int not null auto_increment,customerID int not null,branchName varchar(13),balance int,status tinyint,primary key(accountID),foreign key(customerID) references customerInfo(customerID));";
		    int count1=st.executeUpdate(query1);		  
			
			int count2=st.executeUpdate(query2);
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
	}
     

	public int insertTable(String query)throws MistakeOccuredException
	{
		int count;
		try(Connection con=DriverManager.getConnection(url, uName, pass);
    			Statement st=con.createStatement();)
		{
			st.executeUpdate(query,Statement.RETURN_GENERATED_KEYS);
			ResultSet rs=st.getGeneratedKeys();
			rs.next();
			int id=rs.getInt(1);
			return id;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public long insertTableAcc(String query)throws MistakeOccuredException
	{
		int count;
		try(Connection con=DriverManager.getConnection(url, uName, pass);
    			Statement st=con.createStatement();)
		{
			st.executeUpdate(query,Statement.RETURN_GENERATED_KEYS);
			ResultSet rs=st.getGeneratedKeys();
			rs.next();
			long id=rs.getInt(1);
			return id;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int addCustomer(Customer cusObj)throws MistakeOccuredException
	{
		String name=cusObj.getName();
		String dob=cusObj.getDob();
		String address=cusObj.getAddress();
		boolean status=cusObj.isStatus();
		long mobile=cusObj.getPhoneNumber();
		int add=insertTable("insert into customerInfo(name,dob,address,status,mobileNo) values('"+ name +"','"+dob+"','"+ address +"',"+status+","+mobile+");");
		return add;
	}
	
	public long addAccount(int id,AccountDetails accObj)throws MistakeOccuredException
	{
		idCheck(id);
		String branch=accObj.getBranch();
		int customerId=accObj.getCustomerId();
		double balance=accObj.getBalance();
		boolean status=accObj.isStatus();
		long add=insertTableAcc("insert into accountInfo(customerId,branchName,balance,status) values('"+customerId+"','"+branch+"',"+ balance +","+status+");");
		return add;
	}
	
	public int updateRecord(String query) throws MistakeOccuredException
	{
		
		try(Connection con=DriverManager.getConnection(url, uName, pass);
				Statement statement=con.createStatement();)
		{
			int number=statement.executeUpdate(query);
			System.out.println(number);
			return number;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			throw new MistakeOccuredException(e);
		}
	}
	
	public void updateCustomerStatus(int id,int status)throws MistakeOccuredException
	{
         updateRecord("update customerInfo set status="+ status +" where customerID ="+ id +";");
         System.out.println("Sucessfully Updated.");
	}
	
	public void updateAccountStatus(int id,long accNo,int status)throws MistakeOccuredException
	{
		updateRecord("update accountInfo set status="+ status +" where accountId = "+ accNo +" and "+"customerId="+ id +";");
		System.out.println("Sucessfully updated.");
	}


	@Override
	public void deposit(int id, long accNum, double amount) throws MistakeOccuredException
	{
		Map<Integer,Map<Long,AccountDetails>> accountMap=getAccount();
		
		Map<Long, AccountDetails> accDetailsMap = accountMap.get(id);
		
		HelperUtil.objectCheck(accDetailsMap, "Customer account");
		
		AccountDetails accInfo = accDetailsMap.get(accNum);
		
		HelperUtil.objectCheck(accInfo, "Account Information ");
		
		double newBalance=accInfo.getBalance()+amount;
		
		updateRecord("update accountInfo set balance ="+newBalance+" where accountId ="+accNum +" and "+" customerId="+id+";");
		
	}


	@Override
	public void withDraw(int id, long accNum, double amount) throws MistakeOccuredException 
	{
		Map<Integer,Map<Long,AccountDetails>> accountMap=getAccount();
		
		Map<Long, AccountDetails> accDetailsMap = accountMap.get(id);
		
		HelperUtil.objectCheck(accDetailsMap, "CustomerId");
		
		AccountDetails accInfo = accDetailsMap.get(accNum);
		
		HelperUtil.objectCheck(accInfo, "AccountDetails");
		
//		accountAccess(accInfo);
		
		
		if (accInfo.getBalance() < amount) {
		
			throw new MistakeOccuredException("Insufficient balance.");
		}
		
		double newBalance = accInfo.getBalance() - amount;
		
	    updateRecord("update accountInfo set balance="+ newBalance +" where accountId="+accNum+" and "+"customerId="+id+";");
	}

    public void amountTransfer(long fromAccNo,long toAccNo,double amount) throws MistakeOccuredException
    {
    	AccountDetails fromAccInfo=getAccountWithAccNo(fromAccNo);
    	AccountDetails toAccInfo=getAccountWithAccNo(toAccNo);
    	double balance=toAccInfo.getBalance();
    	double newBalance=balance+amount;
    	updateRecord("update accountInfo set balance="+ newBalance +" Where accountId="+toAccNo+";");
        double fromAccBalance=fromAccInfo.getBalance();
        if(fromAccBalance<amount)
        {
        	throw new MistakeOccuredException("Insufficient Balance");
        }
        double balanceAftrWithdrawed=fromAccBalance-amount;
        updateRecord("update accountInfo set balance="+ balanceAftrWithdrawed +" Where accountId="+fromAccNo+";");
        System.out.println(fromAccInfo);
        System.out.println(toAccInfo);
    }
	@Override
	public Map<Integer, Customer> getCustomer() throws MistakeOccuredException
	{
		createTable();
		Map<Integer,Customer> customerData=new HashMap<>();
		try(Connection connection=DriverManager.getConnection(url, uName, pass);
				Statement statement = connection.createStatement())
		{
			 String sql="select * from customerInfo;";
			 ResultSet result=statement.executeQuery(sql);
			
			 while(result.next())
			 {
				 Customer customerInfo=new Customer();
				 customerInfo.setName(result.getString("Name"));
				 customerInfo.setDob(result.getString("dob"));
				 customerInfo.setAddress(result.getString("Address"));
				 customerInfo.setPhoneNumber(result.getLong("MobileNo"));
				 customerInfo.setStatus(result.getBoolean("status"));
				 customerId=result.getInt("customerId");
				 customerData.put(customerId, customerInfo);
			 }

					return customerData;
		}					
				
		
		catch(SQLException e)
		{
			e.printStackTrace();
			throw new MistakeOccuredException(e);
		}
	}


	@Override
	public Map<Integer, Map<Long, AccountDetails>> getAccount() throws MistakeOccuredException
	{
		createTable();
		Map<Integer,Map<Long,AccountDetails>> accountMap=new HashMap<>();
		try(Connection connection=DriverManager.getConnection(url, uName, pass);
				Statement statement = connection.createStatement())
		{
			String sql="select * from accountInfo;";
			ResultSet result=statement.executeQuery(sql);
			 
			while(result.next())
			{
				 AccountDetails accountInfo=new AccountDetails();
				 accountInfo.setCustomerId(result.getInt("customerId"));
				 accountInfo.setBranch(result.getString("branchName"));
				 accountInfo.setBalance(result.getDouble("balance"));
				 accountInfo.setStatus(result.getBoolean("status"));
				 accountId = result.getLong("accountId");
				 accountInfo.setAccountNumber(result.getLong("accountId"));
				 Map<Long,AccountDetails> temp=accountMap.get(accountInfo.getCustomerId());
				 if(temp==null)
				 {
					 temp=new HashMap<>();
					 accountMap.put(accountInfo.getCustomerId(), temp);
				 }
				 temp.put((long) accountId, accountInfo);
				 }
			
				return accountMap;
		   }
			catch(SQLException ex)
			{
				throw new MistakeOccuredException(ex);
			}
		
	}
 	public AccountDetails getAccountWithAccNo(long accNo) throws MistakeOccuredException
 	{
 		try(Connection connection=DriverManager.getConnection(url, uName, pass);
				Statement statement = connection.createStatement())
		{
			String sql="select * from accountInfo where accountId="+accNo+";";
			ResultSet result=statement.executeQuery(sql);
			AccountDetails accountInfo=null; 
			while(result.next())
			{
				 accountInfo=new AccountDetails();
				 accountInfo.setCustomerId(result.getInt("customerId"));
				 accountInfo.setBranch(result.getString("branchName"));
				 accountInfo.setBalance(result.getDouble("balance"));
				 accountInfo.setStatus(result.getBoolean("status"));
				 accountId = result.getLong("accountId");
				 accountInfo.setAccountNumber(result.getLong("accountId"));
			}
			return accountInfo;
 	    }
 		catch(SQLException ex)
 		{
 			throw new MistakeOccuredException(ex);
 		}
}
 	public void updateCustomer(int customerId,String name,String dob,String address,long phno) throws MistakeOccuredException
	{
 		String query="update customerInfo set name=?,dob=?,address=?,mobileNo=? where customerID=?;";
		try(Connection con=DriverManager.getConnection(url, uName, pass);
				PreparedStatement statement=con.prepareStatement(query))
		{
			statement.setString(1, name);
			statement.setString(2, dob);
			statement.setString(3, address);
			statement.setLong(4, phno);
			statement.setInt(5, customerId);
			int number=statement.executeUpdate();
			System.out.println("Sucessfully Updated");
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			throw new MistakeOccuredException(e);
		}
	}
 	public int lastRegisteredCustomer() throws MistakeOccuredException
 	{
 		String query="select max(customerID) from customerInfo;";
		try(Connection con=DriverManager.getConnection(url, uName, pass);
				Statement statement=con.createStatement();)
		{	
		     ResultSet rs=statement.executeQuery(query);
		     rs.next();
		     int id=rs.getInt(1);
		     System.out.println(id);
		     return id;
		}
		catch(SQLException ex)
		{
	        throw new MistakeOccuredException(ex);
		}
 	}
 	
 	public boolean getRole(String id,String passWord) throws MistakeOccuredException
 	{
 		String query="select role from info where UserName=? and password=?;";
		try(Connection con=DriverManager.getConnection(url, uName, pass);
				PreparedStatement statement=con.prepareStatement(query);)
		{	
			 statement.setString(1, id);
			 statement.setString(2, passWord);
		     ResultSet rs=statement.executeQuery();
		     rs.next();
		     boolean role=rs.getBoolean("role");
		     return role;
		}
		catch(SQLException ex)
		{
	        throw new MistakeOccuredException("Entered username or password is invalid");
		}
 	}
}
	
	
	
