package kr.ac.kopo.note.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.note.dao.NoteDao;
import kr.ac.kopo.note.web.NoteVO;

@Service
public class NoteServiceImpl implements NoteService {

	@Autowired
	NoteDao dao;
	
	@Override
	public List<NoteVO> sendList(NoteVO noteVO) {
		int total = dao.total(noteVO);
		
		return dao.sendList(noteVO);
	}
	
	@Override
	public List<NoteVO> receiveList(NoteVO noteVO) {
		int total = dao.total(noteVO);
		
		return dao.receiveList(noteVO);
	}
	

	@Override
	public void add(Long roomNo, NoteVO noteVO) {
		dao.add(roomNo, noteVO);
	}

	@Override
	public NoteVO select(Map<String, Long> paramMap) {
		return dao.select(paramMap);
	}

	@Override
	public NoteVO receiveDetail(Long noteNo) {
		return dao.receiveDetail(noteNo);
	}

	@Override
	public void update(NoteVO noteVO) {
		dao.update(noteVO);
	}

	@Override
	public boolean delete(Long noteNo) {
		return dao.delete(noteNo);
	}



}
