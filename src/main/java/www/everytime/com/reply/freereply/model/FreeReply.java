package www.everytime.com.reply.freereply.model;

import java.util.Date;

import lombok.Data;

@Data
public class FreeReply {
	private int frrno;
    private int frbno; 
    private String frnickname;
    private String frcontents;
    private Date frregdate;    
    private boolean frdel;
    
    private int frrecommendation;
}
