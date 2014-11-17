<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Customer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Create Customer
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="full_w">
        <div class="h_title">Create Customer</div>
        <section id="loginForm">
            <% using (Html.BeginForm())
               { %>
            <%: Html.ValidationSummary(true) %>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.UserId, "UserProfile") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("UserId", null, "--Select User Name--") %>
                <%: Html.ValidationMessageFor(model => model.UserId) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CustomerFirstName) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CustomerFirstName) %>
                <%: Html.ValidationMessageFor(model => model.CustomerFirstName) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CustomerLastName) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CustomerLastName) %>
                <%: Html.ValidationMessageFor(model => model.CustomerLastName) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CustomerEmail) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CustomerEmail) %>
                <%: Html.ValidationMessageFor(model => model.CustomerEmail) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CustomerPhone) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CustomerPhone) %>
                <%: Html.ValidationMessageFor(model => model.CustomerPhone) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CustomerHomePhone) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CustomerHomePhone) %>
                <%: Html.ValidationMessageFor(model => model.CustomerHomePhone) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CustomerAddress) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CustomerAddress) %>
                <%: Html.ValidationMessageFor(model => model.CustomerAddress) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CustomerCity) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CustomerCity) %>
                <%: Html.ValidationMessageFor(model => model.CustomerCity) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CustomerState) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CustomerState) %>
                <%: Html.ValidationMessageFor(model => model.CustomerState) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CustomerZip) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CustomerZip) %>
                <%: Html.ValidationMessageFor(model => model.CustomerZip) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CustomerCountry) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CustomerCountry) %>
                <%: Html.ValidationMessageFor(model => model.CustomerCountry) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ShippingAddress) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ShippingAddress) %>
                <%: Html.ValidationMessageFor(model => model.ShippingAddress) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ShippingCity) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ShippingCity) %>
                <%: Html.ValidationMessageFor(model => model.ShippingCity) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ShippingState) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ShippingState) %>
                <%: Html.ValidationMessageFor(model => model.ShippingState) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ShippingZip) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ShippingZip) %>
                <%: Html.ValidationMessageFor(model => model.ShippingZip) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ShippingCountry) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ShippingCountry) %>
                <%: Html.ValidationMessageFor(model => model.ShippingCountry) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CustomerCreated) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CustomerCreated) %>
                <%: Html.ValidationMessageFor(model => model.CustomerCreated) %>
            </div>

            <br />
            <br />
            <input type="submit" value="Create" class="button cursor" />
            <%: Html.ActionLink("Cancel", "Index", "Customer", null, new {@class="button"})%>
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
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
