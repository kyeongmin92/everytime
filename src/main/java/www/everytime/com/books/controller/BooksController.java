package www.everytime.com.books.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import www.everytime.com.books.model.Book;
import www.everytime.com.books.model.BookSell;
import www.everytime.com.books.service.BookService;
import www.everytime.com.member.model.Member;
import www.everytime.com.member.service.MemberService;

@Controller
@RequestMapping("/books/*")
public class BooksController {

	private static final int RESULT_EXCEED_SIZE = -2;
	private static final int RESULT_UNACCEPTED_EXTENSION = -1;
	private static final int RESULT_SUCCESS = 1;
	private static final long LIMIT_SIZE = 10 * 1024 * 1024;

	@Autowired
	private BookService bs;

	@Autowired
	private MemberService ms;

	@RequestMapping("/books")
	public String books() {
		return "/books/books";
	}

	@RequestMapping("/bookSell")
	public String bookSell() {
		
		return "/books/bookSell";
	}
	
	@RequestMapping("/bookListInsert")
	public String bookListInsert(Book book, Model model,HttpSession session) {
		// API 데이터 넣어주기
		bs.insert(book);
		session.getAttribute("listnum");
		return "redirect:/books/bookSellForm";
	}

	@RequestMapping("/bookSellForm")
	public String bookSellForm(Book book, Model model, HttpSession session) {		
		session.setAttribute("listnum", book.getListnum());
		// 멤버 닉네임 받아오기
		String id = (String) session.getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);

		// 데이터 가져오기
		List<Book> booklist = bs.selectList(book);
		
		model.addAttribute("booklist", booklist);

		return "/books/bookSellForm";
	}

	@RequestMapping("/upload") 
	public String upload( @ModelAttribute("book") BookSell booksell, MultipartHttpServletRequest request, 
			@RequestParam("file") MultipartFile[] file ) throws Exception { 
		bs.listinsert(booksell);
		
		//String uploadPath = request.getSession().getServletContext().getRealPath("/"); 
		String uploadPath = "c:\\sh/";
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
		return "redirect:/books/bookSell";
	}
		
	}


