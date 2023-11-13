package kz.bitlab.techorda.db;

import java.util.ArrayList;

public class DBManager {
    private static final ArrayList<Book> books = new ArrayList<>();
    private static int id=6;



    public static ArrayList<Book> getBooks(){
        return books;
    }

    public static Book getBook(int id){
        return books.stream().filter(book -> book.getId()==id).findFirst().orElse(null);
    }
    public static void addBook(Book book){
        book.setId(id);
        books.add(book);
        id++;
    }
    public static void updateBook(Book kitap){
        for (int i=0;i< books.size();i++){
            if(books.get(i).getId()==kitap.getId()){
                books.set(i, kitap);
                break;
            }
        }
    }
    public static void deleteBook(int id){
        for (int i=0;i< books.size();i++){
            if(books.get(i).getId()==id){
                books.remove(i);
                break;
            }
        }
    }
}
