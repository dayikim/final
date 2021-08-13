package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ProfileFilesDTO;

@Repository
public class ProfileFilesDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 프로필 사진 출력
	public ProfileFilesDTO profileSelect(String sessionID) {
		return mybatis.selectOne("Profile.select",sessionID);
	}

	// 프로필 사진 등록
	public int profileInsert(ProfileFilesDTO dto) {
		return mybatis.insert("Profile.insert", dto);
	}

	// 기존 프로필 사진 삭제
	public int delete(String sessionID) {
		return mybatis.delete("Profile.delete", sessionID);
	}
}
