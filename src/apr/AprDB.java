package apr;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import common.MyTools;


public class AprDB {
    private Connection con = null;

	/*添加学生请假信息*/
	public int insertapr(AprInfo apr) {
		PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
            System.out.println("开始添加请假信息……");
    		pStmt = con.prepareStatement("insert into t_apr (STARTDATE,ENDDATE,S_NUM,T_NUM,C_NUM,REASON,AGREE) values (?,?,?,?,?,?,?)");	
    		pStmt.setFloat(1,apr.getStartDate());
    		pStmt.setFloat(2,apr.getEndDate());
    		pStmt.setInt(3,apr.getStuNum());	
    		pStmt.setInt(4,apr.getTeaNum());	
    		pStmt.setInt(5,apr.getCourseNum());	
    		pStmt.setString(6,apr.getReason());
    		pStmt.setInt(7,apr.getAgree());	
    		count=pStmt.executeUpdate();  
			pStmt.close();
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("添加请假信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
	}
	
	/*获取所有请假信息*/
	public ArrayList<AprInfo> getAllapr() {
        ResultSet rs=null;
        Statement sql=null;
        ArrayList<AprInfo> aprList=new ArrayList<AprInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * from t_apr");
	    	while(rs.next()){
	    		AprInfo apr=new AprInfo();
	    		apr.setA_ID(rs.getInt("A_ID"));
	    		apr.setStartDate(rs.getFloat("STARTDATE"));
	    		apr.setEndDate(rs.getFloat("ENDDATE"));
	    		apr.setStuNum(rs.getInt("S_NUM"));
	    		apr.setTeaNum(rs.getInt("T_NUM"));
	    		apr.setCourseNum(rs.getInt("C_NUM"));
	    		apr.setReason(rs.getString("REASON"));
	    		apr.setAgree(rs.getInt("AGREE"));
	    		aprList.add(apr);	    		
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取所有请假信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return aprList;
    }
	
	/*获取指定学生请假信息*/
    public List<AprInfo> getAprByStuNum(int num) {
        ResultSet rs=null;
        Statement sql=null;
        List<AprInfo> aprList=new ArrayList<AprInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * FROM t_apr where S_NUM="+num+"");
	    	while(rs.next()){
	    		AprInfo apr=new AprInfo();
	    		apr.setA_ID(rs.getInt("A_ID"));
	    		apr.setStartDate(rs.getFloat("STARTDATE"));
	    		apr.setEndDate(rs.getFloat("ENDDATE"));
	    		apr.setStuNum(rs.getInt("S_NUM"));
	    		apr.setTeaNum(rs.getInt("T_NUM"));
	    		apr.setCourseNum(rs.getInt("C_NUM"));
	    		apr.setReason(rs.getString("REASON"));
	    		apr.setAgree(rs.getInt("AGREE"));
	    		aprList.add(apr);	    		
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取指定学生请假信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return aprList;
    }
	/*获取指定教师请假信息*/
    public List<AprInfo> getAprByTeaNum(int num) {
        ResultSet rs=null;
        Statement sql=null;
        List<AprInfo> aprList=new ArrayList<AprInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * FROM t_apr where T_NUM="+num+"");
	    	while(rs.next()){
	    		AprInfo apr=new AprInfo();
	    		apr.setA_ID(rs.getInt("A_ID"));
	    		apr.setStartDate(rs.getFloat("STARTDATE"));
	    		apr.setEndDate(rs.getFloat("ENDDATE"));
	    		apr.setStuNum(rs.getInt("S_NUM"));
	    		apr.setTeaNum(rs.getInt("T_NUM"));
	    		apr.setCourseNum(rs.getInt("C_NUM"));
	    		apr.setReason(rs.getString("REASON"));
	    		apr.setAgree(rs.getInt("AGREE"));
	    		aprList.add(apr);	    		
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取指定教师请假信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return aprList;
    }
    /*删除请假信息 */
    public int deleteapr(String list[]) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
	          System.out.println("正在删除请假信息……");
	          for(int i=0;i<list.length;i++){
		          pStmt=con.prepareStatement("delete from t_apr where A_ID=?");
	        		pStmt.setInt(1,(MyTools.strToint(list[i])));
		  	        System.out.println("删除请假信息"+i+"A_ID:"+list[i]);
	      		count=pStmt.executeUpdate();  
	  			pStmt.close();
		       }
        	
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("删除请假信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }
    /*查询符合条件请假信息 */
    public List<AprInfo> getSearch(String zl,String gjz) {
        ResultSet rs=null;
        Statement sql=null;
        List<AprInfo> aprList=new ArrayList<AprInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * from t_apr where "+zl+" like'%"+gjz+"%'");
	    	while(rs.next()){
	    		AprInfo apr=new AprInfo();
	    		apr.setA_ID(rs.getInt("A_ID"));
	    		apr.setStartDate(rs.getFloat("STARTDATE"));
	    		apr.setEndDate(rs.getFloat("ENDDATE"));
	    		apr.setStuNum(rs.getInt("S_NUM"));
	    		apr.setTeaNum(rs.getInt("T_NUM"));
	    		apr.setCourseNum(rs.getInt("C_NUM"));
	    		apr.setReason(rs.getString("REASON"));
	    		apr.setAgree(rs.getInt("AGREE"));
	    		aprList.add(apr);	   		
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("查询符合条件请假信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return aprList;
    }
    
}
