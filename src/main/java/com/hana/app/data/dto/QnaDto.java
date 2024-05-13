package com.hana.app.data.dto;

import lombok.*;

import java.util.Date;

@Data
@ToString
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
public class QnaDto {
    private int qnaIdx;
    private String qnaName;
    private String qnaPw;
    private String qnaTitle;
    private String qnaContent;
    private Date qnaDate;
}
