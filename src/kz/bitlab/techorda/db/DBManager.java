package kz.bitlab.techorda.db;

import java.util.ArrayList;

public class DBManager {
    private static final ArrayList<Book> books = new ArrayList<>();
    private static int id=6;

    static {
        books.add(
                new Book(1,
                        "Harry Potter and the Philosopher's Stone",
                        "J. K. Rowling",
                        "Fantasy",
                        5000, "Lorem Ipsum is simply dummy text of" +
                        " the printing and typesetting industry." +
                        " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, " +
                        "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                )
        );
        books.add(
                new Book(2,
                        "Harry Potter and the Azkaban Prison",
                        "J. K. Rowling",
                        "Fantasy",
                        6000, "Lorem Ipsum is simply dummy text of" +
                        " the printing and typesetting industry." +
                        " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, " +
                        "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                )
        );
        books.add(
                new Book(3,
                        "Twilight",
                        "Stefany Mayer",
                        "Fantasy",
                        7000, "Lorem Ipsum is simply dummy text of" +
                        " the printing and typesetting industry." +
                        " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, " +
                        "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                )
        );
        books.add(
                new Book(4,
                        "Abay Zhaoly",
                        "Mukhtar Auezov",
                        "Roman",
                        50000, "Lorem Ipsum is simply dummy text of" +
                        " the printing and typesetting industry." +
                        " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, " +
                        "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                )
        );
        books.add(
                new Book(5,
                        "I am Zlatan",
                        "Zlatan Ibrahimovic",
                        "Biography",
                        8000, "Lorem Ipsum is simply dummy text of" +
                        " the printing and typesetting industry." +
                        " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, " +
                        "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                )
        );
    }

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
