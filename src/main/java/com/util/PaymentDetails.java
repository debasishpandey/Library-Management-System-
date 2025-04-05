package com.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDetails {
    private int id;
    private String studentName;
    private String requestId;
    private String amount;
    private Date date;
    private String receiptNo;
}
