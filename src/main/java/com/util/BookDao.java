package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDao {

    public static ArrayList<Book> fetchAllBooks() {
        ArrayList<Book> books = new ArrayList<>();
        try (Connection con = new DbConnection().getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM book");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Book book = new Book(rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
                books.add(book);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return books;
    }

    public Book fetchBookById(String bookID) {
        try (Connection con = new DbConnection().getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM book WHERE bookid=?")) {
            System.out.println(bookID);
            ps.setString(1, bookID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Book(rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public boolean increaseQuantity(int quantity, String bookId) {
        Book book = fetchBookById(bookId);
        if (book == null) return false;


        try (Connection con = new DbConnection().getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE book SET quantity=? WHERE bookid=?")) {

            ps.setInt(1, book.getQuantity() + quantity);
            ps.setString(2, bookId);
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public boolean updateQuantity(int quantity, String bookId) {
        Book book = fetchBookById(bookId);
        if (book == null) return false;

        try (Connection con = new DbConnection().getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE book SET quantity=? WHERE bookid=?")) {

            ps.setInt(1,  quantity);
            ps.setString(2, bookId);
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public boolean deleteBook(String bookId) {
        try (Connection con = new DbConnection().getConnection();
             PreparedStatement ps = con.prepareStatement("delete FROM book WHERE bookid=?")) {
            ps.setString(1, bookId);
            int i = ps.executeUpdate();
            if (i > 0) return true;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public boolean decreaseQuantity(int quantity, String bookId) {
        Book book = fetchBookById(bookId);
        if (book == null || book.getQuantity() < quantity) return false;

        try (Connection con = new DbConnection().getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE book SET quantity=? WHERE name=?")) {

            ps.setInt(1, book.getQuantity() - quantity);
            ps.setString(2, bookId);
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public int maxId(){
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("SELECT MAX(CAST(RIGHT(bookid, 4) AS UNSIGNED)) AS last_code\n" +
                    "FROM book\n" +
                    "WHERE RequestId LIKE 'GIET-BK-%';\n");
            ResultSet set = ps.executeQuery();
            if(set.next()){
                return set.getInt(1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return -1;
    }
}
