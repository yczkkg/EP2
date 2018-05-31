package course;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;

/**
 * Servlet implementation class CourseSearchAction
 */
@WebServlet("/CourseSearchAction")
public class CourseSearchAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseDB beanDB=new CourseDB();
		int zl1=Integer.parseInt(request.getParameter("zl"));
		//String gjz=request.getParameter("gjz");
		String gjz=MyTools.toChinese(request.getParameter("gjz"));

		if(zl1==1) {
			String zl="C_NAME";
			request.getSession().setAttribute("CourseList", beanDB.getSearch(zl,gjz));
		}else if(zl1==2) {
			String zl="C_CLS";
			request.getSession().setAttribute("CourseList", beanDB.getSearch(zl,gjz));
		}else if(zl1==3) {
			String zl="C_GRA";
			request.getSession().setAttribute("CourseList", beanDB.getSearch(zl,gjz));
		}else if(zl1==4) {
			String zl="C_MAJ";
			request.getSession().setAttribute("CourseList", beanDB.getSearch(zl,gjz));
		}else if(zl1==5) {
			String zl="C_CRE";
			request.getSession().setAttribute("CourseList", beanDB.getSearch(zl,gjz));
		}
		response.sendRedirect(request.getContextPath()+"/course/course_search.jsp" );
	}
}