package stuinfo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stuinfo.StuInfoDB;

@WebServlet("/StuInfoListAction")
public class StuInfoListAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); //调用doPost方法
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StuInfoDB beanDB=new StuInfoDB();
		request.getSession().setAttribute("StuList",beanDB.getAll());
		response.sendRedirect(request.getContextPath()+"/stuinfo/stuinfo_list.jsp");
	}

}
