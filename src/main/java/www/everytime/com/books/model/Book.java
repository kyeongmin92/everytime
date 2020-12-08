package www.everytime.com.books.model;

import lombok.Data;

@Data
public class Book {
	private int listnum;
	private String isbn; 		// ISBN
	private String title; 		// 책 제목
	private String authors;		// 저자
	private String publisher;	// 출판사
	private String price;		// 가격
	private String translators;	// 옮긴이
	private String publishdate;	// 출판일
	private String thumbnail; 	// 썸네일
}
