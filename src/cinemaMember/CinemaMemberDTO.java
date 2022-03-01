package cinemaMember;

import java.util.Date;

/*
 * create table cinemamember(	--회원
	idx         number          DEFAULT CINEMAMEMBER_SEQ.nextval PRIMARY key,--회원번호
	name        varchar2(100)   not null, --이름
	user_id     varchar2(500)   unique, --아이디
	user_pw     varchar2(500)   not null, --비밀번호
	year_u        varchar2(10)    not null,
	month_u		varchar2(10)    not null,
	day_u			varchar2(10) 	not null,
	join_date   date            DEFAULT sysdate,--가입일
	email       varchar2(500)   unique --이메일
);
 */
public class CinemaMemberDTO {
	private int idx;
	private String name,user_id,user_pw,email;
	private String year_u,month_u,day_u;
	private Date join_date;
	
	
	public String getYear_u() {
		return year_u;
	}
	public void setYear_u(String year_u) {
		this.year_u = year_u;
	}
	public String getMonth_u() {
		return month_u;
	}
	public void setMonth_u(String month_u) {
		this.month_u = month_u;
	}
	public String getDay_u() {
		return day_u;
	}
	public void setDay_u(String day_u) {
		this.day_u = day_u;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	
	

}
