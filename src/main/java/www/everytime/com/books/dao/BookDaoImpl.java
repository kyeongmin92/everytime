package www.everytime.com.books.dao;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.everytime.com.books.model.Book;
import www.everytime.com.books.model.BookSell;

@Repository
public class BookDaoImpl implements BookDao{

	@Autowired
	private SqlSessionTemplate sst;

	public void insert(Book book) {
		sst.insert("bookns.insert", book);
		
	}

	public List<Book> selectList(Book book) {
 		return sst.selectList("bookns.selectList", book);
 	}

	public void listinsert(BookSell booksell) {
		sst.insert("bookns.listinsert", booksell);
	}

	public void fileinsert(String saveFile) {
		sst.insert("bookns.fileinsert", saveFile);
	}

	public int imagesupdate(BookSell booksell) {
		return sst.update("bookns.imagesupdate", booksell);
	}

	public BookSell select(int listnum) {
		return sst.selectOne("bookns.select", listnum);
	}



	
}
