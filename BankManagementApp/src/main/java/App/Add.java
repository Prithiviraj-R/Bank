package App;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic_With_persistence.LogicLayer;
import Details.AccountDetails;
import Details.Customer;
import newexception.MistakeOccuredException;
import util.HelperUtil;

/**
 * Servlet implementation class AddCustomer
 */
@WebServlet("/Add")
public class Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LogicLayer obj=new LogicLayer(false);
		HttpSession session=request.getSession();
		if(session.getAttribute("lastId")==null)
		{
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
            rd.forward(request, response);
		}
		if(request.getParameter("action").equals("Customer"))
		{
		try
		{
		HelperUtil.stringCheck(request.getParameter("name"));
		HelperUtil.stringCheck(request.getParameter("Dob"));
		HelperUtil.stringCheck(request.getParameter("Address"));
		HelperUtil.stringCheck(request.getParameter("phNo"));
		String name=request.getParameter("name");
		String dob=request.getParameter("Dob");
		String address=request.getParameter("Address");
		HelperUtil.numberCheck((int) Long.parseLong(request.getParameter("phNo")));
		long phoneNumber=Long.parseLong(request.getParameter("phNo"));
		Customer cusObj=new Customer();
		cusObj.setName(name);
		cusObj.setDob(dob);
		cusObj.setAddress(address);
		cusObj.setPhoneNumber(phoneNumber);
		System.out.println(cusObj);
		   obj.addCustomerInfo(cusObj);
	   }
	   catch(MistakeOccuredException ex)
	   {
		   request.setAttribute("message",ex.getMessage());
		   RequestDispatcher disp=request.getRequestDispatcher("AddCustomer.jsp");
		   disp.forward(request, response);
	   }
	   System.out.println("Sucessfully inserted");
	   RequestDispatcher disp=request.getRequestDispatcher("CustomerServlet");
	   disp.forward(request, response);
	   }
	   else if(request.getParameter("action").equals("Account"))
		{
		   try 
		   {
			HelperUtil.stringCheck(request.getParameter("cars"));
			HelperUtil.stringCheck(request.getParameter("Branch"));
			HelperUtil.stringCheck(request.getParameter("Balance"));
			int id=Integer.parseInt(request.getParameter("cars"));
		    String branch=request.getParameter("Branch");
		    double amount=Double.parseDouble(request.getParameter("Balance"));
		    AccountDetails accDetails=new AccountDetails();
		    accDetails.setCustomerId(id);
		    accDetails.setBranch(branch);
		    accDetails.setBalance(amount);
				obj.accountToCustomerId((int) id,accDetails);
			} catch (MistakeOccuredException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher req=request.getRequestDispatcher("AccountServlet");
			req.forward(request, response);
		}
		doGet(request, response);
	}

}
