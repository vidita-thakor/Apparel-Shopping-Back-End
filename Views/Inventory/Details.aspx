<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Inventory>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Details Inventory
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Details Inventory</div>
        <section id="loginForm">
            <% using (Html.BeginForm())
               { %>
            <div class="display-label">
                <%: Html.LabelFor(model => model.Product.ProductName) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.Product.ProductName,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                Size
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ParamValue1.ParamValue1,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                Color
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ParamValue.ParamValue1,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.Quantity) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.Quantity,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>
            <br />
            <br />
            <p>
                <%: Html.ActionLink("Edit", "Edit", new { id=Model.InventoryId }, new {@class="button"}) %>
                <%: Html.ActionLink("Back to List", "Index",null, new {@class="button"}) %>
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
