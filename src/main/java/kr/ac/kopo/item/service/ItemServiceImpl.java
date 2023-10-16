package kr.ac.kopo.item.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.file.FileDao;
import kr.ac.kopo.file.FileDaoImpl;
import kr.ac.kopo.file.FileVO;
import kr.ac.kopo.item.dao.ItemDao;
import kr.ac.kopo.item.web.ItemVO;

@Service
public class ItemServiceImpl implements ItemService {
	
	private static final Logger logger = LoggerFactory.getLogger(FileDaoImpl.class);
	
	@Autowired
	ItemDao dao;
	
	@Autowired
	FileDao fileDao;
	
	@Override
	public List<ItemVO> itemList(ItemVO itemVO) {
		List<ItemVO> itemList = dao.itemList(itemVO);
		for (ItemVO vo : itemList) {
			FileVO fileVO = dao.selectItemFile(vo.getItemNo());
			vo.setFileVO(fileVO);
		}
		return itemList;
	}

	@Override
	public ItemVO itemSelect(ItemVO itemVO) {
		return dao.itemSelect(itemVO);
	}
	
	@Transactional
	@Override
	public void itemAdd(ItemVO itemVO, List<FileVO> fileVOList) {
		
		 if(itemVO.getMonthPrice() == null && itemVO.getDepositFee() == null) {
			 itemVO.setLeaseOrMonth("lease"); 
		 } else if(itemVO.getLeasePrice() == null){ 
			 itemVO.setLeaseOrMonth("month"); 
		 }
		
		dao.itemAdd(itemVO);
		
		for (FileVO fileVO : fileVOList) {
			fileVO.setItemNo(itemVO.getItemNo());
			fileDao.insertFile(fileVO);
		}
		
	}

	@Override
	public List<ItemVO> partOtherItemList(Long partnerNo, Long itemNo) {
		Map<String, Long> paramMap = new HashMap<String, Long>();
		paramMap.put("itemNo", itemNo);
		paramMap.put("partnerNo", partnerNo);
		 List<ItemVO> partItemList = dao.partOtherItemList(paramMap);
		 for (ItemVO itemVO : partItemList) {
			FileVO fileVO = fileDao.selectItemFile(itemVO.getItemNo());
			itemVO.setFileVO(fileVO);
		}
		 return partItemList;
	}
	@Override
	public List<ItemVO> partItemList(Long partnerNo) {
		List<ItemVO> partItemList = dao.partItemList(partnerNo);
		for (ItemVO itemVO : partItemList) {
			FileVO fileVO = fileDao.selectItemFile(itemVO.getItemNo());
			itemVO.setFileVO(fileVO);
		}
		return partItemList;
	}

	@Override
	public void updateStatus(Long itemNo) {
			dao.updateStatus(itemNo);
	}

	@Override
	public String selectStatus(Long itemNo) {
		return dao.selectStatus(itemNo);
	}

	@Override
	public void deleteItem(Long itemNo) {
		dao.deleteItem(itemNo);
	}

	//매물 상세페이지
	@Override
	@Transactional
	public ItemVO itemDetail(Long itemNo) {
		//해당 매물의 모든 사진 리스트를 반환
		List<FileVO> fileVOList = dao.selectFile(itemNo);
		
		//아이템 정보 select
		ItemVO itemVO = dao.itemDetail(itemNo);
		
		//조회수 update
		int viewCount = dao.viewCount(itemNo);
		
		//itemVO에 조회수와 file리스트를 setting
		itemVO.setViewCount(viewCount);
		itemVO.setFileVOList(fileVOList);
		
		return itemVO;
	}

	@Override
	public String lomSelect(Long itemNo) {
		return dao.lomSelect(itemNo);
	}

	@Override
	public List<ItemVO> selectRecentList() {
		List<ItemVO> selectRecentList = dao.selectRecentList();
		for (ItemVO itemVO : selectRecentList) {
			Long itemNo = itemVO.getItemNo();
			FileVO fileVO = fileDao.selectItemFile(itemNo);

			itemVO.setFileVO(fileVO);
		}
		return selectRecentList;
	}

	@Override
	public List<ItemVO> selectPopularList() {
		List<ItemVO> selectPopularList = dao.selectPopularList();
		for (ItemVO itemVO : selectPopularList) {
			Long itemNo = itemVO.getItemNo();
			FileVO fileVO = fileDao.selectItemFile(itemNo);

			itemVO.setFileVO(fileVO);
		}
		return selectPopularList;
	}

	
}