<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Order>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Order Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="full_w">
        <div class="h_title">Create Orders</div>

        <section id="loginForm">
            <% using (Html.BeginForm())
               { %>
            <%: Html.ValidationSummary(true) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CustomerId, "Customer") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("CustomerFirstName", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.Customer.CustomerFirstName) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrderDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OrderDate) %>
            <%: Html.ValidationMessageFor(model => model.OrderDate) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrderSubtotal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OrderSubtotal) %>
            <%: Html.ValidationMessageFor(model => model.OrderSubtotal) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrderShippingCharges) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OrderShippingCharges) %>
            <%: Html.ValidationMessageFor(model => model.OrderShippingCharges) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrderTaxes) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OrderTaxes) %>
            <%: Html.ValidationMessageFor(model => model.OrderTaxes) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrderTotal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OrderTotal) %>
            <%: Html.ValidationMessageFor(model => model.OrderTotal) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrderStatus) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OrderStatus) %>
            <%: Html.ValidationMessageFor(model => model.OrderStatus) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrderTransactionId) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OrderTransactionId) %>
            <%: Html.ValidationMessageFor(model => model.OrderTransactionId) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrderPaymentStatus) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OrderPaymentStatus) %>
            <%: Html.ValidationMessageFor(model => model.OrderPaymentStatus) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrderShippedDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OrderShippedDate) %>
            <%: Html.ValidationMessageFor(model => model.OrderShippedDate) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrderCreated) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OrderCreated) %>
            <%: Html.ValidationMessageFor(model => model.OrderCreated) %>
        </div>

        <br />
            <br />
            <input type="submit" value="Create" class="button cursor" />
            <%: Html.ActionLink("Cancel", "Index", "Order", null, new {@class="button"})%>
            <%: Html.ActionLink("Back to List", "Index", "Order", null, new {@class="button"})%>
            <% } %>
        </section>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
