package kh.spring.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SnsFilesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(Map<String,Object>param) {
		return mybatis.insert("Sns.file",param );
	}

}
