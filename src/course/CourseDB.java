package course;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import common.MyTools;

public class CourseDB {
    private Connection con = null;
    /* ��ȡ���пγ���Ϣ */
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
	    		course.setC_tea(rs.getString("C_TEA"));
	    		course.setC_gra(rs.getInt("C_GRA"));
	    		course.setC_maj(rs.getString("C_MAJ"));
	    		course.setC_cre(rs.getFloat("C_CRE"));
	    		course.setC_type(rs.getInt("C_TYPE"));
	    		course.setC_amount(rs.getInt("C_AMOUNT"));
	    		courseList.add(course);	    		
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡ���пγ���Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return courseList;
    }

    /*��ӿγ���Ϣ*/
    public int insert(CourseInfo course) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
            System.out.println("��ʼ��ӿγ���Ϣ����");
    		pStmt = con.prepareStatement("insert into t_course (C_NAME,C_CLS,C_GRA,C_MAJ,C_CRE,C_TYPE,C_AMOUNT,C_TEA) values (?,?,?,?,?,?,?,?)");	
    		pStmt.setString(1,course.getC_name());	
    		pStmt.setString(2,course.getC_cls());	
    		pStmt.setInt(3,course.getC_gra());		
    		pStmt.setString(4,course.getC_maj());
    		pStmt.setFloat(5,course.getC_cre());
    		pStmt.setInt(6,course.getC_type());
    		pStmt.setInt(7,course.getC_amount());
    		pStmt.setString(8,course.getC_tea());
    		count=pStmt.executeUpdate();  
			pStmt.close();
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ӿγ���Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }    

    /*ɾ���γ���Ϣ */
    public int delete(String list[]) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
	          System.out.println("����ɾ������");
	          for(int i=0;i<list.length;i++){
		          pStmt=con.prepareStatement("delete from t_course where C_ID=?");
	        		pStmt.setInt(1,(MyTools.strToint(list[i])));
		  	        System.out.println("ɾ���γ���Ϣ"+i+"CourseNum:"+list[i]);
	      		count=pStmt.executeUpdate();  
	  			pStmt.close();
		       }
        	
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("ɾ��ѡ����Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }
    /* ��ȡָ���γ���Ϣ */
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
	    		course.setC_tea(rs.getString("C_TEA"));
	    		course.setC_gra(rs.getInt("C_GRA"));
	    		course.setC_maj(rs.getString("C_MAJ"));
	    		course.setC_cre(rs.getFloat("C_CRE"));
	    		course.setC_type(rs.getInt("C_TYPE"));
	    		course.setC_amount(rs.getInt("C_AMOUNT"));
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡָ���γ���Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return course;
    }

    /* �޸Ŀγ���Ϣ */
    public int updateCourse(CourseInfo course) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	System.out.println("�޸Ŀγ���Ϣ�У�");
        	System.out.println(course.getC_ID());
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("update t_course set C_NAME=?,C_CLS=?,C_GRA=?,C_MAJ=?,C_CRE=?,C_TYPE=?,C_AMOUNT=?,C_TEA=? where C_ID=?");
    		pStmt.setString(1,course.getC_name());	
    		pStmt.setString(2,course.getC_cls());
    		pStmt.setInt(3,course.getC_gra());
    		pStmt.setString(4,course.getC_maj());
    		pStmt.setFloat(5,course.getC_cre());
    		pStmt.setInt(6,course.getC_type());
    		pStmt.setInt(7,course.getC_amount());
    		pStmt.setString(8,course.getC_tea());
    		pStmt.setInt(9,course.getC_ID());		
    		count=pStmt.executeUpdate();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("�޸Ŀγ���Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    } 
    /*��ѯ���������γ���Ϣ */
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
            System.out.println("��ѯ���������γ���Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return courseList;
    }
    /* ��ȡָ��ѧ���γ���Ϣ����������רҵ�� */
    public List<CourseInfo> getAllCourseByStuNum(int num) {
        ResultSet rs=null;
        Statement sql=null;
        List<CourseInfo> courseList=new ArrayList<CourseInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * FROM t_course where C_MAJ = (SELECT S_MAJ FROM t_student where S_NUM="+num+")");
	    	while(rs.next()){
	    		CourseInfo course=new CourseInfo();
	    		course.setC_ID(rs.getInt("C_ID"));
	    		course.setC_name(rs.getString("C_NAME"));
	    		course.setC_cls(rs.getString("C_CLS"));
	    		course.setC_tea(rs.getString("C_TEA"));
	    		course.setC_gra(rs.getInt("C_GRA"));
	    		course.setC_maj(rs.getString("C_MAJ"));
	    		course.setC_cre(rs.getFloat("C_CRE"));
	    		courseList.add(course);	    		
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡָ��ѧ���γ���Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return courseList;
    }
    /* ��ȡָ��ѧ����ѡ�γ���Ϣ */
    public List<CourseInfo> getSelectedCourseByStuNum(int num) {
        ResultSet rs=null;
        Statement sql=null;
        List<CourseInfo> courseList=new ArrayList<CourseInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * FROM t_course where C_ID IN (SELECT C_ID FROM t_score where S_NUM="+num+")");
			//System.out.println("��ȡָ��ѧ����ѡ�γ���Ϣ�ɹ���");
	    	while(rs.next()){
	    		CourseInfo course=new CourseInfo();
	    		course.setC_ID(rs.getInt("C_ID"));
	    		course.setC_name(rs.getString("C_NAME"));
	    		course.setC_cls(rs.getString("C_CLS"));
	    		course.setC_tea(rs.getString("C_TEA"));
	    		course.setC_gra(rs.getInt("C_GRA"));
	    		course.setC_maj(rs.getString("C_MAJ"));
	    		course.setC_cre(rs.getFloat("C_CRE"));
	    		courseList.add(course);	    		
	    	}  
			rs.close();
			sql.close();
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡָ��ѧ����ѡ�γ���Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return courseList;
    }
    /* ѧ���ύѡ����Ϣ */
    public int setSelectCourse(String list[],int id) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
	          System.out.println("�����ύ����");
	          for(int i=0;i<list.length;i++){
		          pStmt=con.prepareStatement("insert into t_score (S_NUM,C_ID) values (?,?)");
	        		pStmt.setInt(1,id);
	        		pStmt.setInt(2,(MyTools.strToint(list[i])));
	  	          System.out.println("�ύѡ��"+i+" StuNum:"+id+"  CourseNum:"+list[i]);
	      		count=pStmt.executeUpdate();  
	  			pStmt.close();
		       }
        	
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("�ύѡ����Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }
    /* ѧ��ɾ��ѡ����Ϣ */
    public int deleteCourse(String list[],int id) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
	          System.out.println("����ɾ������");
	          for(int i=0;i<list.length;i++){
		          pStmt=con.prepareStatement("delete from t_score where S_NUM=? AND C_ID=?");
	        		pStmt.setInt(1,id);
	        		pStmt.setInt(2,(MyTools.strToint(list[i])));
		  	        System.out.println("ɾ��ѡ��"+i+" StuNum:"+id+"  CourseNum:"+list[i]);
	      		count=pStmt.executeUpdate();  
	  			pStmt.close();
		       }
        	
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("ɾ��ѡ����Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }
    /* ��ȡָ����ʦ�γ���Ϣ���������̿γ̣� */
    public List<CourseInfo> getAllCourseByTeaNum(int num) {
        ResultSet rs=null;
        Statement sql=null;
        List<CourseInfo> courseList=new ArrayList<CourseInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
	    	rs=sql.executeQuery("SELECT * FROM t_course where C_TEA = (SELECT T_NAME FROM t_teacher where T_NUM="+num+")");
	    	while(rs.next()){
	    		CourseInfo course=new CourseInfo();
	    		course.setC_ID(rs.getInt("C_ID"));
	    		course.setC_name(rs.getString("C_NAME"));
	    		course.setC_cls(rs.getString("C_CLS"));
	    		course.setC_tea(rs.getString("C_TEA"));
	    		course.setC_gra(rs.getInt("C_GRA"));
	    		course.setC_maj(rs.getString("C_MAJ"));
	    		course.setC_cre(rs.getFloat("C_CRE"));
	    		course.setC_type(rs.getInt("C_TYPE"));
	    		course.setC_amount(rs.getInt("C_AMOUNT"));
	    		courseList.add(course);	    		
	    	}  
			rs.close();
			sql.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡָ����ʦ�γ���Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return courseList;
    }

    
}
