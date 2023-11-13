package kz.bitlab.techorda.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBConnection {
    private  static Connection connection;
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/techorda_db",
                    "root", "");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Book> getBooks(){
        ArrayList<Book> books = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT b.id, b.name, b.genre,b.price,b.description, b.author_id," +
                            "a.first_name,a.last_name,a.instagram " +
                            "from books as b " +
                            "inner join authors as a on b.author_id = a.id " +
                            "order by b.price desc");

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Book book = new Book();
                book.setName(resultSet.getString("name"));
                book.setId(resultSet.getInt("id"));
                book.setGenre(resultSet.getString("genre"));
                book.setDescription(resultSet.getString("description"));
                book.setPrice(resultSet.getDouble("price"));

                Author author = new Author();
                author.setId(resultSet.getInt("author_id"));
                author.setFirst_name(resultSet.getString("first_name"));
                author.setLast_name(resultSet.getString("last_name"));
                author.setInstagram(resultSet.getString("instagram"));

                book.setAuthor(author);
                books.add(book);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return books;
    }

    public static void addBook(Book book){
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "insert into books (name, price, author_id, genre, description) " +
                            "values (?,?,?,?,?)");
            statement.setString(1, book.getName());
            statement.setDouble(2, book.getPrice());
            statement.setInt(3,book.getAuthor().getId());
            statement.setString(4, book.getGenre());
            statement.setString(5, book.getDescription());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static Book getBook(int id){
        Book book =null;
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT b.id, b.name, b.genre,b.price,b.description, b.author_id," +
                            "a.first_name,a.last_name,a.instagram " +
                            "from books as b " +
                            "inner join authors as a on b.author_id = a.id " +
                            "where b.id = ?"
            );
            statement.setInt(1,id);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                book = new Book();
                book.setName(resultSet.getString("name"));
                book.setId(resultSet.getInt("id"));
                book.setGenre(resultSet.getString("genre"));
                book.setDescription(resultSet.getString("description"));
                book.setPrice(resultSet.getDouble("price"));

                Author author = new Author();
                author.setId(resultSet.getInt("author_id"));
                author.setFirst_name(resultSet.getString("first_name"));
                author.setLast_name(resultSet.getString("last_name"));
                author.setInstagram(resultSet.getString("instagram"));
                book.setAuthor(author);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return book;
    }

    public static void updateBook(Book book){
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "update books set name =?, author_id=? , price = ?, " +
                            "description = ?, genre = ? where id =?"
            );

            statement.setString(1, book.getName());
            statement.setInt(2, book.getAuthor().getId());
            statement.setDouble(3, book.getPrice());
            statement.setString(4, book.getDescription());
            statement.setString(5, book.getGenre());
            statement.setInt(6, book.getId());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteBook(int id){
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "delete from books where id =?"
            );
            statement.setInt(1,id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Author> getAuthors(){
        ArrayList<Author> authors = new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement("" +
                    "select * from authors order by first_name asc");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Author author = new Author();
                author.setId(resultSet.getInt("id"));
                author.setFirst_name(resultSet.getString("first_name"));
                author.setLast_name(resultSet.getString("last_name"));
                author.setInstagram(resultSet.getString("instagram"));
                authors.add(author);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return authors;
    }

    public static Author getAuthor(int id){
        Author author=null;
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "select * from authors where id=?");
            statement.setInt(1,id);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                author = new Author();
                author.setId(resultSet.getInt("id"));
                author.setFirst_name(resultSet.getString("first_name"));
                author.setLast_name(resultSet.getString("last_name"));
                author.setInstagram(resultSet.getString("instagram"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return author;
    }

    public static void addAuthor(Author author){
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "insert into authors (first_name, last_name, instagram) " +
                            "values (?,?,?)");
            statement.setString(1, author.getFirst_name());
            statement.setString(2, author.getLast_name());
            statement.setString(3, author.getInstagram());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
