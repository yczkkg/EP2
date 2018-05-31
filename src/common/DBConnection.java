package common;
import java.sql.*;

public class DBConnection {
	static Connection con=null;
    // JDBC �����������ݿ� URL
    //static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
    //static final String DB_URL = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC&useSSL=true&autoReconnect=true&failOverReadOnly=false";
 
    // ���ݿ���û��������롢
    //static final String USER = "root";
    //static final String PASS = "password";
	/**��ȡ���ݿ�����*/
	public static Connection getConnection(){
		if(con==null){
			try { //������������
				Class.forName("com.mysql.jdbc.Driver");
		    }catch(Exception e){ 
	    		e.printStackTrace();
	    		System.out.println("����MYSQL���ݿ�����ʧ�ܣ�");
		    }
		    try { //ͨ�����������������ȡ���ݿ�����
		    	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","123456");
		    }catch(Exception e){
	            e.printStackTrace();
	            System.out.println("��ȡ���ݿ�����ʧ�ܣ�");
		    }
		}
	    return con;
	}
    /** �ر����ݿ�Ĳ��� */
    public static void closeConnection() {
     	if(con!=null)
			try {
				con.close();
				con=null;
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("�ر�con����ʧ�ܣ�");
			}
    }
}
