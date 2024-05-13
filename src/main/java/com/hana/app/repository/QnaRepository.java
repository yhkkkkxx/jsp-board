package com.hana.app.repository;


import com.hana.app.data.dto.NoticeDto;
import com.hana.app.data.dto.One2oneDto;
import com.hana.app.data.dto.QnaDto;
import com.hana.app.frame.CompanyRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface QnaRepository extends CompanyRepository<Integer, QnaDto> {
    String checkPw(Integer x) throws Exception;
    List<QnaDto> searchByTitle(String s) throws Exception;
    List<QnaDto> searchByContent(String s) throws Exception;
    List<QnaDto> searchByWriter(String s) throws Exception;
}
