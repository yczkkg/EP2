package course;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;

@WebServlet("/CourseUpdateAction")
public class CourseUpdateAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); //����doPost����
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseDB beanDB=new CourseDB();
		   CourseInfo course=new CourseInfo();
		   course.setC_ID(MyTools.strToint(request.getParameter("id")));
			course.setC_name(MyTools.toChinese(request.getParameter("name")));
			course.setC_cls(MyTools.toChinese(request.getParameter("cls")));
			course.setC_gra(MyTools.strToint(request.getParameter("grade")));
			course.setC_maj(MyTools.toChinese(request.getParameter("major")));
			course.setC_cre(MyTools.strToint(request.getParameter("credit")));
		 	int count=beanDB.updateCourse(course);	
		response.sendRedirect(request.getContextPath()+"/servlet/CourseListAction");
	}


}
