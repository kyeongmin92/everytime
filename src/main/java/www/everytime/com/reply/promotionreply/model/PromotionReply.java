package www.everytime.com.reply.promotionreply.model;

import java.util.Date;

import lombok.Data;

@Data
public class PromotionReply {
	private int prrno;
    private int prbno; 
    private String prnickname;
    private String prcontents;
    private Date prregdate;    
    private boolean prdel;
    
    private int prrecommendation;
}
