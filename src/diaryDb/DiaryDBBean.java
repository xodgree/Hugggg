package diaryDb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DiaryDBBean {
	//싱글톤
	private static DiaryDBBean instance = new DiaryDBBean();	//객체 생성, 레퍼런스변수 static 설정 -> 1개로 공유.
	private DiaryDBBean() {	//생성자 private으로 설정하여 밖에서 객체 생성 불가능.
		
	}
	//객체를 static으로 정의하여 만들지 않고 쓸수있고 instance 레퍼런스 변수도 동일. 이걸 쓰기위해선 get으로 가져오게 해야함. 
	public static DiaryDBBean getInstance() {
		return instance;				
	}
	
	//DB연결 메소드
	public Connection getConnection(){
		//   리턴타입      변수             
		   Connection con = null;			
		   try {
			   //DB의 URL,계정ID,PW
		      String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";	
		      String dbUser = "scott";
		      String dbPass = "tiger";
		      
		      // 리플렌션(reflection) 동적 로딩에 대한 코드
		      Class.forName("oracle.jdbc.driver.OracleDriver");
		      
		      // DB URL,계정, 비밀번호를 가지고 DB에 접속합니다. 접속 결과를 con에 저장합니다.
		      con = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		      
		   // 예외(Exception)가 발생하면 어떤 문제인지 파악하기 위한 코드가 여기에 들어갑니다.
		   }catch(Exception e) {
		      e.printStackTrace();
		      System.out.println(e.getMessage());
		   }
		   // Exception이 발생하지 않았다면 무사히 접속하였습니다.
		   // 접속 정보를 return합니다.
		   return con;
		   }

		//Count 세는 메소드
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
		
		// 데이터 가져오는 메소드 (getArticles)
		public List articleList(int startRow,int endRow) {
			// Connection, PreparedStatement, ResultSet 등 
			// DB에 접속하여 작업하기 위해 필요한 레퍼런스 변수를 선언합니다.
			// 위의 3가지는 DB 작업에 필요한 기본 요소들입니다.
			Connection conn = null;	//커넥션 정보.
			PreparedStatement pstmt = null; //쿼리를 담음.
			ResultSet rs = null;	//select 쿼리 날리면 DB에 요청한 결과를 줌.
			
			// Article을 저장할 ArrayList 변수를 선언합니다.
			List articleList = null;	
			String sql = "";		//쿼리 작성 변수
			
			try {
				conn = getConnection();		//conn에 getConnection메소드를 넣음. 즉, con을 넣음.
	           
	           sql = "select * from ("
	        		  +"select rownum rnum, b.* from" 
	        		   +"(select num,regdate,content,image from diary order by regdate desc)b"
	        		   +")where rnum between ? and ?";
	         
	           // Connection에 쿼리를 등록하고 PreparedStatement에 넣습니다.
				pstmt = conn.prepareStatement(sql); //pstmt = sql 쿼리를 담음 
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				// PreparedStatement로 등록된 쿼리를 실행합니다.
				// Select 쿼리이므로 ResultSet으로 그 결과를 얻습니다.
				rs = pstmt.executeQuery();
				
				// ResultSet의 데이터를 확인합니다
				
				// ResultSet.next()는 처음 실행되면 ResultSet이 가지고 있는 첫번째 데이터를 가리킵니다.
				// 만약 ResultSet이 가지고 있는 데이터가 없다면 null을 return합니다.
				if(rs.next()) {
					articleList = new ArrayList();	//null이었던 articleList에 배열을 생성함. article들을 담기위한 list.
					
					do {
						DiaryDataBean article = new DiaryDataBean(); //테이블 변수에 값 설정위해 객체 생성.
						
						// ResultSet에서 필요한 데이터를 column 이름으로 각각 얻습니다.
						// 얻은 데이터는 Model인 BoardDataBean 객체의 setter를 이용해서 값을 설정해줍니다.
						article.setNum(rs.getInt("num"));
						article.setRegdate(rs.getString("regdate"));
						article.setContent(rs.getString("content"));
						article.setImage(rs.getString("image"));
						
						
						// ResultSet의 데이터, 즉, Article 데이터가 BoardDataBean 객체로 전달되었습니다.
						// 앞에서 만들어 둔 BoardDataBean 객체를 보관하기 위해서 생성하였던 ArrayList에 저장합니다.
						articleList.add(article);
						//System.out.println(article);
					}while(rs.next());
					// 이 과정은 ResultSet에 더이상 데이터가 없을때까지 진행됩니다.
				}	
				
			}catch (Exception e){
				e.printStackTrace();
			}finally {
				close(conn,rs,pstmt);
				
				//System.out.println(articleList);
			}
			return articleList;
			
			
		}
		
		//회원 등록, 데이터 삽입 메소드
		//	리턴 타입 void, BoardDataBean type의 article을 매개변수로 받음
		public void insertArticle(DiaryDataBean diary) {
			//쿼리를 저장할 sql 변수 선언
			String sql ="";
			//db와 커넥션 해줌.
			Connection con = getConnection();
			//쿼리를 담음
			PreparedStatement pstmt = null;
			//결과를 보여줌
			ResultSet rs = null;
			int number =0;
			try {
				//커넥션을 이용하여 쿼리를 담음. 쿼리 내용 => 시퀀스. 데이터 등록하면 num이 1씩 자동 증가되도록 함.
				pstmt = con.prepareStatement("select DIARY_SEQ.nextval from dual");
				rs = pstmt.executeQuery(); //쿼리 내보낸걸 rs에 담음.
				
				//ResultSet.next()는 처음 실행되면 ResultSet이 가지고 있는 첫번째 데이터를 가리킵니다.
				if(rs.next())
					//데이터가 있으면 number은 +1된다.
					number = rs.getInt(1)+1;
				// 만약 ResultSet이 가지고 있는 데이터가 없다면  number은 1이다.
				else
					number = 1;
			
			
			
			//데이터 삽입 sql쿼리 작성
			sql = "insert into diary(num,regdate,content,image)"+"values(?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			//위에서 쓴 시퀀스 이용
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
		
		//글 보기 메소드 (getArticle)
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
		
		//글 수정 메소드
		public int updatediary(DiaryDataBean diary) {
			Connection conn =null;
			PreparedStatement pstmt = null;
			int pwdck = 0;	//비밀번호 체크?
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
		
		//삭제 메소드
		public int deletediary(int num,String passwd)throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "delete from diary where num=?";
			//String sql = "delete from diary where num=? and passwd=?";
			//지금은 비밀번호 없이 삭제되지만 자기 비밀번호 치면 삭제되게 하고싶음.
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
