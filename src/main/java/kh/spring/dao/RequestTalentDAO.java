package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.RequestTalentDTO;

@Component
public class RequestTalentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public int boardWrite(RequestTalentDTO dto) {
		return mybatis.insert("Requesttalent.write",dto);
	}

	public RequestTalentDTO detailView(int seq) {
		return  mybatis.selectOne("Requesttalent.detailView",seq);
	}

	public int getSeq(){
		return mybatis.selectOne("Requesttalent.getSeq");
	}
	public List<RequestTalentDTO> getAllList() {
		return mybatis.selectList("Requesttalent.getAllList");

	}
	public int delete(int seq) {
		return mybatis.delete("Requesttalent.delete",seq);
	}


}
