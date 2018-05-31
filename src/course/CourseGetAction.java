package course;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CourseGetAction")
public class CourseGetAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseDB beanDB=new CourseDB();
		int id=Integer.parseInt(request.getParameter("id"));
		CourseInfo course=beanDB.getCourseById(id);
		request.getSession().setAttribute("courseinfo", course);
		response.sendRedirect(request.getContextPath()+"/course/course_edit.jsp" );
	}
}