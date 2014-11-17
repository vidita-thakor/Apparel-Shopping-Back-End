<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<% if (Request.IsAuthenticated)
   { %>

    <span class="left">Welcome, <strong><%: Html.ActionLink(User.Identity.Name, "Manage", "Account", routeValues: null, htmlAttributes: new { @class = "username", title = "Manage" }) %>!</strong></span>
    <% using (Html.BeginForm("LogOff", "Account", FormMethod.Post, new { id = "logoutForm" }))
       { %>
    <%: Html.AntiForgeryToken() %>
        [ <a href="javascript:document.getElementById('logoutForm').submit()">Logout</a> ]
    <% } %>
    <% } %>

