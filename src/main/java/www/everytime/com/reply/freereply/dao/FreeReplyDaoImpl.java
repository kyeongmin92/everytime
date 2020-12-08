package www.everytime.com.reply.freereply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.everytime.com.reply.freereply.model.FreeReply;
import www.everytime.com.reply.freereply.model.FreeReplyRec;

@Repository
public class FreeReplyDaoImpl implements FreeReplyDao{
	@Override
	public int rRecInsert(FreeReplyRec freereplyrec) {
		return sst.insert("freereplyns.rRecInsert", freereplyrec);
	}
	

	@Override
	public int rRecDelete(FreeReplyRec freereplyrec) {
		
		return sst.delete("freereplyns.rRecDelete",freereplyrec);
	}
	

	@Override
	public FreeReplyRec rRecSelect(FreeReplyRec freereplyrec) {
		// TODO Auto-generated method stub
		return sst.selectOne("freereplyns.rRecSelect",freereplyrec);
	}

	@Autowired
	private SqlSessionTemplate sst;
	
	public List<FreeReply> list(FreeReply freereply) {
		return sst.selectList("freereplyns.list", freereply);
	}

	public void insert(FreeReply freereply) {
		sst.insert("freereplyns.insert", freereply);
	}

	public int delete(int frrno) {
		return sst.update("freereplyns.delete",frrno );
	}

	public void update(FreeReply freereply) {
		sst.update("freereplyns.update", freereply);
	}

}
