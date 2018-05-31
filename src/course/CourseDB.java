package course;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import course.CourseInfo;

public class CourseDB {
    private Connection con = null;
    /* 获取所有课程信息 */
    public ArrayList<CourseInfo> getAll() {
        ResultSet rs=null;
        Statement sql=null;
        ArrayList<CourseInfo> courseList=new ArrayList<CourseInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * from t_course");
	    	while(rs.next()){
	    		CourseInfo course=new CourseInfo();
	    		course.setC_ID(rs.getInt("C_ID"));
	    		course.setC_name(rs.getString("C_NAME"));
	    		course.setC_cls(rs.getString("C_CLS"));
	    		course.setC_gra(rs.getInt("C_GRA"));
	    		course.setC_maj(rs.getString("C_MAJ"));
	    		course.setC_cre(rs.getFloat("C_CRE"));
	    		courseList.add(course);	    		
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取所有课程信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return courseList;
    }

    /*添加课程信息*/
    public int insert(CourseInfo course) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("insert into t_course (C_NAME,C_CLS,C_GRA,C_MAJ,C_CRE) values (?,?,?,?,?)");	
    		pStmt.setString(1,course.getC_name());	
    		pStmt.setString(2,course.getC_cls());	
    		pStmt.setInt(3,course.getC_gra());		
    		pStmt.setString(4,course.getC_maj());
    		pStmt.setFloat(5,course.getC_cre());	
    		count=pStmt.executeUpdate();  
			pStmt.close();
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("添加课程信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }    

    /* 删除课程信息 */
    public int delete(int id) {
     	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("delete from  t_course   where C_ID=?");
    		pStmt.setInt(1,id);		
    		count=pStmt.executeUpdate();
    		pStmt.close();    		
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("删除课程信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }   
    /* 获取指定课程信息 */
    public CourseInfo getCourseById(int id) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	CourseInfo course=null;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_course where C_ID=?");
    		pStmt.setInt(1,id);		
    		rs = pStmt.executeQuery();
	    	if(rs.next()){
	    		course=new CourseInfo();
	    		course.setC_ID(rs.getInt("C_ID"));
	    		course.setC_name(rs.getString("C_NAME"));
	    		course.setC_cls(rs.getString("C_CLS"));
	    		course.setC_gra(rs.getInt("C_GRA"));
	    		course.setC_maj(rs.getString("C_MAJ"));
	    		course.setC_cre(rs.getFloat("C_CRE"));
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取指定课程信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return course;
    }

    /* 修改课程信息 */
    public int updateCourse(CourseInfo course) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("update t_course set C_NAME=?,C_CLS=?,C_GRA=?,C_MAJ=?,C_CRE=? where C_ID=?");
    		pStmt.setString(1,course.getC_name());	
    		pStmt.setString(2,course.getC_cls());
    		pStmt.setInt(3,course.getC_gra());
    		pStmt.setString(4,course.getC_maj());
    		pStmt.setFloat(5,course.getC_cre());	    		
    		pStmt.setInt(6,course.getC_ID());		
    		count=pStmt.executeUpdate();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("修改课程信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    } 
    /*获取符合条件课程信息 */
    public List<CourseInfo> getSearch(String zl,String gjz) {
        ResultSet rs=null;
        Statement sql=null;
        List<CourseInfo> courseList=new ArrayList<CourseInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * from t_course where "+zl+" like'%"+gjz+"%'");
	    	while(rs.next()){
	    		CourseInfo course=new CourseInfo();
	    		course.setC_ID(rs.getInt("C_ID"));
	    		course.setC_name(rs.getString("C_NAME"));
	    		course.setC_cls(rs.getString("C_CLS"));
	    		course.setC_gra(rs.getInt("C_GRA"));
	    		course.setC_maj(rs.getString("C_MAJ"));
	    		course.setC_cre(rs.getFloat("C_CRE"));
	    		courseList.add(course);	    		
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取符合条件课程信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return courseList;
    }
    
}
