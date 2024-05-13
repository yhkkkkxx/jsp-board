package com.hana.controller;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminMemberController {
    String memberdir = "admin/member/";
    final MemberService memberService;
    @RequestMapping("/member")
    public String member(Model model) {
        List<MemberDto> list = null;
        try {
            list = memberService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("members", list);
        model.addAttribute("n", list.size());
        model.addAttribute("center", memberdir+"member");
        return "index";
    }
    @RequestMapping("/member/searchby")
    public ResponseEntity<List<MemberDto>> searchby(Model model, @RequestParam("op") String op, @RequestParam("txt") String txt) throws Exception {
        List<MemberDto> searchList = null;
        if(op.equals("0")) {
            searchList = memberService.searchByAll(txt);
        }
        else if(op.equals("1")) {
            searchList = memberService.searchById(txt);
        }
        else if(op.equals("2")) {
            searchList = memberService.searchByName(txt);
        }
        else if(op.equals("3")) {
            searchList = memberService.searchByEmail(txt);
        }
        return new ResponseEntity<>(searchList, HttpStatus.OK);
    }
    @RequestMapping("/member/sortby")
    public ResponseEntity<List<MemberDto>> searchby(Model model, @RequestParam("op") String op) throws Exception {
        List<MemberDto> sortList = null;
        if(op.equals("0")) {
            sortList = memberService.sortByIdAsc();
        }
        else if(op.equals("1")) {
            sortList = memberService.sortByIdDesc();
        }
        else if(op.equals("2")) {
            sortList = memberService.sortByJoinDateAsc();
        }
        else if(op.equals("3")) {
            sortList = memberService.sortByJoinDateDesc();
        }
        return new ResponseEntity<>(sortList, HttpStatus.OK);
    }
    @RequestMapping("/member/listup")
    public ResponseEntity<List<MemberDto>> listup(Model model, @RequestParam("op") String op) throws Exception {
        List<MemberDto> list = null;
        if(op.equals("0")) {
            list = memberService.get();
        }
        else if(op.equals("1")) {
            list = memberService.listUpFive();
        }
        else if(op.equals("2")) {
            list = memberService.listUpTen();
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }
}
