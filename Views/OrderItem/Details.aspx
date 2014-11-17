<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.OrderItem>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>OrderItem</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Order.OrderStatus) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Order.OrderStatus) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Inventory.InventoryId) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Inventory.InventoryId) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.ItemQuantity) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ItemQuantity) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.ItemUnitPrice) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ItemUnitPrice) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.ItemSubtotal) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ItemSubtotal) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.OrderItemId }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
