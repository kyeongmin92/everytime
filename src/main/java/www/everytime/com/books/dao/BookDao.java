package www.everytime.com.books.dao;

import java.util.List;

import www.everytime.com.books.model.Book;
import www.everytime.com.books.model.BookSell;

public interface BookDao {

	void insert(Book book);

	List<Book> selectList(Book book);

	void listinsert(BookSell booksell);

	void fileinsert(String saveFile);

	int imagesupdate(BookSell booksell);

	BookSell select(int listnum);




}
