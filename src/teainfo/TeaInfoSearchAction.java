package teainfo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teainfo.TeaInfoDB;

/**
 * Servlet implementation class TeaInfoSearchAction
 */
@WebServlet("/TeaInfoSearchAction")
public class TeaInfoSearchAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TeaInfoDB beanDB=new TeaInfoDB();
		int zl1=Integer.parseInt(request.getParameter("zl"));
		String gjz=request.getParameter("gjz");

		if(zl1==1) {
			String zl="T_NAME";
			request.getSession().setAttribute("TeaList", beanDB.getSearch(zl,gjz));
		}else if(zl1==2) {
			String zl="T_NUM";
			request.getSession().setAttribute("TeaList", beanDB.getSearch(zl,gjz));
		}else if(zl1==3) {
			String zl="T_SEX";
			request.getSession().setAttribute("TeaList", beanDB.getSearch(zl,gjz));
		}else if(zl1==4) {
			String zl="T_COL";
			request.getSession().setAttribute("TeaList", beanDB.getSearch(zl,gjz));
		}else if(zl1==5) {
			String zl="T_TEL";
			request.getSession().setAttribute("TeaList", beanDB.getSearch(zl,gjz));
		}		
		response.sendRedirect(request.getContextPath()+"/teainfo/teainfo_search.jsp" );
	}
}
