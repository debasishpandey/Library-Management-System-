package com.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Student {
    private String registrationNumber;
    private String name;
    private String email;
    private String password;
    private String phoneNumber;
    private Date dob;
    private String department;
    private Date joinDate;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private String image;
}
