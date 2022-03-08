package App;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Details.Customer;
import logic_With_persistence.LogicLayer;
import newexception.MistakeOccuredException;
import util.HelperUtil;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
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
		if(session.getAttribute("userId")==null)
		{
			RequestDispatcher req=request.getRequestDispatcher("login.jsp");
			req.forward(request, response);
		}
		Customer cusObj=null;
		try {
			if(request.getParameter("update").equals("active"))
			{
				HelperUtil.stringCheck(request.getParameter("customerId"));
		        int id=Integer.parseInt(request.getParameter("customerId"));
		        cusObj=obj.getCustomerDetails(id);
		        session.setAttribute("Customer", cusObj);
				RequestDispatcher req=request.getRequestDispatcher("update.jsp");
				req.forward(request, response);
				doGet(request, response);
			}
			else if(request.getParameter("update").equals("profile"))
			{
                HelperUtil.stringCheck((String) session.getAttribute("userId"));
				cusObj=obj.getCustomerDetails(Integer.parseInt((String) session.getAttribute("userId")));
				session.setAttribute("Customer", cusObj);
				RequestDispatcher req=request.getRequestDispatcher("myprofile.jsp");
				req.forward(request, response);
				doGet(request, response);
			}
		}catch (NumberFormatException | MistakeOccuredException e) {
			e.printStackTrace();
		}
	}

}
