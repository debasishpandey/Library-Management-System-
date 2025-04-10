package com.util;



import java.sql.Date;

public class RequestDetails {
    private String id;
    private String registrationNo;
    private String studentName;
    private String bookId;
    private String bookName;
    private Date date;
    private String status;
    private Date dueDate;

    // No-args constructor
    public RequestDetails() {
    }

    // All-args constructor
    public RequestDetails(String id, String registrationNo, String studentName, String bookId, String bookName, Date date, String status, Date dueDate) {
        this.id = id;
        this.registrationNo = registrationNo;
        this.studentName = studentName;
        this.bookId = bookId;
        this.bookName = bookName;
        this.date = date;
        this.status = status;
        this.dueDate = dueDate;
    }

    // Getter and Setter methods
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRegistrationNo() {
        return registrationNo;
    }

    public void setRegistrationNo(String registrationNo) {
        this.registrationNo = registrationNo;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    // toString method
    @Override
    public String toString() {
        return "RequestDetails{" +
                "id='" + id + '\'' +
                ", registrationNo='" + registrationNo + '\'' +
                ", studentName='" + studentName + '\'' +
                ", bookId='" + bookId + '\'' +
                ", bookName='" + bookName + '\'' +
                ", date=" + date +
                ", status='" + status + '\'' +
                ", dueDate=" + dueDate +
                '}';
    }
}
