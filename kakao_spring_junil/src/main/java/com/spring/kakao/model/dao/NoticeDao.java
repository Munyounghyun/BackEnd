package com.spring.kakao.model.dao;

import java.util.List;

import com.spring.kakao.model.dto.NoticeDto;

public interface NoticeDao {
	public List<NoticeDto> getNoticeListAll();
	public int getNoticeMaxCode();
	public int noticeMstInsert(NoticeDto noticeDto);
	public int noticeDtlInsert(NoticeDto noticeDto);
	public NoticeDto getNotice(int notice_code);
	public int plusNoticeCount(int notice_code);
	public int noticeMstDelete(int notice_code);
	public int noticeDtlDelete(int notice_code);
}
