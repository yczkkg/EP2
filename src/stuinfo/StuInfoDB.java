package stuinfo;
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
import stuinfo.StuInfo;

public class StuInfoDB {
    private Connection con = null;
    /* 获取所有学生信息 */
    public ArrayList<StuInfo> getAll() {
        ResultSet rs=null;
        Statement sql=null;
        ArrayList<StuInfo> stuList=new ArrayList<StuInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * from t_student");
	    	while(rs.next()){
	    		StuInfo student=new StuInfo();
	    		student.setS_ID(rs.getInt("S_ID"));
	    		student.setS_name(rs.getString("S_NAME"));
	    		student.setS_num(rs.getLong("S_NUM"));
	    		student.setS_cls(rs.getString("S_CLS"));	    		
	    		student.setS_gra(rs.getInt("S_GRA"));
	    		student.setS_maj(rs.getString("S_MAJ"));
	    		student.setS_tel(rs.getLong("S_TEL"));
	    		student.setS_gpa(rs.getFloat("S_GPA"));
	    		student.setS_bir(rs.getLong("S_BIR"));
	    		student.setS_sex(rs.getInt("S_SEX"));
	    		stuList.add(student);	    		
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取所有学生信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return stuList;
    }

    /* 添加学生信息 */
    public int insert(StuInfo student) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("insert into t_student (S_NAME,S_NUM,S_CLS,S_GRA,S_MAJ,S_TEL,S_GPA,S_BIR,S_SEX) values (?,?,?,?,?,?,?,?,?)");	
    		pStmt.setString(1,student.getS_name());	
    		pStmt.setLong(2,student.getS_num());	
    		pStmt.setString(3,student.getS_cls());	
    		pStmt.setInt(4,student.getS_gra());	
    		pStmt.setString(5,student.getS_maj());	
    		pStmt.setLong(6,student.getS_tel());	
    		pStmt.setFloat(7,student.getS_gpa());	
    		pStmt.setLong(8,student.getS_bir());	
    		pStmt.setInt(9,student.getS_sex());	
    		count=pStmt.executeUpdate();  
			pStmt.close();
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("添加学生信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }    

    /* 删除指定学生信息 */
    public int delete(int id) {
     	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("delete from  t_student   where S_ID=?");
    		pStmt.setInt(1,id);		
    		count=pStmt.executeUpdate();
    		pStmt.close();    		
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("删除指定学生信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }   
    /* 获取指定学生信息 */
    public StuInfo getStudentById(int id) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	StuInfo student=null;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_student where S_ID=?");
    		pStmt.setInt(1,id);		
    		rs = pStmt.executeQuery();
	    	if(rs.next()){
	    		student=new StuInfo();
	    		student.setS_ID(rs.getInt("S_ID"));
	    		student.setS_name(rs.getString("S_NAME"));
	    		student.setS_num(rs.getLong("S_NUM"));
	    		student.setS_cls(rs.getString("S_CLS"));	    		
	    		student.setS_gra(rs.getInt("S_GRA"));
	    		student.setS_maj(rs.getString("S_MAJ"));
	    		student.setS_tel(rs.getLong("S_TEL"));
	    		student.setS_gpa(rs.getFloat("S_GPA"));
	    		student.setS_bir(rs.getLong("S_BIR"));
	    		student.setS_sex(rs.getInt("S_SEX"));
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("获取指定学生信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return student;
    }
    /*通过学号获取信息 */
    public StuInfo getStudentByNum(int id) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	StuInfo student=null;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_student where S_NUM=?");
    		pStmt.setInt(1,id);		
    		rs = pStmt.executeQuery();
	    	if(rs.next()){
	    		student=new StuInfo();
	    		student.setS_ID(rs.getInt("S_ID"));
	    		student.setS_name(rs.getString("S_NAME"));
	    		student.setS_num(rs.getLong("S_NUM"));
	    		student.setS_cls(rs.getString("S_CLS"));	    		
	    		student.setS_gra(rs.getInt("S_GRA"));
	    		student.setS_maj(rs.getString("S_MAJ"));
	    		student.setS_tel(rs.getLong("S_TEL"));
	    		student.setS_gpa(rs.getFloat("S_GPA"));
	    		student.setS_bir(rs.getLong("S_BIR"));
	    		student.setS_sex(rs.getInt("S_SEX"));
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("通过学号获取信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return student;
    }
    /* 修改学生信息 */
    public int updateStuInfo(StuInfo student) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("update t_student set S_NAME=?,S_NUM=?,S_CLS=?,S_GRA=?,S_MAJ=?,S_TEL=?,S_GPA=?,S_BIR=?,S_SEX=? where S_ID=?");
    		pStmt.setString(1,student.getS_name());	
    		pStmt.setLong(2,student.getS_num());	
    		pStmt.setString(3,student.getS_cls());	
    		pStmt.setInt(4,student.getS_gra());	
    		pStmt.setString(5,student.getS_maj());	
    		pStmt.setLong(6,student.getS_tel());	
    		pStmt.setFloat(7,student.getS_gpa());	
    		pStmt.setLong(8,student.getS_bir());	
    		pStmt.setInt(9,student.getS_sex());	
    		pStmt.setInt(10,student.getS_ID());	
    		count=pStmt.executeUpdate();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("添加学生信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    } 
    /* 通过关键字获取学生信息 */
    public List<StuInfo> getSearch(String zl,String gjz) {
        ResultSet rs=null;
        Statement sql=null;
        List<StuInfo> stuList=new ArrayList<StuInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * from t_student where "+zl+" like'%"+gjz+"%'");
	    	while(rs.next()){
	    		StuInfo student=new StuInfo();
	    		student.setS_ID(rs.getInt("S_ID"));
	    		student.setS_name(rs.getString("S_NAME"));
	    		student.setS_num(rs.getLong("S_NUM"));
	    		student.setS_cls(rs.getString("S_CLS"));	    		
	    		student.setS_gra(rs.getInt("S_GRA"));
	    		student.setS_maj(rs.getString("S_MAJ"));
	    		student.setS_tel(rs.getLong("S_TEL"));
	    		student.setS_gpa(rs.getFloat("S_GPA"));
	    		student.setS_bir(rs.getLong("S_BIR"));
	    		student.setS_sex(rs.getInt("S_SEX"));
	    		stuList.add(student);			
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("通过关键字获取学生信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return stuList;
    }
}

