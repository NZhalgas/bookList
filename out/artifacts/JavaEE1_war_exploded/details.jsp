<%@ page import="kz.bitlab.techorda.db.Book" %>
<%@ page import="kz.bitlab.techorda.db.DBManager" %>
<%@ page import="kz.bitlab.techorda.db.Author" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>Book store</title>
    <%@include file="head.jsp"%>
  </head>
  <body>
    <%@include file="navbar.jsp"%>
    <div class="container mt-5 pb-4">
      <%
        Book book = (Book) request.getAttribute("kniga");
        if (book != null){
      %>
      <div class = "row">
        <div class="col-6 mx-auto">
            <div class="row">
              <div class="col-12">
                <label> NAME: </label>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-12">
                <input type="text" class="form-control" readonly value="<%=book.getName()%>">
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-12">
                <label> AUTHOR: </label>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-12">
                <input type="text" class="form-control" readonly
                       value="<%=book.getAuthor().getFirst_name()+" "+book.getAuthor().getLast_name()%>">
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-12">
                <label> GENRE: </label>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-12">
                <input type="text" class="form-control" readonly value="<%=book.getGenre()%>">
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-12">
                <label> PRICE: </label>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-12">
                <input type="number" class="form-control" readonly value="<%=book.getPrice()%>">
              </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label> DESCRIPTION: </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <textarea class="form-control" rows="10" readonly><%=book.getDescription()%></textarea>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editBook">
                        Edit Book
                    </button>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-danger btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#deleteBook">
                        Delete Book
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="deleteBook" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/delete-book" method="post">
                                    <input type="hidden" name="id" value="<%=book.getId()%>">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" >Delete book</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <h5 class="text-center">Are you sure?</h5>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                        <button class="btn btn-danger">Yes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="editBook" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit Book</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="/save-book" method="post">
                                        <input type="hidden" name="book_id" value="<%=book.getId()%>">
                                        <div class="row">
                                            <div class="col-12">
                                                <label> NAME: </label>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-12">
                                                <input type="text" class="form-control" name="book_name" value="<%=book.getName()%>">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label> AUTHOR: </label>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-12">
                                                <select class="form-select" name="book_author">
                                                    <%
                                                        ArrayList<Author> authors = (ArrayList<Author>) request.getAttribute("authors");
                                                        if(authors!=null){
                                                            for(Author author:authors){
                                                    %>
                                                    <option <%=(author.getId()==book.getAuthor().getId()?"selected":"")%>
                                                            value="<%=author.getId()%>"><%=author.getFirst_name()+" "+author.getLast_name()%></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label> GENRE: </label>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-12">
                                                <select class="form-select" name="book_genre" <%=book.getGenre()%>>
                                                    <option <%=book.getGenre().equals("Fantasy")?"selected":""%>>Fantasy</option>
                                                    <option <%=book.getGenre().equals("Roman")?"selected":""%>>Roman</option>
                                                    <option <%=book.getGenre().equals("Biography")?"selected":""%>>Biography</option>
                                                    <option <%=book.getGenre().equals("Horror")?"selected":""%>>Horror</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label> PRICE: </label>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-12">
                                                <input type="number" class="form-control" name="book_price" value="<%=book.getPrice()%>">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label> DESCRIPTION: </label>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-12">
                                                <textarea class="form-control" name="book_description" rows="5"><%=book.getDescription()%></textarea>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <button class="btn btn-primary">Save</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
      <%
        }else{
      %>
        <h3 class="text-center">BOOK NOT FOUND</h3>
      <%
        }
      %>
    </div>
  </body>
</html>
