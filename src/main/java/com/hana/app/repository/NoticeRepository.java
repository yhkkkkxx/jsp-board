package com.hana.app.repository;


import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.CompanyRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface NoticeRepository extends CompanyRepository<Integer, NoticeDto> {
    List<NoticeDto> searchByAll(String s) throws Exception;
    List<NoticeDto> searchByTitle(String s) throws Exception;
    List<NoticeDto> searchByContent(String s) throws Exception;
    List<NoticeDto> searchByWriter(String s) throws Exception;
    List<NoticeDto> sortByIdAsc() throws Exception;
    List<NoticeDto> sortByIdDesc() throws Exception;
    List<NoticeDto> sortByDateAsc() throws Exception;
    List<NoticeDto> sortByDateDesc() throws Exception;
    List<NoticeDto> listUpFive() throws Exception;
    List<NoticeDto> listUpTen() throws Exception;
}
