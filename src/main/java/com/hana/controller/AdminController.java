package com.hana.controller;

import com.hana.app.data.dto.MemberAdminDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.service.MemberAdminService;
import com.hana.app.service.MemberService;
import com.hana.app.service.NoticeService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {
    String logindir = "admin/login/";

    final MemberAdminService memberAdminService;

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", logindir+"login");
        return "index";
    }
    @RequestMapping(value = "/loginimpl")
    @ResponseBody
    public String loginimpl(@RequestParam("login_id") String login_id, @RequestParam("login_pw") String login_pw, HttpSession httpSession) {
        log.info("========================확인==="+login_id+" "+login_pw);
        MemberAdminDto memberAdminDto = null;
        try {
            memberAdminService.get();
            memberAdminDto = memberAdminService.get(login_id);
            if(memberAdminDto == null) {
                return "0";
            }
            if(!memberAdminDto.getMemberPw().equals(login_pw)) {
                return "-1";
            }
            httpSession.setAttribute("admin_id", login_id);
            return "1";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
