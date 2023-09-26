package kr.ac.kopo.item.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.item.web.ItemVO;

@Repository
public class ItemDaoImpl implements ItemDao {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ItemDaoImpl.class);
	
	@Autowired
	SqlSession sql;

	@Override
	public List<ItemVO> itemList() {
		return sql.selectList("item.itemList");
	}

	@Override
	public ItemVO itemSelect(ItemVO itemVO) {
		System.out.println(itemVO.getLeaseOrMonth());
		ItemVO vo =  sql.selectOne("item.itemSelect", itemVO);
		LOGGER.info("LotM: {}", vo.getLeaseOrMonth());
		return vo;
	}
	
	@Override
	public void itemAdd(ItemVO itemVO) {
		// 첫 번째 INSERT 문 실행
        sql.insert("item.itemAdd", itemVO);
    }

	@Override
	public void leaseAdd(HashMap<String, Long> map) {
		sql.insert("item.leaseAdd", map);
	}

	@Override
	public void monthAdd(HashMap<String, Long> map) {
		sql.insert("item.monthAdd", map);
	}

	
		
}
