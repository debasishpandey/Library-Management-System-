package com.util;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RequestDetails {
    private String id;
    private String registrationNo;
    private String studentName;
    private String bookId;
    private String bookName;
    private Date date;
    private String status;
    private Date dueDate;
}
