package www.everytime.com.books.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.everytime.com.books.dao.BookDao;
import www.everytime.com.books.model.Book;
import www.everytime.com.books.model.BookSell;

@Service
public class BookServiceImpl implements BookService{

	@Autowired
	private BookDao bd;
	
	public void insert(Book book) {
		bd.insert(book);
		
	}
	
	public List<Book> selectList(Book book) {
 		return bd.selectList(book);
 	}

	public void listinsert(BookSell booksell) {
		bd.listinsert(booksell);
	}

	public void fileinsert(String saveFile) {
		bd.fileinsert(saveFile);
		
	}

	public int imagesupdate(BookSell booksell) {
		return bd.imagesupdate(booksell);
	}

	public BookSell select(int listnum) {
		return bd.select(listnum);
	}


}
