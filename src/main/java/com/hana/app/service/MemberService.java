package com.hana.app.service;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.CompanyService;
import com.hana.app.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService implements CompanyService<String, MemberDto> {
    final MemberRepository memberRepository;

    public String findId(String a, String b) throws Exception {
        return memberRepository.findId(a, b);
    }
    public String findPw(String a, String b, String c) throws Exception {
        return memberRepository.findPw(a, b, c);
    }
    @Override
    public int add(MemberDto memberDto) throws Exception {
        return memberRepository.insert(memberDto);
    }

    @Override
    public int del(String string) throws Exception {
        return memberRepository.delete(string);
    }

    @Override
    public int modify(MemberDto memberDto) throws Exception {
        return memberRepository.update(memberDto);
    }

    @Override
    public MemberDto get(String string) throws Exception {
        return memberRepository.selectOne(string);
    }

    @Override
    public List<MemberDto> get() throws Exception {
        return memberRepository.select();
    }
    public List<MemberDto> searchByAll(String s) throws Exception {
        return memberRepository.searchByAll(s);
    }
    public List<MemberDto> searchById(String s) throws Exception {
        return memberRepository.searchById(s);
    }
    public List<MemberDto> searchByName(String s) throws Exception {
        return memberRepository.searchByName(s);
    }
    public List<MemberDto> searchByEmail(String s) throws Exception {
        return memberRepository.searchByEmail(s);
    }
    public List<MemberDto> sortByIdAsc() throws Exception {
        return memberRepository.sortByIdAsc();
    }
    public List<MemberDto> sortByIdDesc() throws Exception {
        return memberRepository.sortByIdDesc();
    }
    public List<MemberDto> sortByJoinDateAsc() throws Exception {
        return memberRepository.sortByJoinDateAsc();
    }
    public List<MemberDto> sortByJoinDateDesc() throws Exception {
        return memberRepository.sortByJoinDateDesc();
    }
    public List<MemberDto> listUpFive() throws Exception {
        return memberRepository.listUpFive();
    }
    public List<MemberDto> listUpTen() throws Exception {
        return memberRepository.listUpTen();
    }
}
