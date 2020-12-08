package www.everytime.com.member.service;

import www.everytime.com.member.model.Member;

public interface MemberService {

	Member select(String id);

	int insert(Member member);

	int update(Member member);

	int delete(String id);

}
