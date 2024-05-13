package com.hana.app.service;

import com.hana.app.data.dto.MemberAdminDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.CompanyService;
import com.hana.app.repository.MemberAdminRepository;
import com.hana.app.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberAdminService implements CompanyService<String, MemberAdminDto> {
    final MemberAdminRepository memberAdminRepository;

    @Override
    public int add(MemberAdminDto memberAdminDto) throws Exception {
        return memberAdminRepository.insert(memberAdminDto);
    }

    @Override
    public int del(String string) throws Exception {
        return memberAdminRepository.delete(string);
    }

    @Override
    public int modify(MemberAdminDto memberAdminDto) throws Exception {
        return memberAdminRepository.update(memberAdminDto);
    }

    @Override
    public MemberAdminDto get(String string) throws Exception {
        return memberAdminRepository.selectOne(string);
    }

    @Override
    public List<MemberAdminDto> get() throws Exception {
        return memberAdminRepository.select();
    }
}
