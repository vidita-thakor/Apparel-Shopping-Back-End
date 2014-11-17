<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.OrderItem>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>OrderItem</legend>

        <%: Html.HiddenFor(model => model.OrderItemId) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrderId, "Order") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("OrderId", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.OrderId) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.InventoryId, "Inventory") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("InventoryId", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.InventoryId) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ItemQuantity) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ItemQuantity) %>
            <%: Html.ValidationMessageFor(model => model.ItemQuantity) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ItemUnitPrice) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ItemUnitPrice) %>
            <%: Html.ValidationMessageFor(model => model.ItemUnitPrice) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ItemSubtotal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ItemSubtotal) %>
            <%: Html.ValidationMessageFor(model => model.ItemSubtotal) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
