package teainfo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import stuinfo.StuInfo;
import teainfo.TeaInfo;

public class TeaInfoDB {
    private Connection con = null;
    /* ��ȡ���н�ʦ��Ϣ */
    public ArrayList<TeaInfo> getAll() {
        ResultSet rs=null;
        Statement sql=null;
        ArrayList<TeaInfo> teaList=new ArrayList<TeaInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * from t_teacher");
	    	while(rs.next()){
	    		TeaInfo teacher=new TeaInfo();
	    		teacher.setT_ID(rs.getInt("T_ID"));
	    		teacher.setT_name(rs.getString("T_NAME"));
	    		teacher.setT_num(rs.getLong("T_NUM"));
	    		teacher.setT_sex(rs.getInt("T_SEX"));	    		
	    		teacher.setT_col(rs.getString("T_COL"));
	    		teacher.setT_tel(rs.getLong("T_TEL"));
	    		teaList.add(teacher);	    		
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡ��ʦ��Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return teaList;
    }

    /* ��ӽ�ʦ��Ϣ */
    public int insert(TeaInfo teacher) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("insert into t_teacher (T_NAME,T_NUM,T_SEX,T_COL,T_TEL) values (?,?,?,?,?)");	
    		pStmt.setString(1,teacher.getT_name());	
    		pStmt.setLong(2,teacher.getT_num());	
    		pStmt.setInt(3,teacher.getT_sex());	
    		pStmt.setString(4,teacher.getT_col());	
    		pStmt.setLong(5,teacher.getT_tel());	
    		count=pStmt.executeUpdate();  
			pStmt.close();
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ӽ�ʦʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }    

    /* ɾ����ʦ��Ϣ */
    public int delete(int id) {
     	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("delete from  t_teacher   where T_ID=?");
    		pStmt.setInt(1,id);		
    		count=pStmt.executeUpdate();
    		pStmt.close();    		
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("ɾ����ʦ��Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }   
    /* ��ȡָ����ʦ��Ϣ */
    public TeaInfo getTeacherById(int id) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	TeaInfo teacher=null;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_teacher where T_ID=?");
    		pStmt.setInt(1,id);		
    		rs = pStmt.executeQuery();
	    	if(rs.next()){
	    		teacher=new TeaInfo();
	    		teacher.setT_ID(rs.getInt("T_ID"));
	    		teacher.setT_name(rs.getString("T_NAME"));
	    		teacher.setT_num(rs.getLong("T_NUM"));
	    		teacher.setT_sex(rs.getInt("T_SEX"));	    		
	    		teacher.setT_col(rs.getString("T_COL"));
	    		teacher.setT_tel(rs.getLong("T_TEL"));
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡָ����ʦ��Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return teacher;
    }
    /* ͨ����ʦ��Ż�ȡָ����ʦ��Ϣ */
    public TeaInfo getTeacherByNum(int num) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	TeaInfo teacher=null;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_teacher where T_NUM=?");
    		pStmt.setInt(1,num);		
    		rs = pStmt.executeQuery();
	    	if(rs.next()){
	    		teacher=new TeaInfo();
	    		teacher.setT_ID(rs.getInt("T_ID"));
	    		teacher.setT_name(rs.getString("T_NAME"));
	    		teacher.setT_num(rs.getLong("T_NUM"));
	    		teacher.setT_sex(rs.getInt("T_SEX"));	    		
	    		teacher.setT_col(rs.getString("T_COL"));
	    		teacher.setT_year(rs.getInt("T_YEAR"));
	    		teacher.setT_tel(rs.getLong("T_TEL"));
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡָ����ʦ��Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return teacher;
    }

    /* �޸Ľ�ʦ��Ϣ */
    public int updateTeaInfo(TeaInfo teacher) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("update t_teacher set T_NAME=?,T_NUM=?,T_SEX=?,T_COL=?,T_TEL=?,T_ID=? where T_ID=?");
    		pStmt.setString(1,teacher.getT_name());	
    		pStmt.setLong(2,teacher.getT_num());	
    		pStmt.setInt(3,teacher.getT_sex());	
    		pStmt.setString(4,teacher.getT_col());	
    		pStmt.setLong(5,teacher.getT_tel());	
    		pStmt.setInt(6,teacher.getT_ID());	
    		count=pStmt.executeUpdate();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("�޸Ľ�ʦ��Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    } 
    /* ��ȡ����������ʦ��Ϣ */
    public List<TeaInfo> getSearch(String zl,String gjz) {
        ResultSet rs=null;
        Statement sql=null;
        List<TeaInfo> teaList=new ArrayList<TeaInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * from t_teacher where "+zl+" like'%"+gjz+"%'");
	    	while(rs.next()){
	    		TeaInfo teacher=new TeaInfo();
	    		teacher.setT_ID(rs.getInt("T_ID"));
	    		teacher.setT_name(rs.getString("T_NAME"));
	    		teacher.setT_num(rs.getLong("T_NUM"));
	    		teacher.setT_sex(rs.getInt("T_SEX"));	    		
	    		teacher.setT_col(rs.getString("T_COL"));
	    		teacher.setT_tel(rs.getLong("T_TEL"));
	    		teaList.add(teacher);			
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡ����������ʦ��Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return teaList;
    }
}
