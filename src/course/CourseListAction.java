package course;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CourseListAction")
public class CourseListAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseDB beanDB=new CourseDB();
		int uid=Integer.parseInt(request.getParameter("uid"));
		if(uid==1) {
			request.getSession().setAttribute("CourseList",beanDB.getAll());
			response.sendRedirect(request.getContextPath()+"/course/course_list.jsp?uid="+uid);
		}else if(uid==2) {
			int id=Integer.parseInt(request.getParameter("id"));
			request.getSession().setAttribute("CourseList",beanDB.getAllCourseByTeaNum(id));
			response.sendRedirect(request.getContextPath()+"/course/course_list.jsp?uid="+uid);
		}else if(uid==3) {
			int id=Integer.parseInt(request.getParameter("id"));
			request.getSession().setAttribute("CourseList",beanDB.getAllCourseByStuNum(id));
			response.sendRedirect(request.getContextPath()+"/course/course_list.jsp?uid="+uid);
		}

	}

}
