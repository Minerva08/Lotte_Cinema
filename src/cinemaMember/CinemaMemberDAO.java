package cinemaMember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CinemaMemberDAO {
	private Context init;
	private DataSource ds;
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static CinemaMemberDAO instance = new CinemaMemberDAO();
	
	public CinemaMemberDAO() {
		try {
			init =(Context)new InitialContext();
			ds=(DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.err.println("Naming 예외 : " + e.getMessage());
		}
	}
	
	
	public static CinemaMemberDAO getInstance() {
		return instance;
	}


	public void close() {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(stmt !=null) stmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {}
	}
	
	public CinemaMemberDTO mapping(ResultSet rs){
		CinemaMemberDTO dto = new CinemaMemberDTO();
		try {
			dto.setIdx(rs.getInt("idx"));
			dto.setName(rs.getString("name"));
			dto.setUser_id(rs.getString("user_id"));
			dto.setUser_pw(rs.getString("user_pw"));
			dto.setYear_u(rs.getString("year_u"));
			dto.setMonth_u(rs.getString("Month_u"));
			dto.setDay_u(rs.getString("Day_u"));
			dto.setEmail(rs.getString("email"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	public CinemaMemberDTO login(CinemaMemberDTO user) {
		CinemaMemberDTO login = null;
		String sql ="select * from cinemamember where user_id = ? and user_pw = ?";
	
	try {
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getUser_id());
		pstmt.setString(2, user.getUser_pw());
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			login = mapping(rs);
		}
		
	} catch(SQLException e) {
		System.err.println("login 예외 발생 : " + e);
	} finally { close(); }
	
	return login;
				
	}
	
	public NoMemberDTO nologin(NoMemberDTO user) {
		NoMemberDTO dto = new NoMemberDTO();
		String br = user.getBr1() + "년" +  user.getBr2() + "월" +user.getBr3() + "일";
		dto.setName(user.getName());
		dto.setPh(user.getPh());
		dto.setPw1(user.getPw1());
		dto.setPw2(user.getPw2());
		dto.setBirth(br);
		return dto;
	
	}
	
	public int insertAccount(CinemaMemberDTO user) {
		String sql="insert into cinemaMember(user_id,user_pw,name,year_u,month_u,day_u,email) values(?,?,?,?,?,?,?)";
		int row = 0;
		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUser_id());
			pstmt.setString(2, user.getUser_pw());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getYear_u());
			pstmt.setString(5, user.getMonth_u());
			pstmt.setString(6, user.getDay_u());
			pstmt.setString(7, user.getEmail());
			
			row = pstmt.executeUpdate();
			
			return row;
		} catch (SQLException e) {
			System.err.println("SQL 구문 예외 : " + e.getMessage());
		}finally {close();}
		return 0;
	}

	public String findPw(String user_id, String email) {
	      String user_pw = null;
	      String sql = "select user_pw from cinemamember where user_id = ? and email = ?";
	      try {
	         conn=ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, user_id);
	         pstmt.setString(2, email);
	         
	         ResultSet rs = pstmt.executeQuery();
	         if(rs.next()) {
	            user_pw = rs.getString("user_pw");
	            
	         }
	         } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         }
	      return user_pw;
	
	}
	
	
	public String findId(String name , String email) {
	      String find_id = null;
	      String sql = "select user_id from cinemamember where name =? and email =?";
	      
	      try {
	         conn=ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, name);
	         pstmt.setString(2, email);
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	            find_id = rs.getString("user_id");
	            
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return find_id; 
	   }
	
	public int updatePw(String user_pw ,String user_id) {
	      String randomPassword =UUID.randomUUID().toString().replaceAll("-", "").substring(0, 8);
	      //추가할 열
	      int row=0;
	      //새로운 값
	      String newPw = randomPassword;
	      
	      //Tset_pw() 는 랜덤수 뽑기.
	      
	      
	      //user_pw를 최신화시켜야한다.
	      String sql ="update cinemamember set user_pw=?where user_id=?"; 
	      
	      //연결시킨후 newPw를 로우에 추가시키고 최신화
	      try {
	         conn=ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, newPw);
	         pstmt.setString(2, user_id);
	         row = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         System.err.println("UpdatePw() 예외 : " + e.getMessage());
	      }finally {
	         close();
	      }
	      return row;
	   }
}
