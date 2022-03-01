package nticketing;

public class NticketingDTO {
//	create table Nticketing(
//		pnum    varchar2(20)   not null,
//		check_pw varchar2(50)   not null,
//		city    varchar2(50)    not null,--예매 지역
//			branch  varchar2(50)   not null,--예매 지점
//			movie_name  varchar2(500) not null,--예매 영화이름
//			run_house   varchar2(5) not null,--예매 영화 관
//			start_time  varchar2(10) not null,--예매 영화 시작시간
//			run_date    varchar2(10) not null,--예매 날짜
//			seat1    varchar2(10)    not null,
//			seat2    varchar2(10)  ,
//			seat3    varchar2(10)  , 
//			seat4    varchar2(10)  , 
//			person_count    number  not null
//	);
	
	private String pnum,check_pw, city, branch,movie_name,run_house,
			start_time,run_date,seat1,seat2,seat3,seat4,name;
	private int person_count;

	
	@Override
		public String toString() {
			// TODO Auto-generated method stub
			return String.format("%s %s %s %s %s %s %s %s %s %s %s %s %s %d", pnum, check_pw, city, branch,movie_name,run_house,start_time,run_date,seat1,seat2,seat3,seat4,name, person_count);
		}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getCheck_pw() {
		return check_pw;
	}

	public void setCheck_pw(String check_pw) {
		this.check_pw = check_pw;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public String getRun_house() {
		return run_house;
	}

	public void setRun_house(String run_house) {
		this.run_house = run_house;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getRun_date() {
		return run_date;
	}

	public void setRun_date(String run_date) {
		this.run_date = run_date;
	}

	public String getSeat1() {
		return seat1;
	}

	public void setSeat1(String seat1) {
		this.seat1 = seat1;
	}

	public String getSeat2() {
		return seat2;
	}

	public void setSeat2(String seat2) {
		this.seat2 = seat2;
	}

	public String getSeat3() {
		return seat3;
	}

	public void setSeat3(String seat3) {
		this.seat3 = seat3;
	}

	public String getSeat4() {
		return seat4;
	}

	public void setSeat4(String seat4) {
		this.seat4 = seat4;
	}
	public int getPerson_count() {
		return person_count;
	}
	public void setPerson_count(int person_count) {
		this.person_count = person_count;
	}

	
	
}
