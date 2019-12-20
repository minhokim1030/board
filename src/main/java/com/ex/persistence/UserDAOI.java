package com.ex.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ex.domain.UserVO;



@Repository
public class UserDAOI implements UserDAO{
	
	@Inject
	SqlSession session;
	String namespace="UserMapper";
	
	
	@Override
	public UserVO loginPost(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".login",vo);
	}


	

}
