package com.util;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDao {


   private static final BookDao instance=new BookDao();

   public static BookDao getInstance() {
       return instance;
   }
    static  Connection con=DbConnection.getConnection();

    private BookDao() {}

    private  String generateBookId() {
        int maxid=this.maxBookId()+1;
       return "GIET-BK-"+maxid;
    }

    public static ArrayList<Book> fetchAllBooks() {
        ArrayList<Book> books = new ArrayList<>();
        try (
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
    public int maxBookId(){

        try{

            PreparedStatement ps=con.prepareStatement("SELECT MAX(CAST(SUBSTRING_INDEX(bookid, '-', -1) AS UNSIGNED)) AS max_number\n" +
                    "FROM book;");
            ResultSet set = ps.executeQuery();
            if(set.next()){
                return set.getInt(1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return -1;
    }
        public boolean addBook(Book book) {
            try (
                 PreparedStatement ps = con.prepareStatement("INSERT INTO book (bookid, name, author, quantity)\n" +
                         "VALUES (?, ?, ?, ?);\n")) {

                ps.setString(1, this.generateBookId());
                ps.setString(2, book.getName());
                ps.setString(3, book.getAuthor());
                ps.setInt(4, book.getQuantity());
               int i=ps.executeUpdate();
               if(i>0){
                   return true;
               }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            return false;
        }
    public Book fetchBookById(String bookID) {
        try (
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


        try (
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

        try (
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
        try (
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

        try (
             PreparedStatement ps = con.prepareStatement("UPDATE book SET quantity=? WHERE name=?")) {

            ps.setInt(1, book.getQuantity() - quantity);
            ps.setString(2, bookId);
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
