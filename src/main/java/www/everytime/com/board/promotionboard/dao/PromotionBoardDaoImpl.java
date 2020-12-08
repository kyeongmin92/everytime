package www.everytime.com.board.promotionboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.everytime.com.board.promotionboard.model.PromotionBoard;
import www.everytime.com.board.promotionboard.model.PromotionBoardReadCount;
import www.everytime.com.board.promotionboard.model.PromotionBoardRec;

@Repository
public class PromotionBoardDaoImpl implements PromotionBoardDao {

	@Autowired
	private SqlSessionTemplate sst;

	public int getTotal(PromotionBoard promotionboard) {
		return sst.selectOne("promotionboardns.getTotal", promotionboard);
	}

	public List<PromotionBoard> promotionBoardList(PromotionBoard promotionboard) {
		return sst.selectList("promotionboardns.promotionBoardList", promotionboard);
	}

	public int pbinsert(PromotionBoard promotionboard) {
		return sst.insert("promotionboardns.pbinsert", promotionboard);
	}

	public PromotionBoardReadCount readCountSelect(PromotionBoardReadCount promotionboardreadcount) {
		return sst.selectOne("promotionboardns.readCountSelect", promotionboardreadcount);
	}

	public int readCountInsert(PromotionBoardReadCount promotionboardreadcount) {
		return sst.insert("promotionboardns.readCountInsert", promotionboardreadcount);
	}

	public PromotionBoard select(int pbno) {
		return sst.selectOne("promotionboardns.select", pbno);
	}

	public int update(PromotionBoard promotionboard) {
		return sst.update("promotionboardns.update", promotionboard);
	}

	public int delete(int pbno) {
		return sst.update("promotionboardns.delete", pbno);
	}

	public PromotionBoardRec recSelect(PromotionBoardRec promotionboardrec) {
		return sst.selectOne("promotionboardns.recSelect", promotionboardrec);
	}

	public int recInsert(PromotionBoardRec promotionboardrec) {
		return sst.insert("promotionboardns.recInsert", promotionboardrec);
	}

	public int recDelete(PromotionBoardRec promotionboardrec) {
		return sst.delete("promotionboardns.recDelete", promotionboardrec);
	}

}
