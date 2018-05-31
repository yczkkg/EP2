package teainfo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;
import teainfo.TeaInfo;
import teainfo.TeaInfoDB;


@WebServlet("/TeaInfoUpdateAction")
public class TeaInfoUpdateAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TeaInfoDB beanDB=new TeaInfoDB();
		TeaInfo teacher=new TeaInfo();
		teacher.setT_ID(MyTools.strToint(request.getParameter("id")));
		teacher.setT_name(MyTools.toChinese(request.getParameter("name")));
		teacher.setT_num(MyTools.strToint(request.getParameter("num")));
		teacher.setT_sex(MyTools.strToint(request.getParameter("sex")));
		teacher.setT_col(MyTools.toChinese(request.getParameter("col")));
		teacher.setT_tel(MyTools.strToint(request.getParameter("tel")));
		int count=beanDB.updateTeaInfo(teacher);	
		response.sendRedirect(request.getContextPath()+"/servlet/TeaInfoListAction");
	}


}
