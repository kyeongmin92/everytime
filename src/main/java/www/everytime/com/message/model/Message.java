package www.everytime.com.message.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Message {
	
	private int m_num;
	private String m_sender_nick;
	private String m_sender_del;
	private String m_receiver_nick;
	private String m_receiver_del;
	private String m_content;
	private Date m_send_date;
	
	// 페이징용
	private int startRow;
	private int endRow;
	
}

