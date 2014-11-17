<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Inventory>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Edit Inventory
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="full_w">
        <div class="h_title">Edit Inventory</div>
        <section id="loginForm">
            <% using (Html.BeginForm())
               { %>
            <%: Html.ValidationSummary(true) %>

            <%: Html.HiddenFor(model => model.InventoryId) %>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ProductId, "Product") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("ProductId",null,"--Select Product--") %>
                <%: Html.ValidationMessageFor(model => model.ProductId) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ParamSizeValueId, "Size") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("ParamSizeValueId",null,"--Select Size--") %>
                <%: Html.ValidationMessageFor(model => model.ParamSizeValueId) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ParamColorValueId, "Color") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("ParamColorValueId",null,"--Select Color--") %>
                <%: Html.ValidationMessageFor(model => model.ParamColorValueId) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Quantity) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Quantity) %>
                <%: Html.ValidationMessageFor(model => model.Quantity) %>
            </div>

            <br />
            <br />
            <input type="submit" value="Save" class="button cursor" />
            <%: Html.ActionLink("Cancel", "Index", "Inventory", null, new {@class="button"})%>
            <%: Html.ActionLink("Back to List", "Index", "Inventory", null, new {@class="button"})%>

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
