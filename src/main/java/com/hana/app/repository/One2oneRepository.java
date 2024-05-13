package com.hana.app.repository;


import com.hana.app.data.dto.NoticeDto;
import com.hana.app.data.dto.One2oneDto;
import com.hana.app.frame.CompanyRepository;
import com.hana.app.service.One2oneService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface One2oneRepository extends CompanyRepository<Integer, One2oneDto> {
}
