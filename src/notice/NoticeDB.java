package notice;
import java.sql.*;
import common.*;
import notice.NoticeInfo;

public class NoticeDB {
	private Connection con = null;

	/*��ȡָ���û�֪ͨ*/
	public String getNewNotice(String u_num) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	String notice="��������Ϣ";
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_notice where N_NUM=? ORDER BY N_TIME DESC)");
    		pStmt.setString(1,u_num);		
    		rs = pStmt.executeQuery();
	    	if(rs.next()){
	    		notice=rs.getString("N_INFO");
	    		System.out.println(notice);
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡ������Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return notice;
    }
	
    /*���֪ͨ��Ϣ*/
    public int insertnotice(NoticeInfo notice) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
            System.out.println("��ʼ���֪ͨ��Ϣ����");
    		pStmt = con.prepareStatement("insert into t_notice (N_NUM,N_INFO,N_TIME) values (?,?,?)");		
    		pStmt.setString(1,notice.getN_num());		
    		pStmt.setString(2,notice.getN_info());
    		pStmt.setString(3,notice.getN_time());
    		count=pStmt.executeUpdate();  
			pStmt.close();
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("���֪ͨ��Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }    
}
