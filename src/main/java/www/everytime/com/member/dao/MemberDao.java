package www.everytime.com.member.dao;

import www.everytime.com.member.model.Member;

public interface MemberDao {

	Member select(String id);

	int insert(Member member);

	int update(Member member);

	int delete(String id);

}
