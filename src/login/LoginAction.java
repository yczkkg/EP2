package login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*		String yzm=request.getSession().getAttribute("check_code").toString();
		String inputYZM=request.getParameter("verifycode");
		System.out.println(yzm+inputYZM);
		
		if(!yzm.equalsIgnoreCase(inputYZM)) {
			request.setAttribute("error", "验证码错误！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}*/
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		UserDB beanDB=new UserDB();
		int flag=beanDB.getUserbyName(username,password);
		if(flag==1) {
			System.out.println("管理员登录成功");
			response.sendRedirect(request.getContextPath()+"/user/admin.jsp?user=admin");
		}else if(flag==2){
			System.out.println("教师登录成功");
			String user=beanDB.getTeaName(username);
			System.out.println(user);
			request.getSession().setAttribute("tea_name", user);
			request.getSession().setAttribute("tea_num", username);
			response.sendRedirect(request.getContextPath()+"/user/teacher.jsp");
		}else if(flag==3){		
			String user=beanDB.getStuName(username);
			System.out.println("学生"+user+"登录成功");	
			String notice=beanDB.getNewNotice(username);
			//System.out.println(notice);
			request.getSession().setAttribute("stu_name", user);
			request.getSession().setAttribute("stu_uid", flag);
			request.getSession().setAttribute("stu_num", username);
			request.getSession().setAttribute("stu_notice", notice);
			response.sendRedirect(request.getContextPath()+"/user/student.jsp");
		}else {
			System.out.println("登录失败");
			response.sendRedirect(request.getContextPath()+"/login/login.jsp?loginflag=false");
		}


	}

}
