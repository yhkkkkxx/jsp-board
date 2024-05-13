package com.hana.controller;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.awt.event.WindowFocusListener;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
@Slf4j
public class MemberController {
    String logindir = "member/login/";
    String joindir = "member/join/";

    final MemberService memberService;

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("msg","");
        model.addAttribute("center", logindir+"login");
        return "index";
    }
    @RequestMapping("/login/loginimpl")
    public String loginimpl(Model model, @RequestParam("login_id") String login_id, @RequestParam("login_pw") String login_pw, HttpSession httpSession, HttpServletResponse response) {
        log.info(login_id+" "+ login_pw);
        List<MemberDto> list = null;
        MemberDto memberDto = null;
        log.info("login=========================="+login_id);
        try {
            memberDto = memberService.get(login_id);
            if(memberDto == null) {
                log.info("아이디가 존재하지 않습니다.");
                model.addAttribute("msg","아이디가 존재하지 않습니다.");
                model.addAttribute("center", logindir+"login");
                return "index";
            }
            if(!login_pw.equals(memberDto.getMemberPw())) {
                log.info("비밀번호가 틀렸습니다.");
                model.addAttribute("msg","비밀번호가 틀렸습니다.");
                model.addAttribute("center", logindir+"login");
                return "index";
            }
            httpSession.setAttribute("member_id", login_id);
        } catch (Exception e) {
            model.addAttribute("center", logindir+"login");
            return "index";
        }

        try {
            response.setContentType("text/html; charset=utf-8");
            PrintWriter w = response.getWriter();
            w.write("<script>alert('로그인되었습니다.');location.href='/';</script>");
            w.flush();
            w.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
//        return "redirect:/";
        return "index";
    }
    @RequestMapping("/logoutimpl")
    public String logout(Model model, HttpSession httpSession) {
        if(httpSession != null) {
            httpSession.invalidate();
        }
        log.info("logout=========================="+httpSession.getId());
        return "redirect:/";
    }
    @RequestMapping("/login/findid")
    public String findid(Model model) {
        return logindir+"findid";
    }

    @RequestMapping("/login/findidimpl")
    public String findidimpl(Model model, @RequestParam("userName") String name, @RequestParam("userEmail") String email) throws Exception {
        String foundId = null;
        foundId = memberService.findId(name, email);
        if(foundId == null) {
            model.addAttribute("notFound", "일치하는 회원 정보가 없습니다.");
        } else {
            model.addAttribute("findId", foundId);
        }
        return logindir + "findid";
    }

    @RequestMapping("/login/findpw")
    public String findpw(Model model) {
        return logindir+"findpw";
    }
    @RequestMapping("/login/findpwimpl")
    public String findpwimpl(Model model, @RequestParam("userName") String name, @RequestParam("userID") String id, @RequestParam("userEmail") String email) throws Exception {
        String foundPw = null;
        foundPw = memberService.findPw(name, id, email);
        if(foundPw == null) {
            model.addAttribute("notFound", "일치하는 회원 정보가 없습니다.");
        } else {
            model.addAttribute("findPw", foundPw);
        }
        return logindir + "findpw";
    }

    @RequestMapping("/join/beforejoin")
    public String beforejoin(Model model) {
        model.addAttribute("center", joindir+"beforejoin");
        return "index";
    }
    @RequestMapping("/join")
    public String join(Model model) {
        model.addAttribute("center", joindir+"join");
        return "index";
    }
    @RequestMapping("/join/idchk")
    @ResponseBody
    public String idchk(@RequestParam("id") String id) {
        String result = "0";
        MemberDto memberDto = null;
        try {
            memberDto = memberService.get(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if (memberDto == null) return "1";
        return result;
    }
    @PostMapping(value = "/join/joinimpl")
    @ResponseBody
    public String joinimpl(@RequestBody MemberDto memberDto) {
        try {
            memberService.add(memberDto);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }
}
