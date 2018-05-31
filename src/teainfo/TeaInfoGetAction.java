package teainfo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teainfo.TeaInfo;


@WebServlet("/TeaInfoGetAction")
public class TeaInfoGetAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TeaInfoDB beanDB=new TeaInfoDB();
		int id=Integer.parseInt(request.getParameter("id"));
		TeaInfo teacher=beanDB.getTeacherById(id);
		request.getSession().setAttribute("teainfo", teacher);
		response.sendRedirect(request.getContextPath()+"/teainfo/teainfo_edit.jsp" );
	}

}
