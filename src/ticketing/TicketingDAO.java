package ticketing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TicketingDAO {
   
   private Context init;
   private DataSource ds;
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   private static TicketingDAO instance = new TicketingDAO();
   
   private TicketingDAO() {
      try {
         init = new InitialContext();
         ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
         
      } catch (NamingException e) {
         System.err.println(getClass().getSimpleName() + " 생성자 예외 발생 : " + e);
      }
   }

   public static TicketingDAO getInstance() {
      return instance;
   }
   
   private void close() {
      try {
         if(rs != null)      rs.close();
         if(pstmt != null)   pstmt.close();
         if(conn != null)    conn.close();
      } catch(SQLException e) {}
   }
   
   private TicketingDTO mapping(ResultSet rs) throws SQLException {
      TicketingDTO dto = new TicketingDTO();
      dto.setUser_id(rs.getString("user_id"));
      dto.setIdx(rs.getInt("idx"));
      dto.setCity(rs.getString("city"));
      dto.setBranch(rs.getString("branch"));
      dto.setMovie_name(rs.getString("movie_name"));
      dto.setRun_house(rs.getString("run_house"));
      dto.setStart_time(rs.getString("start_time"));
      dto.setRun_date(rs.getString("run_date"));
      dto.setPerson_count(rs.getInt("person_count"));
      dto.setSeat1(rs.getString("seat1"));
      dto.setSeat2(rs.getString("seat2"));
      dto.setSeat3(rs.getString("seat3"));
      dto.setSeat4(rs.getString("seat4"));
      
      
      
      return dto;
   }
   
   public int insert_ticket(TicketingDTO data) {
      System.out.println(data);
      int row=0;
      String sql = "insert into ticketing(user_id,city,branch,movie_name,start_time,run_house,run_date,person_count,seat1,seat2,seat3,seat4) values(?,?,?,?,?,?,?,?,?,?,?,?)";
      
      try {
         conn = ds.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, data.getUser_id());
         pstmt.setString(2, data.getCity());
         pstmt.setString(3, data.getBranch());
         pstmt.setString(4, data.getMovie_name());
         pstmt.setString(5, data.getStart_time());
         pstmt.setString(6, data.getRun_house());
         pstmt.setString(7, data.getRun_date());
         pstmt.setInt(8, count_person(data.getSeat1(),data.getSeat2(),data.getSeat3(),data.getSeat4()));
         pstmt.setString(9, data.getSeat1());
         pstmt.setString(10, data.getSeat2());
         pstmt.setString(11, data.getSeat3());
         pstmt.setString(12, data.getSeat4());
         row = pstmt.executeUpdate();
      } catch (SQLException e) {
         System.err.println("insert_ticket 예외 발생 : " + e);
      } finally { close(); }
      return row;
   }
       
   
   public int  count_person(String p1,String p2,String p3,String p4) {
	      int count=4;
	      
	      if(p2.equals("undefined")) {
	         count-=3;
	         return count;
	      }
	      if(p3.equals("undefined")) {
	         count-=2;
	         return count;
	      }
	      if(p4.equals("undefined")) {
	         count-=1;
	         return count;
	      }
	      return count;
	      
	      
	   }
   
   public ArrayList<TicketingDTO>  get_ticket(String userid) {
      ArrayList<TicketingDTO> list= new ArrayList<TicketingDTO>();
      String sql = "select * from ticketing where user_id=?";
      try {
      conn = ds.getConnection();
      pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userid);
        rs=pstmt.executeQuery();
        
        while(rs.next()) {
           list.add(mapping(rs));
        }
      
      } catch (SQLException e) {
            System.err.println("get_ticket 예외 발생 : " + e);
      } finally { close(); }
      
      return list;
      }
      
   }
   