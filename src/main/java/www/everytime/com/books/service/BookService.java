package www.everytime.com.books.service;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import www.everytime.com.books.model.Book;
import www.everytime.com.books.model.BookSell;
import www.everytime.com.books.model.Books;

@Service
public interface BookService {

	void insert(Book book);
	
	List<Book> selectBookList(Book book);

	void listinsert(BookSell booksell);

	void fileinsert(String saveFile);

	int imagesupdate(BookSell booksell);

	BookSell select(int listnum);

	List<BookSell> selectBookSellList(BookSell booksell);

	List<Books> selectBookSellList(Books books);

	List<Map<Book, BookSell>> selectBookSellList();	
	

}
