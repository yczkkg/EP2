package common;
import java.sql.*;

public class DBConnection {
	static Connection con=null;
    // JDBC 驱动名及数据库 URL
    //static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
    //static final String DB_URL = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC&useSSL=true&autoReconnect=true&failOverReadOnly=false";
 
    // 数据库的用户名与密码、
    //static final String USER = "root";
    //static final String PASS = "password";
	/**获取数据库连接*/
	public static Connection getConnection(){
		if(con==null){
			try { //加载驱动程序
				Class.forName("com.mysql.jdbc.Driver");
		    }catch(Exception e){ 
	    		e.printStackTrace();
	    		System.out.println("加载MYSQL数据库驱动失败！");
		    }
		    try { //通过驱动程序管理器获取数据库连接
		    	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","123456");
		    }catch(Exception e){
	            e.printStackTrace();
	            System.out.println("获取数据库连接失败！");
		    }
		}
	    return con;
	}
    /** 关闭数据库的操作 */
    public static void closeConnection() {
     	if(con!=null)
			try {
				con.close();
				con=null;
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("关闭con对象失败！");
			}
    }
}
