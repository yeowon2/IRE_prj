package kr.ac.kopo.partner.service;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.pager.Pager;
import kr.ac.kopo.partner.web.PartnerVO;

public interface PartnerService {

	List<PartnerVO> list(Pager pager);

	Long add(PartnerVO partnerVO);

	PartnerVO select(Long partnerNo);

	void update(PartnerVO partnerVO);

	void delete(Long partnerNo);

	PartnerVO detail(Long partnerNo);

	Map<String, List> getRespCount(Long partnerNo);

}
