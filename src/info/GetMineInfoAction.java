package info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stuinfo.StuInfo;
import stuinfo.StuInfoDB;
import teainfo.TeaInfo;
import teainfo.TeaInfoDB;

@WebServlet("/GetMineInfoAction")
public class GetMineInfoAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		System.out.println(uid);
		if(uid==1) {
			AdminInfoDB beanDB=new AdminInfoDB();
			int num=Integer.parseInt(request.getParameter("id"));
			AdminInfo admin=beanDB.getAdminById(num);
			request.getSession().setAttribute("info", admin);
			response.sendRedirect(request.getContextPath()+"/info/info_list.jsp?uid=1" );
		}else if(uid==2) {
			TeaInfoDB beanDB=new TeaInfoDB();
			int num=Integer.parseInt(request.getParameter("id"));
			TeaInfo teacher=beanDB.getTeacherById(num);
			request.getSession().setAttribute("info", teacher);
			response.sendRedirect(request.getContextPath()+"/info/info_list.jsp?uid=2" );
		}else if(uid==3) {
			StuInfoDB beanDB=new StuInfoDB();
			int num=Integer.parseInt(request.getParameter("id"));
			StuInfo student=beanDB.getStudentByNum(num);
			request.getSession().setAttribute("info", student);
			response.sendRedirect(request.getContextPath()+"/info/info_list.jsp?uid=3" );
		}	}

}
