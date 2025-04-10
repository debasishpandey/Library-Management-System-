package com.util;

import java.sql.Date;

public class PaymentDetails {

    private int id;
    private String studentName;
    private String requestId;
    private String amount;
    private Date date;
    private String receiptNo;

    // No-args constructor
    public PaymentDetails() {
    }

    // All-args constructor
    public PaymentDetails(int id, String studentName, String requestId, String amount, Date date, String receiptNo) {
        this.id = id;
        this.studentName = studentName;
        this.requestId = requestId;
        this.amount = amount;
        this.date = date;
        this.receiptNo = receiptNo;
    }

    // Getter and Setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getReceiptNo() {
        return receiptNo;
    }

    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo;
    }

    // toString method
    @Override
    public String toString() {
        return "PaymentDetails{" +
                "id=" + id +
                ", studentName='" + studentName + '\'' +
                ", requestId='" + requestId + '\'' +
                ", amount='" + amount + '\'' +
                ", date=" + date +
                ", receiptNo='" + receiptNo + '\'' +
                '}';
    }
}

