package www.everytime.com.board.freeboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.everytime.com.board.freeboard.model.FreeBoard;
import www.everytime.com.board.freeboard.model.FreeBoardReadCount;
import www.everytime.com.board.freeboard.model.FreeBoardRec;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao {

	@Autowired
	private SqlSessionTemplate sst;

	public int getTotal(FreeBoard freeboard) {
		return sst.selectOne("freeboardns.getTotal", freeboard);
	}

	public List<FreeBoard> freeBoardList(FreeBoard freeboard) {
		return sst.selectList("freeboardns.freeBoardList", freeboard);
	}

	public FreeBoard select(int fbno) {
		return sst.selectOne("freeboardns.select", fbno);
	}

	public int insert(FreeBoard freeboard) {
		return sst.insert("freeboardns.insert", freeboard);
	}

	public int update(FreeBoard freeboard) {
		return sst.update("freeboardns.update", freeboard);
	}

	public int delete(int fbno) {
		return sst.update("freeboardns.delete", fbno);
	}

	public int recInsert(FreeBoardRec freeboardrec) {
		return sst.insert("freeboardns.recInsert", freeboardrec);
	}

	public int recDelete(FreeBoardRec freeboardrec) {
		return sst.delete("freeboardns.recDelete",freeboardrec);
	}
	public FreeBoardRec recSelect(FreeBoardRec freeboardrec) {
		return sst.selectOne("freeboardns.recSelect", freeboardrec);
	}
	
	public int readCountInsert(FreeBoardReadCount freeboardreadcount) {
		return sst.insert("freeboardns.readCountInsert", freeboardreadcount);
	}
	public FreeBoardReadCount readCountSelect(FreeBoardReadCount freeboardreadcount) {
		return sst.selectOne("freeboardns.readCountSelect",freeboardreadcount);
	}

}
