package www.everytime.com.reply.promotionreply.dao;

import java.util.List;

import www.everytime.com.reply.promotionreply.model.PromotionReply;
import www.everytime.com.reply.promotionreply.model.PromotionReplyRec;

public interface PromotionReplyDao {

	List<PromotionReply> list(PromotionReply promotionreply);

	int insert(PromotionReply promotionreply);

	int delete(int prrno);

	PromotionReplyRec rRecSelect(PromotionReplyRec promotionreplyrec);

	int rRecInsert(PromotionReplyRec promotionreplyrec);

	int rRecDelete(PromotionReplyRec promotionreplyrec);

}
