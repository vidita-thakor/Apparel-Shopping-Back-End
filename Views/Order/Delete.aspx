<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Order>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>Order</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Customer.CustomerFirstName) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Customer.CustomerFirstName) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.OrderDate) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrderDate) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.OrderSubtotal) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrderSubtotal) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.OrderShippingCharges) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrderShippingCharges) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.OrderTaxes) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrderTaxes) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.OrderTotal) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrderTotal) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.OrderStatus) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrderStatus) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.OrderTransactionId) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrderTransactionId) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.OrderPaymentStatus) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrderPaymentStatus) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.OrderShippedDate) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrderShippedDate) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.OrderCreated) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrderCreated) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
