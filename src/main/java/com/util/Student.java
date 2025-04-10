package com.util;


import java.sql.Date;
import java.sql.Timestamp;

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

    // No-args constructor
    public Student() {
    }

    // All-args constructor
    public Student(String registrationNumber, String name, String email, String password, String phoneNumber, Date dob, String department, Date joinDate, Timestamp createdAt, Timestamp updatedAt, String image) {
        this.registrationNumber = registrationNumber;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.dob = dob;
        this.department = department;
        this.joinDate = joinDate;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.image = image;
    }

    // Getter and Setter methods
    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    // toString method
    @Override
    public String toString() {
        return "Student{" +
                "registrationNumber='" + registrationNumber + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", dob=" + dob +
                ", department='" + department + '\'' +
                ", joinDate=" + joinDate +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                ", image='" + image + '\'' +
                '}';
    }
}
