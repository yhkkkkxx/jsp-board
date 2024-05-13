package com.hana.controller;

import com.hana.app.data.dto.NoticeDto;
import com.hana.app.service.MemberService;
import com.hana.app.service.NoticeService;
import jakarta.servlet.http.HttpSession;
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
public class AdminNoticeController {
    String noticedir = "admin/notice/";
    final NoticeService noticeService;

    @RequestMapping("/notice")
    public String notice(Model model) throws Exception {
        List<NoticeDto> list = null;
        list = noticeService.get();
        model.addAttribute("notices", list);
        model.addAttribute("n", list.size());
        model.addAttribute("center", noticedir+"notice");
        return "index";
    }
    @RequestMapping("/notice/searchby")
    public ResponseEntity<List<NoticeDto>> searchby(Model model, @RequestParam("op") String op, @RequestParam("txt") String txt) throws Exception {
        log.info(op+" "+txt);
        List<NoticeDto> searchList = null;
        if(op.equals("0")) {
            searchList = noticeService.searchByAll(txt);
        }
        else if(op.equals("1")) {
            searchList = noticeService.searchByTitle(txt);
        }
        else if(op.equals("2")) {
            searchList = noticeService.searchByContent(txt);
        }
        else if(op.equals("3")) {
            searchList = noticeService.searchByWriter(txt);
        }
        return new ResponseEntity<>(searchList, HttpStatus.OK);
    }
    @RequestMapping("/notice/sortby")
    public ResponseEntity<List<NoticeDto>> sortby(Model model, @RequestParam("op") String op) throws Exception {
        List<NoticeDto> sortList = null;
        if(op.equals("0")) {
            sortList = noticeService.sortByIdAsc();
        }
        else if(op.equals("1")) {
            sortList = noticeService.sortByIdDesc();
        }
        else if(op.equals("2")) {
            sortList = noticeService.sortByDateAsc();
        }
        else if(op.equals("3")) {
            sortList = noticeService.sortByDateDesc();
        }
        return new ResponseEntity<>(sortList, HttpStatus.OK);
    }
    @RequestMapping("/notice/listup")
    public ResponseEntity<List<NoticeDto>> listup(Model model, @RequestParam("op") String op) throws Exception {
        List<NoticeDto> list = null;
        if(op.equals("0")) {
            list = noticeService.get();
        }
        else if(op.equals("1")) {
            list = noticeService.listUpFive();
        }
        else if(op.equals("2")) {
            list = noticeService.listUpTen();
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @RequestMapping("/notice/write")
    public String write(Model model) throws Exception {
        NoticeDto noticeDto = null;
        model.addAttribute("center", noticedir+"write");
        return "index";
    }
    @RequestMapping("/notice/edit")
    public String edit(Model model, @RequestParam("noticeidx") int id) throws Exception {
        NoticeDto noticeDto = null;
        noticeDto = noticeService.get(id);
        model.addAttribute("noticeidx", id);
        model.addAttribute("notice", noticeDto);
        model.addAttribute("center", noticedir+"edit");
        return "index";
    }
    @RequestMapping("/notice/writeimpl")
    public String writeimpl(Model model, NoticeDto noticeDto, HttpSession httpSession) throws Exception {
        NoticeDto notice = NoticeDto.builder().noticeTitle(noticeDto.getNoticeTitle()).noticeContent(noticeDto.getNoticeContent()).noticeMemberId("admin").build();
        noticeService.add(notice);
        return "redirect:/admin/notice";
    }
    @RequestMapping("/notice/editimpl")
    public String editimpl(Model model, NoticeDto noticeDto) throws Exception {
        log.info("================================"+noticeDto.toString());
        NoticeDto notice = NoticeDto.builder().noticeIdx(noticeDto.getNoticeIdx()).noticeTitle(noticeDto.getNoticeTitle()).noticeContent("admin").build();
        noticeService.modify(noticeDto);
        return "redirect:/admin/notice";
    }
}
