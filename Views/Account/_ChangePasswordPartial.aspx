<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.LocalPasswordModel>" %>

<section id="loginForm">
    <% using (Html.BeginForm("Manage", "Account"))
       { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>


    <%: Html.LabelFor(m => m.OldPassword)%>
    <%: Html.PasswordFor(m => m.OldPassword) %>
    <br />
    <%: Html.ValidationMessageFor(m => m.OldPassword) %>

    <%: Html.LabelFor(m => m.NewPassword) %>
    <%: Html.PasswordFor(m => m.NewPassword) %>
    <br />
    <%: Html.ValidationMessageFor(m => m.NewPassword) %>

    <%: Html.LabelFor(m => m.ConfirmPassword) %>
    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
    <br />
    <br />
    <input type="submit" value="Change Password" class="button cursor"/>
    <%: Html.ActionLink("Cancel", "Index", "Dashboard", null, new {@class="button"})%>
</section>
<% } %>
