package www.everytime.com.board.freeboard.service;

import java.util.List;

import www.everytime.com.board.freeboard.model.FreeBoard;
import www.everytime.com.board.freeboard.model.FreeBoardReadCount;
import www.everytime.com.board.freeboard.model.FreeBoardRec;

public interface FreeBoardService {

	int getTotal(FreeBoard freeboard);

	List<FreeBoard> freeBoardList(FreeBoard freeboard);

	FreeBoard select(int fbno);

	int insert(FreeBoard freeboard);

	int update(FreeBoard freeboard);

	int delete(int fbno);
	
	int recInsert(FreeBoardRec freeboardrec);
	
	int recDelete(FreeBoardRec freeboardrec);
	
	FreeBoardRec recSelect(FreeBoardRec freeboardrec);
	
	int readCountInsert(FreeBoardReadCount freeboardreadcount);
	
	FreeBoardReadCount readCountSelect(FreeBoardReadCount freeboardreadcout);
}
