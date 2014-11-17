<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.LocalPasswordModel>" %>

<asp:Content ID="manageTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Apparel Shopping - Administrator Panel - Manage Account
</asp:Content>

<asp:Content ID="manageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
    <div class="h_title">Change Password <span class="right">You're logged in as <strong><%: User.Identity.Name %></strong>.</span></div>

   <p class="message-success"><%: (string)ViewBag.StatusMessage %></p>

    <% if (ViewBag.HasLocalPassword) {
        Html.RenderPartial("_ChangePasswordPartial");
    } else {
        Html.RenderPartial("_SetPasswordPartial");
    } %>
    </div>
</asp:Content>

