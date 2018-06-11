package apr;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AprDelAction
 */
@WebServlet("/AprDelAction")
public class AprDelAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AprDB beanDB=new AprDB();
        ArrayList<AprInfo> aprList=new ArrayList<AprInfo>();
		String list[]=request.getParameterValues("delete");
		for(int i=0;i<list.length;i++){
	    	  System.out.println(list[i] + " ");
	       }
		int count=beanDB.deleteapr(list);	
		response.sendRedirect(request.getContextPath()+"/servlet/AprListAction?uid=1" );
	}

}