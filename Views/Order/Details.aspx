<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Order>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Order Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="full_w">
        <div class="h_title">Order Details</div>
        <section id="loginForm">
             <% using (Html.BeginForm())
               { %>
            
    <div class="display-label">
        <%: Html.LabelFor(model => model.OrderId) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.OrderId,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>
    <div class="display-label">
        <%: Html.LabelFor(model => model.Customer.CustomerFirstName) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.Customer.CustomerFirstName,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>
    <div class="display-label">
        <%: Html.LabelFor(model => model.Customer.CustomerLastName) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.Customer.CustomerLastName,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>
    <div class="display-label">
        <%: Html.LabelFor(model => model.OrderDate) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.OrderDate,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>

    <div class="display-label">
        <%: Html.LabelFor(model => model.OrderSubtotal) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.OrderSubtotal,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>

    <div class="display-label">
        <%: Html.LabelFor(model => model.OrderShippingCharges) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.OrderShippingCharges,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>

    <div class="display-label">
        <%: Html.LabelFor(model => model.OrderTaxes) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.OrderTaxes,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>

    <div class="display-label">
        <%: Html.LabelFor(model => model.OrderTotal) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.OrderTotal,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>

    <div class="display-label">
        <%: Html.LabelFor(model => model.OrderStatus) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.OrderStatus,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>

    <div class="display-label">
        <%: Html.LabelFor(model => model.OrderTransactionId) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.OrderTransactionId,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>

    <div class="display-label">
        <%: Html.LabelFor(model => model.OrderPaymentStatus) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.OrderPaymentStatus,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>

    <div class="display-label">
        <%: Html.LabelFor(model => model.OrderShippedDate) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.OrderShippedDate,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>

    <div class="display-label">
        <%: Html.LabelFor(model => model.OrderCreated) %>
    </div>
    <div class="display-field">
        <%: Html.TextBoxFor(model => model.OrderCreated,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>
<br />
            <br />
            <p>
             <%: Html.ActionLink("Edit", "Edit", "Order", new { id=Model.OrderId }, new {@class="button"})%>
             <%: Html.ActionLink("Back to List", "Index", "Order", null, new {@class="button"})%>
             <%: Html.ActionLink("More Details", "Index", "OrderItem", new { id=Model.OrderId }, new {@class="button"})%>
              
                 </p>
               
             <% } %>
               </section>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
