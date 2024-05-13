package com.hana.Member;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import java.text.SimpleDateFormat;
import java.util.Date;

import static org.assertj.core.util.DateUtil.now;

@SpringBootTest
@Slf4j
@Rollback
class InsertTests {
    @Autowired
    MemberService memberService;

    @Test
    void contextLoads() throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        String dateString = "2020/09/11";
        MemberDto memberDto = MemberDto.builder().memberId("pong").memberPw("0911").memberName("pong").memberEmail("pong@gmail.com").memberEmailReceive(0).memberPwQuestion(0).memberPwAnswer("0").memberGender("male").memberBirthDate(formatter.parse(dateString)).memberJoinDate(now()).build();
        memberService.add(memberDto);
//        memberDto = MemberDto.builder().memberId("kim").memberPw("0310").memberName("khy").memberEmail("khy@gmail.com").memberEmailReceive(0).memberPwQuestion(0).memberPwAnswer("0").memberGender("female").memberBirthDate(formatter.parse(dateString)).memberJoinDate(now()).build();
//        memberService.add(memberDto);
        memberService.get();

        log.info("Test----------------------------------------");
    }

}
