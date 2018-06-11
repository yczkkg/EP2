package notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;


/**
 * Servlet implementation class NoticeInsertAction
 */
@WebServlet("/NoticeInsertAction")
public class NoticeInsertAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); //调用doPost方法	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeDB beanDB=new NoticeDB();
		NoticeInfo notice=new NoticeInfo();
		notice.setN_num(MyTools.toChinese(request.getParameter("num")));
		notice.setN_info(MyTools.toChinese(request.getParameter("info")));
		notice.setN_time(MyTools.toChinese(request.getParameter("time")));
		beanDB.insertnotice(notice);		    
		response.sendRedirect(request.getContextPath()+"/servlet/CourseListAction?uid=1");
	}
}
