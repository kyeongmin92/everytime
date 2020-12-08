package www.everytime.com.message.service;

import java.util.List;

import www.everytime.com.message.model.Message;

public interface MessageService {

	int insert(Message message);

	List<Message> reclist(Message message);
	
	List<Message> sendlist(Message message);

	int getTotal(Message message);

	int getTotal_r(Message message);

	int delete(int m_num);

	int delete2(int m_num);

}
