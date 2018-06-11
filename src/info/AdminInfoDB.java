package info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBConnection;
import info.AdminInfo;

public class AdminInfoDB {
    private Connection con = null;
    /* 获取指定管理员信息 */
    public AdminInfo getAdminById(int id) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	AdminInfo admin=null;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_admin where A_NUM=?");
    		pStmt.setInt(1,id);		
    		rs = pStmt.executeQuery();
	    	if(rs.next()){
	    		admin=new AdminInfo();
	    		admin.setA_ID(rs.getInt("A_ID"));
	    		admin.setA_name(rs.getString("A_NAME"));
	    		admin.setA_num(rs.getLong("A_NUM"));
	    		admin.setA_sex(rs.getInt("A_SEX"));	    		
	    		admin.setA_year(rs.getInt("A_YEAR"));	    		
	    		admin.setA_tel(rs.getLong("A_TEL"));
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取指定管理员信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return admin;
    }
}
