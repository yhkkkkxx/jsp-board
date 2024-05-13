package com.hana.Member;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class DeleteTests {
    @Autowired
    MemberService memberService;

    @Test
    void contextLoads() throws Exception {
        memberService.del("pong");
        memberService.get();

        log.info("Test----------------------------------------");
    }

}
