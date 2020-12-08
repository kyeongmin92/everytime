package www.everytime.com.books.service;



import java.util.List;

import org.springframework.stereotype.Service;

import www.everytime.com.books.model.Book;
import www.everytime.com.books.model.BookSell;

@Service
public interface BookService {

	void insert(Book book);
	
	List<Book> selectList(Book book);

	void listinsert(BookSell booksell);

	void fileinsert(String saveFile);

	int imagesupdate(BookSell booksell);

	BookSell select(int listnum);	
	

}
