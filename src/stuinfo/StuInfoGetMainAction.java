package stuinfo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teainfo.TeaInfoDB;
import stuinfo.StuInfoDB;
import stuinfo.StuInfo;

@WebServlet("/StuInfoGetMainAction")
public class StuInfoGetMainAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		if(uid==1) {
			
		}else if(uid==2) {
			TeaInfoDB beanDB=new TeaInfoDB();
		}else if(uid==3) {
			StuInfoDB beanDB=new StuInfoDB();
			int num=Integer.parseInt(request.getParameter("id"));
			StuInfo student=beanDB.getStudentByNum(num);
			request.getSession().setAttribute("stuinfo", student);
			response.sendRedirect(request.getContextPath()+"/stuinfo/stuinfo_main.jsp" );
		}

	}
}

