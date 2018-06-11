package course;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CourseStuDelAction
 */
@WebServlet("/CourseStuDelAction")
public class CourseStuDelAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); //调用doPost方法	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseDB beanDB=new CourseDB();
		CourseInfo course=new CourseInfo();
        ArrayList<CourseInfo> courseList=new ArrayList<CourseInfo>();
		int id=Integer.parseInt(request.getParameter("id"));
		String list[]=request.getParameterValues("select");
/*	      for(int i=0;i<list.length;i++){
	    	  System.out.println(list[i] + " ");
	          System.out.println(id);

	          System.out.println(course.getS_num());
	          System.out.println(course.getC_ID());
	       }*/

		int count=beanDB.deleteCourse(list,id);	
	    //response.sendRedirect(request.getContextPath()+"/servlet/CourseListAction");
		response.sendRedirect(request.getContextPath()+"/course/course_list_stu.jsp");
	}
}
