package com.hana.app.service;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.One2oneDto;
import com.hana.app.frame.CompanyService;
import com.hana.app.repository.MemberRepository;
import com.hana.app.repository.One2oneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class One2oneService implements CompanyService<Integer, One2oneDto> {
    final One2oneRepository one2oneRepository;

    @Override
    public int add(One2oneDto one2oneDto) throws Exception {
        return one2oneRepository.insert(one2oneDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return one2oneRepository.delete(integer);
    }

    @Override
    public int modify(One2oneDto one2oneDto) throws Exception {
        return one2oneRepository.update(one2oneDto);
    }

    @Override
    public One2oneDto get(Integer integer) throws Exception {
        return one2oneRepository.selectOne(integer);
    }

    @Override
    public List<One2oneDto> get() throws Exception {
        return one2oneRepository.select();
    }
}
