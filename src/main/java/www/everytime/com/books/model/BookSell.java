package www.everytime.com.books.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BookSell {
	private int listnum; // 번호 FK
	private int sellnum; // 번호 PK
	private String sellprice; // 판매가
	private String contents; // 내용
	private Date regdate; // 날짜
	private String underline; // 밑줄 여부
	private String writing; // 필기 흔적
	private String cover; // 겉표지
	private String nameentry; // 이름 기입
	private String pagecolor; // 페이지 변색
	private String pagestate; // 페이지 훼손
	private String imgfile1; // 이미지1
	private String imgfile2; // 이미지2
	private String imgfile3; // 이미지3
	private String delivery; // 택배
	private String directdeal; // 직거래
	private String location; // 장소
 
	private String images;	// 로컬에 저장된 이미지 이름
	/*
	 * private String map; // 지도
	 */
	// 파일 upload용
	private MultipartFile file; // uplaodForm.jsp에 있는 input name과 동일해야함

}