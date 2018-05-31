package stuinfo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;
import stuinfo.StuInfoDB;
import stuinfo.StuInfo;


@WebServlet("/StuInfoUpdateAction")
public class StuInfoUpdateAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StuInfoDB beanDB=new StuInfoDB();
		StuInfo student=new StuInfo();
		student.setS_ID(MyTools.strToint(request.getParameter("id")));
		student.setS_name(MyTools.toChinese(request.getParameter("name")));
		student.setS_num(MyTools.strToint(request.getParameter("num")));
		student.setS_cls(MyTools.toChinese(request.getParameter("cls")));
		student.setS_gra(MyTools.strToint(request.getParameter("gra")));
		student.setS_maj(MyTools.toChinese(request.getParameter("maj")));
		student.setS_tel(MyTools.strToint(request.getParameter("tel")));
		student.setS_gpa(MyTools.strToint(request.getParameter("gpa")));
		student.setS_bir(MyTools.strToint(request.getParameter("bir")));
		student.setS_sex(MyTools.strToint(request.getParameter("sex")));
		int count=beanDB.updateStuInfo(student);	
		response.sendRedirect(request.getContextPath()+"/servlet/StuInfoListAction");
	}

}
