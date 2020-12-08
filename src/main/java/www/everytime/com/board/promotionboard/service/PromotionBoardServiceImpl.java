package www.everytime.com.board.promotionboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.everytime.com.board.freeboard.model.FreeBoard;
import www.everytime.com.board.promotionboard.dao.PromotionBoardDao;
import www.everytime.com.board.promotionboard.model.PromotionBoard;
import www.everytime.com.board.promotionboard.model.PromotionBoardReadCount;
import www.everytime.com.board.promotionboard.model.PromotionBoardRec;

@Service
public class PromotionBoardServiceImpl implements PromotionBoardService{
	
	@Autowired
	private PromotionBoardDao pbd;

	public int getTotal(PromotionBoard promotionboard) {	
		return pbd.getTotal(promotionboard);
	}

	public List<PromotionBoard> promotionBoardList(PromotionBoard promotionboard) {
		return pbd.promotionBoardList(promotionboard);
	}

	public int pbinsert(PromotionBoard promotionboard) {
		return pbd.pbinsert(promotionboard);
	}

	public PromotionBoardReadCount readCountSelect(PromotionBoardReadCount promotionboardreadcount) {
		return pbd.readCountSelect(promotionboardreadcount);
	}

	public int readCountInsert(PromotionBoardReadCount promotionboardreadcount) {
		return pbd.readCountInsert(promotionboardreadcount);
	}

	public PromotionBoard select(int pbno) {
		return pbd.select(pbno);
	}

	public int update(PromotionBoard promotionboard) {
		return pbd.update(promotionboard);
	}

	public int delete(int pbno) {
		return pbd.delete(pbno);
	}

	public PromotionBoardRec recSelect(PromotionBoardRec promotionboardrec) {
		return pbd.recSelect(promotionboardrec);
	}

	public int recInsert(PromotionBoardRec promotionboardrec) {
		return pbd.recInsert(promotionboardrec);
	}

	public int recDelete(PromotionBoardRec promotionboardrec) {
		return pbd.recDelete(promotionboardrec);
	}
}
