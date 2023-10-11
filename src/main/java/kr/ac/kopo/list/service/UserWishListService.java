package kr.ac.kopo.list.service;

import java.util.List;

import kr.ac.kopo.list.web.UserWishListVO;

public interface UserWishListService {

	List<UserWishListVO> recentView(List<String> roomNumbers);

	// 관심 매물 리스트 불러오기 
	List<UserWishListVO> wishList();
	
	// 관심 매물 리스트에서 제외
	void delete(Long wishNo);



}
