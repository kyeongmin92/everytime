package www.everytime.com.member.model;

import lombok.Data;

@Data
public class Member {
    private String id;
    private String password;
    private String nickname;
    private String email;
    private String academyname;
    private boolean del;   
}
