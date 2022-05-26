package com.its.board.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {
    private Long id;
    private Long boardId;
    private String commentWriter;
    private String commentContents;
    private Timestamp commentCreatedDate;
}
