package com.hana.app.data.dto;

import lombok.*;

import java.util.Date;

@Data
@ToString
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
public class NoticeDto {
    private int noticeIdx;
    private String noticeTitle;
    private String noticeContent;
    private String noticeMemberId;
    private Date noticeDate;
}
