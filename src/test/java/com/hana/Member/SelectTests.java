package com.hana.Member;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
class SelectTests {
    @Autowired
    MemberService memberService;

    @Test
    void contextLoads() throws Exception {
        List<MemberDto> list = new ArrayList<>();

        log.info("---------------------------"+memberService);
        list = memberService.get();
        list.stream().forEach(l -> {log.info(l.getMemberId(), l.getMemberName());});

        log.info("Test----------------------------------------");
    }

}
