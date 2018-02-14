<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.LogRecord" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<table class="w3-table w3-striped w3-bordered" id="productTransTable">
    <tr>
        <th>
            User ID
        </th>
        <th>
            User Name
        </th>

        <th>
            Description
        </th>
        <th>
            Date
        </th>

        <th>


        </th>
    </tr>
    <%
        EntityManager entityManager = new EntityManager();
        List<Entity> logRecords = entityManager.getOrderedEntities(LogRecord.class, "date", false );
        for(Entity entity : logRecords){
            LogRecord logRecord = (LogRecord) entity;

    %>
    <tr>
        <td><%=logRecord.getUser().getUserId()%></td>
        <td><%=logRecord.getUser().getName()%></td>
        <td><%=logRecord.getAction()%></td>
        <td><%=logRecord.getDate()%></td>
    </tr>
    <%
        }
    %>
</table>