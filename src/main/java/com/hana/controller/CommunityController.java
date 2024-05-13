package com.hana.controller;

import com.hana.app.data.dto.NoticeDto;
import com.hana.app.service.NoticeService;
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
@RequestMapping("/community")
@RequiredArgsConstructor
@Slf4j
public class CommunityController {
    String noticedir = "community/notice/";

    final private NoticeService noticeService;

    @RequestMapping("/notice")
    public String notice(Model model, @RequestParam(value = "op",required = false) String op, @RequestParam(value = "txt", required = false) String txt) {
        List<NoticeDto> list = null;
        try {
            list = noticeService.get();
        } catch (Exception e) {
            return "index";
        }
        model.addAttribute("notices", list);
        model.addAttribute("center", noticedir+"notice");
        log.info(model.toString());
        return "index";
    }
    @RequestMapping("/notice/searchby")
    public ResponseEntity<List<NoticeDto>> searchby(Model model, @RequestParam("op") String op, @RequestParam("txt") String txt) {
        log.info(op+" "+txt);
        List<NoticeDto> searchList = null;
        if(op.equals("0")) {
            log.info("hi");
            try {
                searchList = noticeService.searchByTitle(txt);
            } catch (Exception e) {
//                return "index";
            }
        }
        else if(op.equals("1")) {
            try {
                searchList = noticeService.searchByContent(txt);
            } catch (Exception e) {
//                return "index";
            }
        }
        model.addAttribute("searchednotices", searchList);
        return new ResponseEntity<>(searchList, HttpStatus.OK);
    }
    @RequestMapping("/notice/detail")
    public String detail(Model model, @RequestParam("noticeidx") int id) {
        log.info(String.valueOf(id));
        NoticeDto noticeDto = null;
        try {
            noticeDto = noticeService.get(id);
            log.info(noticeDto.toString());
            model.addAttribute("notice", noticeDto);
            model.addAttribute("center", noticedir+"detail");
            return "index";
        } catch (Exception e) {
            return "index";
        }

    }
}
