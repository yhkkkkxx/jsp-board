package com.hana.app.service;

import com.hana.app.data.dto.NoticeDto;
import com.hana.app.data.dto.One2oneDto;
import com.hana.app.data.dto.QnaDto;
import com.hana.app.frame.CompanyService;
import com.hana.app.repository.One2oneRepository;
import com.hana.app.repository.QnaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QnaService implements CompanyService<Integer, QnaDto> {
    final QnaRepository qnaRepository;

    @Override
    public int add(QnaDto qnaDto) throws Exception {
        return qnaRepository.insert(qnaDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return qnaRepository.delete(integer);
    }

    @Override
    public int modify(QnaDto qnaDto) throws Exception {
        return qnaRepository.update(qnaDto);
    }

    @Override
    public QnaDto get(Integer integer) throws Exception {
        return qnaRepository.selectOne(integer);
    }

    @Override
    public List<QnaDto> get() throws Exception {
        return qnaRepository.select();
    }

    public String checkPw(Integer x) throws Exception {
        return qnaRepository.checkPw(x);
    }
    public List<QnaDto> searchByTitle(String s) throws Exception {
        return qnaRepository.searchByTitle(s);
    }
    public List<QnaDto> searchByContent(String s) throws Exception {
        return qnaRepository.searchByContent(s);
    }
    public List<QnaDto> searchByWriter(String s) throws Exception {
        return qnaRepository.searchByWriter(s);
    }
}
