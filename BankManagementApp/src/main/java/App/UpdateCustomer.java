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
import newexception.MistakeOccuredException;
import util.HelperUtil;

/**
 * Servlet implementation class UpdateCustomer
 */
@WebServlet("/UpdateCustomer")
public class UpdateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomer() {
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
		HttpSession session=request.getSession();
		LogicLayer obj=(LogicLayer) request.getServletContext().getAttribute("Object");
		if(session.getAttribute("lastId")==null)
		{
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
            rd.forward(request, response);
		}
		try 
		{
			HelperUtil.stringCheck(request.getParameter("customerId"));
			HelperUtil.stringCheck(request.getParameter("name"));
			HelperUtil.stringCheck(request.getParameter("dob"));
			HelperUtil.stringCheck(request.getParameter("address"));
			HelperUtil.stringCheck(request.getParameter("phone"));
			int id=Integer.parseInt(request.getParameter("customerId"));
			String name=request.getParameter("name");
			String dob=request.getParameter("dob");
			String address=request.getParameter("address");
			long phoneNo=Long.parseLong(request.getParameter("phone"));
			obj.updateCustomer(id, name, dob, address, phoneNo);
		} 
		catch (MistakeOccuredException e)
		{
			e.printStackTrace();
		}
	    RequestDispatcher req=request.getRequestDispatcher("CustomerServlet");
	    req.forward(request, response);
		doGet(request, response);
	}

}
