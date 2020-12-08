package www.everytime.com.reply.freereply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.everytime.com.board.freeboard.model.FreeBoard;
import www.everytime.com.reply.freereply.dao.FreeReplyDao;
import www.everytime.com.reply.freereply.model.FreeReply;
import www.everytime.com.reply.freereply.model.FreeReplyRec;

@Service
public class FreeReplyServiceImpl implements FreeReplyService{
	@Override
	public int rRecInsert(FreeReplyRec freereplyrec) {
		
		return frd.rRecInsert(freereplyrec);
	}

	@Override
	public int rRecDelete(FreeReplyRec freereplyrec) {
		
		return frd.rRecDelete(freereplyrec);
	}

	@Override
	public FreeReplyRec rRecSelect(FreeReplyRec freereplyrec) {
		
		return frd.rRecSelect(freereplyrec);
	}

	@Autowired
	private FreeReplyDao frd;

	public List<FreeReply> list(FreeReply freereply) {
		return frd.list(freereply);
	}

	public void insert(FreeReply freereply) {
		frd.insert(freereply);
	}

	public int delete(int frrno) {
		return frd.delete(frrno);
		
	}

	public void update(FreeReply freereply) {
		frd.update(freereply);
	}
}
