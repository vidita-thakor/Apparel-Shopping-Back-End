<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Apparel Shopping - Administrator Panel - Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="full_w">
        <div class="h_title">Register <span class="right">Create a new account.</span></div>

    <p class="message-success"><%: (string)ViewBag.StatusMessage %></p>

    <section id="loginForm">
    <% using (Html.BeginForm())
       { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary() %>


    <%: Html.LabelFor(m => m.UserName) %>
    <%: Html.TextBoxFor(m => m.UserName) %>
    <br />
    <%: Html.ValidationMessageFor(m => m.UserName) %>

    <%: Html.LabelFor(m => m.Password) %>
    <%: Html.PasswordFor(m => m.Password) %>
    <br />
    <%: Html.ValidationMessageFor(m => m.Password) %>

    <%: Html.LabelFor(m => m.ConfirmPassword) %>
    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
    <br />
    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
    <br />
    <br />
    <input type="submit" value="Register" class="button cursor" />
    <%: Html.ActionLink("Cancel", "Index", "Customer", null, new {@class="button"})%>
    </section>

    <% } %>
        </div>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
