<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.techorda.db.Author" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>Books</title>
      <%@include file="head.jsp"%>
  </head>
  <body>
        <div class="container">
            <%@include file="navbar.jsp"%>
        </div>
        <div class="container mt-5">
            <div class="row mt-3">
                <div class="col-12">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addAuthor">
                        + ADD AUTHOR
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="addAuthor" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Add Author</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="/add-author" method="post">
                                        <div class="row">
                                            <div class="col-12">
                                                <label>FIRST NAME: </label>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-12">
                                                <input type="text" class="form-control" name="first_name">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label> LAST NAME: </label>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-12">
                                                <input type="text" class="form-control" name="last_name">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label> INSTAGRAM: </label>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-12">
                                                <input type="text" class="form-control" name="instagram">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <button type="submit" class="btn btn-success">ADD AUTHOR</button>
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>FIRST NAME</th>
                            <th>LAST NAME</th>
                            <th>INSTAGRAM</th>
                            <th style="width: 10%;">DETAILS</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ArrayList<Author> authors = (ArrayList<Author>) request.getAttribute("authors");
                            if(authors!=null){
                                for (Author author:authors){
                        %>
                                <tr>
                                    <td><%=author.getId()%></td>
                                    <td><%=author.getFirst_name()%></td>
                                    <td><%=author.getLast_name()%></td>
                                    <td><%=author.getInstagram()%></td>
                                    <td>
                                        <a class="btn btn-success btn-sm" href="/">DETAILS</a>
                                    </td>
                                </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
  </body>
</html>
