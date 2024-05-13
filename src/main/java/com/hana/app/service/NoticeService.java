package com.hana.app.service;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.CompanyService;
import com.hana.app.repository.MemberRepository;
import com.hana.app.repository.NoticeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeService implements CompanyService<Integer, NoticeDto> {
    final NoticeRepository noticeRepository;

    @Override
    public int add(NoticeDto noticeDto) throws Exception {
        return noticeRepository.insert(noticeDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return noticeRepository.delete(integer);
    }

    @Override
    public int modify(NoticeDto noticeDto) throws Exception {
        return noticeRepository.update(noticeDto);
    }

    @Override
    public NoticeDto get(Integer integer) throws Exception {
        return noticeRepository.selectOne(integer);
    }

    @Override
    public List<NoticeDto> get() throws Exception {
        return noticeRepository.select();
    }
    public List<NoticeDto> searchByAll(String s) throws Exception {
        return noticeRepository.searchByAll(s);
    }
    public List<NoticeDto> searchByTitle(String s) throws Exception {
        return noticeRepository.searchByTitle(s);
    }
    public List<NoticeDto> searchByContent(String s) throws Exception {
        return noticeRepository.searchByContent(s);
    }
    public List<NoticeDto> searchByWriter(String s) throws Exception {
        return noticeRepository.searchByWriter(s);
    }
    public List<NoticeDto> sortByIdAsc() throws Exception {
        return noticeRepository.sortByIdAsc();
    }
    public List<NoticeDto> sortByIdDesc() throws Exception {
        return noticeRepository.sortByIdDesc();
    }
    public List<NoticeDto> sortByDateAsc() throws Exception {
        return noticeRepository.sortByDateAsc();
    }
    public List<NoticeDto> sortByDateDesc() throws Exception {
        return noticeRepository.sortByDateDesc();
    }
    public List<NoticeDto> listUpFive() throws Exception {
        return noticeRepository.listUpFive();
    }
    public List<NoticeDto> listUpTen() throws Exception {
        return noticeRepository.listUpTen();
    }
}
