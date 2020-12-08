package www.everytime.com.board.promotionboard.service;

import java.util.List;

import www.everytime.com.board.promotionboard.model.PromotionBoard;
import www.everytime.com.board.promotionboard.model.PromotionBoardReadCount;
import www.everytime.com.board.promotionboard.model.PromotionBoardRec;

public interface PromotionBoardService {

	int getTotal(PromotionBoard promotionboard);

	List<PromotionBoard> promotionBoardList(PromotionBoard promotionboard);

	int pbinsert(PromotionBoard promotionboard);

	PromotionBoardReadCount readCountSelect(PromotionBoardReadCount promotionboardreadcount);

	int readCountInsert(PromotionBoardReadCount promotionboardreadcount);

	PromotionBoard select(int pbno);

	int update(PromotionBoard promotionboard);

	int delete(int pbno);

	PromotionBoardRec recSelect(PromotionBoardRec promotionboardrec);

	int recInsert(PromotionBoardRec promotionboardrec);

	int recDelete(PromotionBoardRec promotionboardrec);

	

}
