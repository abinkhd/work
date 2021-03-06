<%@page import="db.tables.Category"%>
<%@page import="db.tables.Sub_Category"%>
<%@page import="util.Variables"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.DBProcess"%>

<%
    Object obj = session.getAttribute("al");
    if (obj == null) {
        response.sendRedirect("admin_login.jsp");
    }
%>

<html>
    <head>
        <title>Sub Category List</title>
        <style>
            table{
                color:white;
            }
        </style>

    </head>

    <body background="static/images/add.jpg" style="background-size: cover; background-repeat: no-repeat;">

    <center>
        <!--<h1 ><font color="#366092"><%=Variables.prjName%></font></h1>-->
            <%@include file="admin_settings_menu.jsp" %>
        <!--<h2><font color="#366092">Sub Category List</font></h2>-->
        <a href="admin_sub_category_add.jsp" >Add Sub Category</a><br><br>

        <form>
            <%
                //20. designation_settings - id,designation_name
            %>
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th> Name</th>
                    <th> Description</th>
                    <th> Category</th>
                    <th> Action </th>
                </tr>
                <%
                    DBProcess dbp = new DBProcess();
                    dbp.open();
                    ArrayList<Sub_Category> dsList = dbp.selectAll_sub_category();
                    dbp.close();

                    if (dsList.size() == 0) {
                %>
                <tr>
                    <td>No</td>
                    <td>Data</td>
                    <td>----</td>



                </tr>
                <%
                } else {
                    for (Sub_Category ds : dsList) {
                        dbp = new DBProcess();
                        dbp.open();
                        Category cobj = dbp.select_category(ds.category_id);
                        dbp.close();
                %>
                <tr>
                    <td><%=ds.id%></td>
                    <td>
                        &nbsp;<%=ds.sub_name%>&nbsp;
                    </td>
                    <td>
                        &nbsp;<%=ds.sub_desc%>&nbsp;
                    </td>
                    <td>
                        &nbsp;<%=cobj.category_name%>&nbsp;
                    </td>
                    <td>
                        &nbsp; <a href="admin_sub_category_delete_action.jsp?id=<%=ds.id%>"><span class="btn btn-danger">Delete</span></a>  
                        &nbsp;
                    </td>
                </tr>
                <%
                        }
                    }
                    dbp.close();
                %>
            </table>

        </form>
            <a href="admin_sub_category_add.jsp" ><span style="color: rgb(234, 151, 7); font-size: 30px;">Add Sub Category</span></a>
    </center>    

</body>
</html>
