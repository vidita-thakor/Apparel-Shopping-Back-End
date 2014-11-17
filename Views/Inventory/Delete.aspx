<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Inventory>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Delete Inventory
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Details Inventory</div>
        <h3>Are you sure you want to delete this?</h3>
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

            <input type="submit" value="Delete" class="button cursor" />
            <%: Html.ActionLink("Edit", "Edit", "Inventory", new { id=Model.InventoryId }, new {@class="button"})%>
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
</asp:Content>
