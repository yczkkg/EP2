package notice;
import java.sql.*;
import common.*;
import notice.NoticeInfo;

public class NoticeDB {
	private Connection con = null;
	public String getNewNotice(String u_num) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	String notice="无最新消息";
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_notice where N_NUM=? ORDER BY N_TIME DESC)");
    		pStmt.setString(1,u_num);		
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
