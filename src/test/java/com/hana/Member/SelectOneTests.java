package com.hana.Member;

import com.hana.app.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class SelectOneTests {
    @Autowired
    MemberService memberService;

    @Test
    void contextLoads() throws Exception {
        memberService.get("kim");
        log.info("Test----------------------------------------");
        memberService.get();

    }

}
