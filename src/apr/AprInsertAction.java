package apr;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;
import course.CourseDB;
import course.CourseInfo;

/**
 * Servlet implementation class AprInsertAction
 */
@WebServlet("/AprInsertAction")
public class AprInsertAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); //调用doPost方法	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AprDB beanDB=new AprDB();
		AprInfo aprinfo=new AprInfo();
		aprinfo.setStartDate(MyTools.strToint(request.getParameter("startdate")));	
		aprinfo.setEndDate(MyTools.strToint(request.getParameter("enddate")));	
		aprinfo.setStuNum(MyTools.strToint(request.getParameter("stunum")));
		aprinfo.setTeaNum(MyTools.strToint(request.getParameter("teanum")));
		aprinfo.setCourseNum(MyTools.strToint(request.getParameter("coursenum")));
		aprinfo.setReason(MyTools.toChinese(request.getParameter("reason")));
		aprinfo.setAgree(MyTools.strToint(request.getParameter("agree")));
		beanDB.insertapr(aprinfo);		    
		response.sendRedirect(request.getContextPath()+"/servlet/AprListAction?uid=1");
	}
}
