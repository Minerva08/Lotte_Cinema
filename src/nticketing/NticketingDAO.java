package nticketing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import ticketing.TicketingDTO;


public class NticketingDAO {
	private Context init;
	   private DataSource ds;
	   private Connection conn;
	   private PreparedStatement pstmt;
	   private ResultSet rs;
	   private static NticketingDAO instance = new NticketingDAO();
	   
	   private NticketingDAO() {
	      try {
	         init = new InitialContext();
	         ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
	         
	      } catch (NamingException e) {
	         System.err.println(getClass().getSimpleName() + " 생성자 예외 발생 : " + e);
	      }
	   }

	   public static NticketingDAO getInstance() {
	      return instance;
	   }
	   
	   private void close() {
	      try {
	         if(rs != null)      rs.close();
	         if(pstmt != null)   pstmt.close();
	         if(conn != null)    conn.close();
	      } catch(SQLException e) {}
	   }
	   
	   
	   private NticketingDTO mapping(ResultSet rs) throws SQLException {
		   NticketingDTO dto = new NticketingDTO();
			   dto.setPnum(rs.getString("pnum"));
			   dto.setCheck_pw(rs.getString("check_pw"));
			   dto.setCity(rs.getString("city"));
			   dto.setBranch(rs.getString("branch"));
			   dto.setMovie_name(rs.getString("movie_name"));
			   dto.setRun_house(rs.getString("run_house"));
			   dto.setStart_time(rs.getString("start_time"));
			   dto.setRun_date(rs.getString("run_date"));
			   dto.setSeat1(rs.getString("seat1"));
			   dto.setSeat2(rs.getString("seat2"));
			   dto.setSeat3(rs.getString("seat3"));
			   dto.setSeat4(rs.getString("seat4"));
			   dto.setPerson_count(rs.getInt("person_count"));
			   dto.setName(rs.getString("name"));
		     return dto;
		   }
		   
	   public int insert_Nticket(NticketingDTO data) {
           System.out.println("insert_Nticket : "+data);
           int row=0;
           String sql = "insert into Nticketing values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
           
           try {
              conn = ds.getConnection();
              pstmt = conn.prepareStatement(sql);
              pstmt.setString(1, data.getPnum());
              pstmt.setString(2, data.getCheck_pw());
              pstmt.setString(3, data.getCity());
              pstmt.setString(4, data.getBranch());
              pstmt.setString(5, data.getMovie_name());
              pstmt.setString(6, data.getRun_house());
              pstmt.setString(7, data.getStart_time());
              pstmt.setString(8, data.getRun_date());
              pstmt.setString(9, data.getSeat1());
              pstmt.setString(10, data.getSeat2());
              pstmt.setString(11, data.getSeat3());
              pstmt.setString(12, data.getSeat4());
              pstmt.setInt(13, count_person(data.getSeat1(),data.getSeat2(),data.getSeat3(),data.getSeat4()));
              pstmt.setString(14, data.getName());
              row = pstmt.executeUpdate();
           } catch (SQLException e) {
              System.err.println("insert_Nticket 예외 발생 : " + e);
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
		   
		   public ArrayList<NticketingDTO>  get_Nticket(String check_pw,String pnum) {
		      ArrayList<NticketingDTO> list= new ArrayList<NticketingDTO>();
		      String sql = "select * from nticketing where check_pw=? and pnum=?";
		      
		      try {
			      conn = ds.getConnection();
			      pstmt = conn.prepareStatement(sql);
			      pstmt.setString(1, check_pw);
			      pstmt.setString(2, pnum);
			      rs=pstmt.executeQuery();
		        
		        while(rs.next()) {
		        System.out.println(mapping(rs));
		           list.add(mapping(rs));
		        }
		      
		      } catch (SQLException e) {
		            System.err.println("get_Nticket 예외 발생 : " + e);
		      } finally { close(); }
		      
		      return list;
		      }
		      
		   public NticketingDTO  get_Nticket1(String check_pw,String pnum) {
			      NticketingDTO dto = null;
			      String sql = "select * from nticketing where check_pw=? and pnum=?";
			      
			      try {
				      conn = ds.getConnection();
				      pstmt = conn.prepareStatement(sql);
				      pstmt.setString(1, check_pw);
				      pstmt.setString(2, pnum);
				      rs=pstmt.executeQuery();
			        
			        while(rs.next()) {
			        System.out.println(mapping(rs));
			           dto = mapping(rs);
			        }
			      
			      } catch (SQLException e) {
			            System.err.println("get_Nticket 예외 발생 : " + e);
			      } finally { close(); }
			      
			      return dto;
			      }
	  

    
 }
