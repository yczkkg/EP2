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
			String user=beanDB.getAdminName(username);
			System.out.println("管理员"+user+"登录成功");
			request.getSession().setAttribute("admin_name", user);
			request.getSession().setAttribute("admin_uid", flag);
			request.getSession().setAttribute("admin_num", username);
			response.sendRedirect(request.getContextPath()+"/user/admin_main.jsp");
		}else if(flag==2){
			String user=beanDB.getTeaName(username);
			System.out.println("教师"+user+"登录成功");
			String notice=beanDB.getToAllNotice(username);
			if(notice.equals("无最新消息")) {
				notice=beanDB.getNewNotice(username);
			}
			request.getSession().setAttribute("tea_name", user);
			request.getSession().setAttribute("tea_uid", flag);
			request.getSession().setAttribute("tea_num", username);
			request.getSession().setAttribute("tea_notice", notice);
			response.sendRedirect(request.getContextPath()+"/user/teacher_main.jsp");
		}else if(flag==3){		
			String user=beanDB.getStuName(username);
			System.out.println("学生"+user+"登录成功");
			String notice=beanDB.getToAllNotice(username);
			if(notice.equals("无最新消息")) {
				notice=beanDB.getNewNotice(username);
			}
			System.out.println("2"+notice);
			request.getSession().setAttribute("stu_name", user);
			request.getSession().setAttribute("stu_uid", flag);
			request.getSession().setAttribute("stu_num", username);
			request.getSession().setAttribute("stu_notice", notice);
			response.sendRedirect(request.getContextPath()+"/user/student_main.jsp");
		}else {
			System.out.println("登录失败");
			response.sendRedirect(request.getContextPath()+"/login/login.jsp?loginflag=false");
		}


	}

}
