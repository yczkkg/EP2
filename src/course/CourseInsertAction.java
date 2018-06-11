package course;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;

@WebServlet("/CourseInsertAction")
public class CourseInsertAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); //调用doPost方法	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseDB beanDB=new CourseDB();
		CourseInfo course=new CourseInfo();
		course.setC_name(MyTools.toChinese(request.getParameter("course_name")));
		course.setC_cls(MyTools.toChinese(request.getParameter("cls")));
		course.setC_gra(MyTools.strToint(request.getParameter("grade")));
		course.setC_maj(MyTools.toChinese(request.getParameter("major")));
		course.setC_cre(MyTools.strToint(request.getParameter("credit")));	
		course.setC_type(MyTools.strToint(request.getParameter("type")));
		course.setC_tea(MyTools.toChinese(request.getParameter("teacher")));
		course.setC_amount(MyTools.strToint(request.getParameter("stuNum")));
		beanDB.insert(course);		    
		response.sendRedirect(request.getContextPath()+"/servlet/CourseListAction?uid=1");
	}
}
