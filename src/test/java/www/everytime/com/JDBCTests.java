package www.everytime.com;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	 String server = "localhost"; // MySQL 서버 주소
     String database = "everytime"; // MySQL DATABASE 이름
     String user_name = "everytime"; //  MySQL 서버 아이디
     String password = "everytime"; // MySQL 서버 비밀번호
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database +"?useSSL=false" , user_name,
				password)) {
			log.info(conn);

		} catch (Exception e) {
			fail(e.getMessage());
		}

	}
}