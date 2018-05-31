package stuinfo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stuinfo.StuInfoDB;

/**
 * Servlet implementation class StuInfoSearchAction
 */
@WebServlet("/StuInfoSearchAction")
public class StuInfoSearchAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StuInfoDB beanDB=new StuInfoDB();
		int zl1=Integer.parseInt(request.getParameter("zl"));
		String gjz=request.getParameter("gjz");

		if(zl1==1) {
			String zl="S_NAME";
			request.getSession().setAttribute("StuList", beanDB.getSearch(zl,gjz));
		}else if(zl1==2) {
			String zl="S_NUM";
			request.getSession().setAttribute("StuList", beanDB.getSearch(zl,gjz));
		}else if(zl1==3) {
			String zl="S_CLS";
			request.getSession().setAttribute("StuList", beanDB.getSearch(zl,gjz));
		}else if(zl1==4) {
			String zl="S_GRA";
			request.getSession().setAttribute("StuList", beanDB.getSearch(zl,gjz));
		}else if(zl1==5) {
			String zl="S_MAJ";
			request.getSession().setAttribute("StuList", beanDB.getSearch(zl,gjz));
		}else if(zl1==6) {
			String zl="S_TEL";
			request.getSession().setAttribute("StuList", beanDB.getSearch(zl,gjz));
		}else if(zl1==7) {
			String zl="S_GPA";
			request.getSession().setAttribute("StuList", beanDB.getSearch(zl,gjz));
		}else if(zl1==8) {
			String zl="S_BIR";
			request.getSession().setAttribute("StuList", beanDB.getSearch(zl,gjz));
		}else if(zl1==9) {
			String zl="S_SEX";
			request.getSession().setAttribute("StuList", beanDB.getSearch(zl,gjz));
		}
		
		response.sendRedirect(request.getContextPath()+"/stuinfo/stuinfo_search.jsp" );
	}
}
