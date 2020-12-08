package www.everytime.com.reply.promotionreply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.everytime.com.reply.promotionreply.dao.PromotionReplyDao;
import www.everytime.com.reply.promotionreply.model.PromotionReply;
import www.everytime.com.reply.promotionreply.model.PromotionReplyRec;

@Service
public class PromotionReplyServiceImpl implements PromotionReplyService{
	
	@Autowired
	private PromotionReplyDao prd;

	public List<PromotionReply> list(PromotionReply promotionreply) {
		return prd.list(promotionreply);
	}

	public int insert(PromotionReply promotionreply) {
		return prd.insert(promotionreply);
	}

	public int delete(int prrno) {
		return prd.delete(prrno);
	}

	public PromotionReplyRec rRecSelect(PromotionReplyRec promotionreplyrec) {
		return prd.rRecSelect(promotionreplyrec);
	}

	public int rRecInsert(PromotionReplyRec promotionreplyrec) {
		return prd.rRecInsert(promotionreplyrec);
	}

	public int rRecDelete(PromotionReplyRec promotionreplyrec) {
		return prd.rRecDelete(promotionreplyrec);
	}
}
