package com.hana.app.repository;


import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.CompanyRepository;
import com.hana.app.service.MemberService;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MemberRepository extends CompanyRepository<String, MemberDto> {
    String findId(@Param("memberName") String a, @Param("memberEmail") String b) throws Exception;
    String findPw(@Param("memberName") String a, @Param("memberId") String b, @Param("memberEmail") String c) throws Exception;
    List<MemberDto> searchByAll(String s) throws Exception;
    List<MemberDto> searchById(String s) throws Exception;
    List<MemberDto> searchByName(String s) throws Exception;
    List<MemberDto> searchByEmail(String s) throws Exception;
    List<MemberDto> sortByIdAsc() throws Exception;
    List<MemberDto> sortByIdDesc() throws Exception;
    List<MemberDto> sortByJoinDateAsc() throws Exception;
    List<MemberDto> sortByJoinDateDesc() throws Exception;
    List<MemberDto> listUpFive() throws Exception;
    List<MemberDto> listUpTen() throws Exception;
}
