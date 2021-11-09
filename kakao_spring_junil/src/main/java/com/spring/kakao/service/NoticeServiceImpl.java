package com.spring.kakao.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.kakao.model.beans.NoticeBean;
import com.spring.kakao.model.dao.NoticeDao;
import com.spring.kakao.model.dto.NoticeDto;
import com.spring.kakao.model.dto.NoticeInsertDto;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private ServletContext context;
	
	private NoticeBean noticeBean;
	private List<NoticeDto> noticeListAll;
	
	public void setNoticeBean(int pageNumber) {
		noticeBean = new NoticeBean();
		noticeBean.setNoticeTotalCount(noticeListAll.size());
		noticeBean.setPageNumber(pageNumber);
		noticeBean.setStartIndex();
		noticeBean.setEndIndex();
		noticeBean.setTotalPage();
		noticeBean.setStartPage();
		noticeBean.setEndPage();
	}
	
	@Override
	public NoticeBean getNoticeBean() {
		return noticeBean;
	}

	@Override
	public int parseIntPageNumber(String pageNumber) {
		return Integer.parseInt(pageNumber);
	}
	
	@Override
	public List<NoticeDto> getNoticeListAll() {
		return noticeDao.getNoticeListAll();
	}
	
	@Override
	public List<NoticeDto> getNoticeList(int pageNumber) {
		noticeListAll = getNoticeListAll();
		List<NoticeDto> noticeList = new ArrayList<NoticeDto>();
		
		setNoticeBean(pageNumber);
		
		for(int i = noticeBean.getStartIndex(); i < noticeBean.getEndIndex() && i < noticeBean.getNoticeTotalCount(); i++) {
			noticeList.add(noticeListAll.get(i));
		}
		return noticeList;
	}
	
	@Override
	public NoticeDto fileUpload(NoticeInsertDto noticeInsertDto){
		MultipartFile[] multipartFiles=noticeInsertDto.getNotice_file();
		String filePath=context.getRealPath("/static/fileupload");
		
		StringBuilder originName=new StringBuilder();
		StringBuilder tempName=new StringBuilder();
		
		for (MultipartFile multipartFile : multipartFiles) {
			String originFile=multipartFile.getOriginalFilename();
			String originFileExtension=originFile.substring(originFile.lastIndexOf("."));//확장자 명 때어내는 작업
			String tempFile=UUID.randomUUID().toString().replaceAll("-", "") + originFileExtension;
			
			originName.append(originFile);
			originName.append(",");
			tempName.append(tempFile);
			tempName.append(",");
			
			File file=new File(filePath,tempFile);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		originName.delete(originName.length()-1, originName.length());
		tempName.delete(tempName.length()-1, tempName.length());
		
		NoticeDto noticeDto=new NoticeDto();
		noticeDto.setOriginFileNames(originName.toString());
		noticeDto.setTempFileNames(tempName.toString());
		
		
		return noticeDto;
	}
	
	@Override
	public int noticeInsert(NoticeInsertDto noticeInsertDto) {
		NoticeDto noticeDto=fileUpload(noticeInsertDto);
		noticeDto.setNotice_code(getNoticeMaxCode()+1);
		noticeDto.setNotice_title(noticeInsertDto.getNotice_title());
		noticeDto.setNotice_writer(noticeInsertDto.getNotice_writer());
		noticeDto.setNotice_content(noticeInsertDto.getNotice_content());
		
		int mstInsertFlag=noticeDao.noticeMstInsert(noticeDto);
		int dtlInsertFlag=0;
		if(mstInsertFlag==1) {
			dtlInsertFlag=noticeDao.noticeDtlInsert(noticeDto);
			return noticeDto.getNotice_code();
		}
		
		return dtlInsertFlag;
	}
	
	@Override
	public int getNoticeMaxCode() {
		
		return noticeDao.getNoticeMaxCode();
	}
}
