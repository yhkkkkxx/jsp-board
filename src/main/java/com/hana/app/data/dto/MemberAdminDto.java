package com.hana.app.data.dto;


import lombok.*;

import java.util.Date;

@Data
@ToString
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
public class MemberAdminDto {
    private int memberIdx;
    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberEmail;
    private Date memberJoinDate;

}
