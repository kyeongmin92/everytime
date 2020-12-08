package www.everytime.com.reply.freereply.service;

import java.util.List;

import www.everytime.com.reply.freereply.model.FreeReply;
import www.everytime.com.reply.freereply.model.FreeReplyRec;

public interface FreeReplyService {

	List<FreeReply> list(FreeReply freereply);

	void insert(FreeReply freereply);

	int delete(int frrno);

	void update(FreeReply freereply);
	
	int rRecInsert(FreeReplyRec freereplyrec);
	
	int rRecDelete(FreeReplyRec freereplyrec);
	
	FreeReplyRec rRecSelect(FreeReplyRec freereplyrec);

}
