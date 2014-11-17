<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Login.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.LoginModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
Apparel Shopping - Administrator Panel - Log In
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
 
    <section id="loginForm">
    <span class="headingtitle">Administrator Panel</span>
    <% using (Html.BeginForm(new { ReturnUrl = ViewBag.ReturnUrl })) { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary(true) %>

           <asp:Label ID="login" runat="server" Text="Label"><%: Html.LabelFor(m => m.UserName) %></asp:Label>
           <%: Html.TextBoxFor(m => m.UserName) %>
           <br/>
           <%: Html.ValidationMessageFor(m => m.UserName) %>
                
           <asp:Label ID="Label1" runat="server" Text="Label"><%: Html.LabelFor(m => m.Password) %></asp:Label>   
           <%: Html.PasswordFor(m => m.Password) %>
           <br/>
           <%: Html.ValidationMessageFor(m => m.Password) %>
                    
           <br />
           <%: Html.CheckBoxFor(m => m.RememberMe) %>
           <%: Html.LabelFor(m => m.RememberMe, new { @class = "checkbox" }) %>
           <div class="sep"></div>
            <input type="submit" value="Log in" class="ok" />
            
    <% } %>
    </section>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>