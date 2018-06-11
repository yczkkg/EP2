package apr;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import course.CourseDB;

/**
 * Servlet implementation class AprListAction
 */
@WebServlet("/AprListAction")
public class AprListAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AprDB beanDB=new AprDB();
		int uid=Integer.parseInt(request.getParameter("uid"));
		if(uid==1) {
			request.getSession().setAttribute("aprList",beanDB.getAllapr());
			response.sendRedirect(request.getContextPath()+"/apr/apr_list.jsp?uid="+uid);
		}else if(uid==2) {
			int id=Integer.parseInt(request.getParameter("id"));
			request.getSession().setAttribute("aprList",beanDB.getAprByTeaNum(id));
			response.sendRedirect(request.getContextPath()+"/apr/apr_list.jsp?uid="+uid);
		}else if(uid==3) {
			int id=Integer.parseInt(request.getParameter("id"));
			request.getSession().setAttribute("aprList",beanDB.getAprByStuNum(id));
			response.sendRedirect(request.getContextPath()+"/apr/apr_list.jsp?uid="+uid);
		}

	}

}
