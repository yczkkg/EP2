package teainfo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teainfo.TeaInfoDB;


@WebServlet("/TeaInfoListAction")
public class TeaInfoListAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TeaInfoDB beanDB=new TeaInfoDB();
		request.getSession().setAttribute("TeaList",beanDB.getAll());
		response.sendRedirect(request.getContextPath()+"/teainfo/teainfo_list.jsp");
	}

}
