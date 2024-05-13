package com.hana.app.repository;


import com.hana.app.data.dto.MemberAdminDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.CompanyRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberAdminRepository extends CompanyRepository<String, MemberAdminDto> {
}
