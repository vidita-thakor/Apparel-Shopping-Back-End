<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Order>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Edit Orders
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Edit Orders</div>

        <section id="loginForm">

            <% using (Html.BeginForm())
               { %>
            <%: Html.ValidationSummary(true) %>

            <%: Html.HiddenFor(model => model.OrderId) %>
            <%: Html.HiddenFor(model => model.OrderUpdated) %>
            <%: Html.HiddenFor(model => model.CustomerId) %>
            <%: Html.HiddenFor(model => model.OrderDate) %>
            <%: Html.HiddenFor(model => model.OrderSubtotal) %>
            <%: Html.HiddenFor(model => model.OrderShippingCharges) %>
            <%: Html.HiddenFor(model => model.OrderTaxes) %>
            <%: Html.HiddenFor(model => model.OrderTransactionId) %>


            <%: Html.HiddenFor(model => model.OrderCreated) %>


            <div class="editor-label">
                <%: Html.LabelFor(model => model.OrderStatus) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.OrderStatus) %>
                <%: Html.ValidationMessageFor(model => model.OrderStatus) %>
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
            <br />
            <br />
            <input type="submit" value="Save" class="button cursor" />

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
