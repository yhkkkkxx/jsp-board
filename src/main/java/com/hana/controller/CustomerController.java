package com.hana.controller;

import com.hana.app.data.dto.NoticeDto;
import com.hana.app.data.dto.One2oneDto;
import com.hana.app.data.dto.QnaDto;
import com.hana.app.repository.One2oneRepository;
import com.hana.app.service.One2oneService;
import com.hana.app.service.QnaService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/customer")
@RequiredArgsConstructor
@Slf4j
public class CustomerController {
    String one2onedir = "customer/one2one/";
    String qnadir = "customer/qna/";

    final One2oneService one2oneService;
    final QnaService qnaService;

    @RequestMapping("/one2one/write")
    public String write(Model model, HttpSession httpSession) {
        model.addAttribute("center", one2onedir+"write");
        return "index";
    }
    @RequestMapping("/one2one/writeimpl")
    public String one2oneimpl(Model model, One2oneDto one2oneDto) {
        try {
            one2oneService.add(one2oneDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("center", one2onedir+"write");
        return "redirect:/customer/one2one/write";
    }
    @RequestMapping("/qna")
    public String qna(Model model) {
        List<QnaDto> list = null;
        try {
            list = qnaService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("qnas", list);
        model.addAttribute("center", qnadir+"qna");
        return "index";
    }
    @RequestMapping("/qna/searchby")
    public ResponseEntity<List<QnaDto>> searchby(Model model, @RequestParam("op") String op, @RequestParam("txt") String txt) {
        log.info(op+" "+txt);
        List<QnaDto> searchList = null;
        if(op.equals("0")) {
            log.info("hi");
            try {
                searchList = qnaService.searchByTitle(txt);
            } catch (Exception e) {
//                return "index";
            }
        }
        else if(op.equals("1")) {
            try {
                searchList = qnaService.searchByContent(txt);
            } catch (Exception e) {
//                return "index";
            }
        }
        else if(op.equals("2")) {
            try {
                searchList = qnaService.searchByWriter(txt);
            } catch (Exception e) {
//                return "index";
            }
        }
        model.addAttribute("searchedqnas", searchList);
        return new ResponseEntity<>(searchList, HttpStatus.OK);
    }
    @RequestMapping("/qna/checkpw")
    public String checkpw(Model model, @RequestParam("qnaidx") int qnaidx) {
        model.addAttribute("qnaidx", qnaidx);
        return qnadir+"checkpw";
    }
    @RequestMapping("/qna/checkpwimpl")
    public String checkpwimpl(Model model, @RequestParam("qnaIdx") int idx, @RequestParam("qnaPw") String pw, HttpServletResponse response) {
        String password = null;
        try {
            password = qnaService.checkPw(idx);
            if(password.equals(pw)) {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("opener.parent.location.href='/customer/qna/detail?qnaidx=" + idx + "';");
                out.println("window.close();");
                out.println("</script>");
                out.flush();
                return "redirect:/customer/qna/detail?qnaidx="+idx;
            } else {
                model.addAttribute("qnaidx", idx);
                model.addAttribute("fail", "비밀번호가 틀렸습니다.");
                return qnadir+"checkpw";
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @RequestMapping("/qna/write")
    public String write(Model model) {
        model.addAttribute("center", qnadir+"write");
        return "index";
    }
    @RequestMapping("/qna/writeimpl")
    public String qnaimpl(Model model, QnaDto qnaDto) {
        try {
            qnaService.add(qnaDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("center", qnadir);
        return "redirect:/customer/qna";

    }


    @RequestMapping("/qna/detail")
    public String detail(Model model, @RequestParam("qnaidx") int id) {
        QnaDto qnaDto = null;
        try {
            qnaDto = qnaService.get(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("qna", qnaDto);
        model.addAttribute("center", qnadir+"detail");
        return "index";
    }
}
