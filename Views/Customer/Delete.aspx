<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Customer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Delete Customer
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="full_w">
        <div class="h_title">Delete Customer</div>
        <section id="loginForm">
            <h3>Are you sure you want to delete this?</h3>
            <% using (Html.BeginForm())
               { %>
            <div class="display-label">
                <%: Html.LabelFor(model => model.UserProfile.UserName) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.UserProfile.UserName,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CustomerFirstName) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CustomerFirstName,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CustomerLastName) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CustomerLastName,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CustomerEmail) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CustomerEmail,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CustomerPhone) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CustomerPhone,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CustomerHomePhone) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CustomerHomePhone,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CustomerAddress) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CustomerAddress,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CustomerCity) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CustomerCity,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CustomerState) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CustomerState,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CustomerZip) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CustomerZip,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CustomerCountry) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CustomerCountry,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ShippingAddress) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ShippingAddress,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ShippingCity) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ShippingCity,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ShippingState) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ShippingState,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ShippingZip) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ShippingZip,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ShippingCountry) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ShippingCountry,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CustomerCreated) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CustomerCreated,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>
            <br />
            <br />

            <input type="submit" value="Delete" class="button cursor" />
            <%: Html.ActionLink("Edit", "Edit", "Customer", new { id=Model.CustomerId }, new {@class="button"})%>
            <%: Html.ActionLink("Back to List", "Index", "Customer", null, new {@class="button"})%>

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
