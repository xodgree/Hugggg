package diaryDb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DiaryDBBean {
	//�̱���
	private static DiaryDBBean instance = new DiaryDBBean();	//��ü ����, ���۷������� static ���� -> 1���� ����.
	private DiaryDBBean() {	//������ private���� �����Ͽ� �ۿ��� ��ü ���� �Ұ���.
		
	}
	//��ü�� static���� �����Ͽ� ������ �ʰ� �����ְ� instance ���۷��� ������ ����. �̰� �������ؼ� get���� �������� �ؾ���. 
	public static DiaryDBBean getInstance() {
		return instance;				
	}
	
	//DB���� �޼ҵ�
	public Connection getConnection(){
		//   ����Ÿ��      ����             
		   Connection con = null;			
		   try {
			   //DB�� URL,����ID,PW
		      String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";	
		      String dbUser = "scott";
		      String dbPass = "tiger";
		      
		      // ���÷���(reflection) ���� �ε��� ���� �ڵ�
		      Class.forName("oracle.jdbc.driver.OracleDriver");
		      
		      // DB URL,����, ��й�ȣ�� ������ DB�� �����մϴ�. ���� ����� con�� �����մϴ�.
		      con = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		      
		   // ����(Exception)�� �߻��ϸ� � �������� �ľ��ϱ� ���� �ڵ尡 ���⿡ ���ϴ�.
		   }catch(Exception e) {
		      e.printStackTrace();
		      System.out.println(e.getMessage());
		   }
		   // Exception�� �߻����� �ʾҴٸ� ������ �����Ͽ����ϴ�.
		   // ���� ������ return�մϴ�.
		   return con;
		   }

		//Count ���� �޼ҵ�
		public int getDataCount() {
			String sql = "select nvl(count(*),0) from diary";
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int count = 0;
			try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {count =rs.getInt(1);}
			}catch(Exception e) {
				e.printStackTrace();
				
			}finally {
				close(con,rs,pstmt);
			}
			return count;
		}
		
		// ������ �������� �޼ҵ� (getArticles)
		public List articleList(int startRow,int endRow) {
			// Connection, PreparedStatement, ResultSet �� 
			// DB�� �����Ͽ� �۾��ϱ� ���� �ʿ��� ���۷��� ������ �����մϴ�.
			// ���� 3������ DB �۾��� �ʿ��� �⺻ ��ҵ��Դϴ�.
			Connection conn = null;	//Ŀ�ؼ� ����.
			PreparedStatement pstmt = null; //������ ����.
			ResultSet rs = null;	//select ���� ������ DB�� ��û�� ����� ��.
			
			// Article�� ������ ArrayList ������ �����մϴ�.
			List articleList = null;	
			String sql = "";		//���� �ۼ� ����
			
			try {
				conn = getConnection();		//conn�� getConnection�޼ҵ带 ����. ��, con�� ����.
	           
	           sql = "select * from ("
	        		  +"select rownum rnum, b.* from" 
	        		   +"(select num,regdate,content,image from diary order by regdate desc)b"
	        		   +")where rnum between ? and ?";
	         
	           // Connection�� ������ ����ϰ� PreparedStatement�� �ֽ��ϴ�.
				pstmt = conn.prepareStatement(sql); //pstmt = sql ������ ���� 
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				// PreparedStatement�� ��ϵ� ������ �����մϴ�.
				// Select �����̹Ƿ� ResultSet���� �� ����� ����ϴ�.
				rs = pstmt.executeQuery();
				
				// ResultSet�� �����͸� Ȯ���մϴ�
				
				// ResultSet.next()�� ó�� ����Ǹ� ResultSet�� ������ �ִ� ù��° �����͸� ����ŵ�ϴ�.
				// ���� ResultSet�� ������ �ִ� �����Ͱ� ���ٸ� null�� return�մϴ�.
				if(rs.next()) {
					articleList = new ArrayList();	//null�̾��� articleList�� �迭�� ������. article���� ������� list.
					
					do {
						DiaryDataBean article = new DiaryDataBean(); //���̺� ������ �� �������� ��ü ����.
						
						// ResultSet���� �ʿ��� �����͸� column �̸����� ���� ����ϴ�.
						// ���� �����ʹ� Model�� BoardDataBean ��ü�� setter�� �̿��ؼ� ���� �������ݴϴ�.
						article.setNum(rs.getInt("num"));
						article.setRegdate(rs.getString("regdate"));
						article.setContent(rs.getString("content"));
						article.setImage(rs.getString("image"));
						
						
						// ResultSet�� ������, ��, Article �����Ͱ� BoardDataBean ��ü�� ���޵Ǿ����ϴ�.
						// �տ��� ����� �� BoardDataBean ��ü�� �����ϱ� ���ؼ� �����Ͽ��� ArrayList�� �����մϴ�.
						articleList.add(article);
						//System.out.println(article);
					}while(rs.next());
					// �� ������ ResultSet�� ���̻� �����Ͱ� ���������� ����˴ϴ�.
				}	
				
			}catch (Exception e){
				e.printStackTrace();
			}finally {
				close(conn,rs,pstmt);
				
				//System.out.println(articleList);
			}
			return articleList;
			
			
		}
		
		//ȸ�� ���, ������ ���� �޼ҵ�
		//	���� Ÿ�� void, BoardDataBean type�� article�� �Ű������� ����
		public void insertArticle(DiaryDataBean diary) {
			//������ ������ sql ���� ����
			String sql ="";
			//db�� Ŀ�ؼ� ����.
			Connection con = getConnection();
			//������ ����
			PreparedStatement pstmt = null;
			//����� ������
			ResultSet rs = null;
			int number =0;
			try {
				//Ŀ�ؼ��� �̿��Ͽ� ������ ����. ���� ���� => ������. ������ ����ϸ� num�� 1�� �ڵ� �����ǵ��� ��.
				pstmt = con.prepareStatement("select DIARY_SEQ.nextval from dual");
				rs = pstmt.executeQuery(); //���� �������� rs�� ����.
				
				//ResultSet.next()�� ó�� ����Ǹ� ResultSet�� ������ �ִ� ù��° �����͸� ����ŵ�ϴ�.
				if(rs.next())
					//�����Ͱ� ������ number�� +1�ȴ�.
					number = rs.getInt(1)+1;
				// ���� ResultSet�� ������ �ִ� �����Ͱ� ���ٸ�  number�� 1�̴�.
				else
					number = 1;
			
			
			
			//������ ���� sql���� �ۼ�
			sql = "insert into diary(num,regdate,content,image)"+"values(?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			//������ �� ������ �̿�
			pstmt.setInt(1, number);
		
			pstmt.setString(2, diary.getRegdate());
			
			pstmt.setString(3, diary.getContent());
			
			pstmt.setString(4, diary.getImage());
			
			pstmt.executeUpdate();
			
		}catch(SQLException e1) {
				e1.printStackTrace();
			}finally {
				close(con,rs,pstmt);
			}
		
	}

		private void close(Connection con, ResultSet rs, PreparedStatement pstmt) {
			// TODO Auto-generated method stub
			if(rs != null)
				try {
					rs.close();
				}catch(SQLException ex) {}
			if(pstmt !=null) try {pstmt.close();
				}catch(SQLException ex) {}
			if(con !=null)
				try {
					con.close();
				}catch(SQLException ex) {
			}
		}
		
		//�� ���� �޼ҵ� (getArticle)
		public DiaryDataBean getContent(int num,String chk) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			DiaryDataBean diary = null;
			String sql ="";
			try {
				conn = getConnection();
				sql = "select * from diary where num =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					diary = new DiaryDataBean();
					diary.setNum(rs.getInt("num"));
					diary.setRegdate(rs.getString("regdate"));
					diary.setContent("content");
					diary.setImage(rs.getString("image"));
					//diary.setRegdate(rs.getTimestamp("regdate"));
		
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(conn,rs,pstmt);
			}
			return diary;
			
		}
		
		//�� ���� �޼ҵ�
		public int updatediary(DiaryDataBean diary) {
			Connection conn =null;
			PreparedStatement pstmt = null;
			int pwdck = 0;	//��й�ȣ üũ?
			try {
				conn = getConnection();
				String sql = "update diary set regdate=?,content=?,image=? where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, diary.getRegdate());
				pstmt.setString(2, diary.getContent());
				pstmt.setString(3, diary.getImage());
				pstmt.setInt(4, diary.getNum());
				pwdck = pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(conn,null,pstmt);
			}
			return pwdck;
		}
		
		//���� �޼ҵ�
		public int deletediary(int num,String passwd)throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "delete from diary where num=?";
			//String sql = "delete from diary where num=? and passwd=?";
			//������ ��й�ȣ ���� ���������� �ڱ� ��й�ȣ ġ�� �����ǰ� �ϰ����.
			int x = -1;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,num);
				x = pstmt.executeUpdate();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				close(conn,rs,pstmt);
			}return x;
		}
		

}
