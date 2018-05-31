package login;
import java.sql.*;
import common.*;
import course.CourseInfo;

public class UserDB {
	private Connection con = null;
	public int getUserbyName(String username,String userpwd) {
		//System.out.println("GetUserbyName:userName="+userName);
		UserInfo user=null;
		PreparedStatement pStmt=null;
		ResultSet rs=null;
		int flag=0;
		try {
			con=DBConnection.getConnection();
			pStmt = con.prepareStatement("SELECT * FROM t_user where U_NAME=? and U_PWD=?");
			pStmt.setString(1,username);
			pStmt.setString(2,userpwd);
			rs = pStmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt("U_TYPE")==1) {
					flag=1;
				}else if(rs.getInt("U_TYPE")==2) {
					flag=2;
					
				}else if(rs.getInt("U_TYPE")==3) {
					flag=3;
				}
			}
			rs.close();
			pStmt.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("获取用户信息失败！");
		}finally {
			DBConnection.closeConnection();
		}
		return flag;		
	}
	
	/* 获取教师用户名 */
	public String getTeaName(String username) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	String user=null;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_teacher where T_NUM=?");
    		pStmt.setString(1,username);		
    		rs = pStmt.executeQuery();
	    	if(rs.next()){
	    		user=rs.getString("T_NAME");
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取教师用户名失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return user;
    }
	
	/* 获取学生用户名 */
	public String getStuName(String username) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	String user=null;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_student where S_NUM=?");
    		pStmt.setString(1,username);		
    		rs = pStmt.executeQuery();
	    	if(rs.next()){
	    		user=rs.getString("S_NAME");
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取教师用户名失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return user;
    }
	/*获取最新消息*/
	public String getNewNotice(String username) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	String notice="无最新消息";
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_notice where N_NUM=? ORDER BY N_TIME DESC");
    		pStmt.setString(1,username);		
    		rs = pStmt.executeQuery();
	    	if(rs.next()){
	    		notice=rs.getString("N_INFO");
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取最新消息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return notice;
    }
}