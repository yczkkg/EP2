package course;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CourseDelAction")
public class CourseDelAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseDB beanDB=new CourseDB();
        ArrayList<CourseInfo> courseList=new ArrayList<CourseInfo>();
		String list[]=request.getParameterValues("delete");
		for(int i=0;i<list.length;i++){
	    	  System.out.println(list[i] + " ");
	       }
		int count=beanDB.delete(list);	
		response.sendRedirect(request.getContextPath()+"/servlet/CourseListAction?uid=1" );
	}

}