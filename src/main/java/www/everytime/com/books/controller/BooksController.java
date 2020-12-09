package www.everytime.com.books.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import www.everytime.com.books.dao.BookDao;
import www.everytime.com.books.model.Book;
import www.everytime.com.books.model.BookSell;
import www.everytime.com.books.model.Books;
import www.everytime.com.books.service.BookService;
import www.everytime.com.member.model.Member;
import www.everytime.com.member.service.MemberService;
import www.everytime.com.message.service.MessageService;

@Controller
@RequestMapping("/books/*")
public class BooksController {
	
	@Autowired
	private BookService bs;

	@Autowired
	private MemberService ms;
	
	@Autowired
	private MessageService msg;
	
	@Autowired
	private BookDao dao;
	

	@RequestMapping("/books")
	public String books(Model model) {
		
//		List<BookSell> booklist = bs.selectBookSellList(booksell);
//		List<Books> booklist = bs.selectBookSellList(books);
//		dao = session.getMapper(dao.getClass());
		List<Map<Book, BookSell>> booklist = bs.selectBookSellList();
		model.addAttribute("booklist", booklist);
	
		
		
		return "/books/books";
	}

	@RequestMapping("/bookSell")
	public String bookSell() {
		return "/books/bookSell";
	}

	@RequestMapping("/bookSellForm")
	public String bookSellForm(Book book, Model model, HttpSession session) {
		// API 데이터 넣어주기
		bs.insert(book);		
		
		// 멤버 닉네임 받아오기
		String id = (String) session.getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);

		// 선택한 데이터 가져오기
		List<Book> booklist = bs.selectBookList(book);
		
		model.addAttribute("booklist", booklist);

		return "/books/bookSellForm";
	}

	@RequestMapping("/upload") 
	public String upload( @ModelAttribute("book") BookSell booksell, MultipartHttpServletRequest request, 
			@RequestParam("file") MultipartFile[] file ) throws Exception { 
		bs.listinsert(booksell);
		
		//String uploadPath = request.getSession().getServletContext().getRealPath("/"); 
		String uploadPath = "/sh/";
		String fileOriginName = ""; 
		String fileMultiName = ""; 
		for(int i=0; i<file.length; i++) { 
		fileOriginName = file[i].getOriginalFilename();
		
		System.out.println("기존 파일명 : "+fileOriginName); 

		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();
		String fileName =  (uid +"_" +fileOriginName);
		System.out.println("변경된 파일명 : "+fileName); 
		if(file[i].isEmpty()==false) {			
			File f = new File(uploadPath+fileName);
			file[i].transferTo(f);
		} else {
			uploadPath ="";
			fileName = "";			
		}

		if(i==0) { 
			fileMultiName += uploadPath+fileName;
			booksell.setImages(fileMultiName);
		} else {
			fileMultiName += ","+uploadPath+fileName; 
			booksell.setImages(fileMultiName);
		}
		
		} 
		
		System.out.println("*"+fileMultiName); 		
		
		return "/books/upload"; 
	}
	
	@RequestMapping("/imageNameUpdate")
	public String imageNameUpdate(BookSell booksell,Model model) {
		
		int result=0;
		result = bs.imagesupdate(booksell);		
		
		model.addAttribute("booksell", booksell);		
		model.addAttribute("result", result);
		return "/books/imageNameUpdate";
	}
		
	}


