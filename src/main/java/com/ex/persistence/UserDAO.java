package com.ex.persistence;

import com.ex.domain.UserVO;

public interface UserDAO {
	
	public UserVO loginPost(UserVO vo) throws Exception;
	
}
