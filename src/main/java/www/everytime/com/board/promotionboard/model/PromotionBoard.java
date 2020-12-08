package www.everytime.com.board.promotionboard.model;

import java.util.Date;

import lombok.Data;
@Data
public class PromotionBoard {
	private int pbno;
    private String pnickname;
    private String ptitle;
    private String pcontents;	
    private Date pregdate;
    private boolean pdel;
    
    private int preadcount;
    private int precommendation;
    private int pcommentCount;
    
	//페이징용
	private int startRow;
	private int endRow;
	
	//검색용
	private String search;
	private String keyword;
	
}
