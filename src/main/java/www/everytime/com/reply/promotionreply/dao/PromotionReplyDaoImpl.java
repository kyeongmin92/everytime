package www.everytime.com.reply.promotionreply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.everytime.com.reply.promotionreply.model.PromotionReply;
import www.everytime.com.reply.promotionreply.model.PromotionReplyRec;

@Repository
public class PromotionReplyDaoImpl implements PromotionReplyDao{
	
	@Autowired
	private SqlSessionTemplate sst;

	public List<PromotionReply> list(PromotionReply promotionreply) {
		return sst.selectList("promotionreplyns.list", promotionreply);
	}

	public int insert(PromotionReply promotionreply) {
		return sst.insert("promotionreplyns.insert", promotionreply);
	}

	public int delete(int prrno) {
		return sst.insert("promotionreplyns.delete", prrno);
	}

	public PromotionReplyRec rRecSelect(PromotionReplyRec promotionreplyrec) {
		return sst.selectOne("promotionreplyns.rRecSelect", promotionreplyrec);
	}

	public int rRecInsert(PromotionReplyRec promotionreplyrec) {
		return sst.insert("promotionreplyns.rRecInsert", promotionreplyrec);
	}

	public int rRecDelete(PromotionReplyRec promotionreplyrec) {
		return sst.delete("promotionreplyns.rRecDelete", promotionreplyrec);
	}
}
