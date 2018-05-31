package stuinfo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stuinfo.StuInfoDB;
import stuinfo.StuInfo;


@WebServlet("/StuInfoGetAction")
public class StuInfoGetAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StuInfoDB beanDB=new StuInfoDB();
		int id=Integer.parseInt(request.getParameter("id"));
		StuInfo student=beanDB.getStudentById(id);
		request.getSession().setAttribute("stuinfo", student);
		response.sendRedirect(request.getContextPath()+"/stuinfo/stuinfo_edit.jsp" );
	}
}
