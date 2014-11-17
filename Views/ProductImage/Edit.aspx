<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.ProductImage>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Edit Product Image
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Edit Product Image</div>
        <% using (Html.BeginForm(null, null, null, FormMethod.Post, new { enctype = "multipart/form-data" }))
           { %>
        <%: Html.ValidationSummary(true) %>
        <%: Html.HiddenFor(model => model.ImageId) %>
        
        <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductId, "Product") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("ProductId",null,"--Select Product--") %>
            <%: Html.ValidationMessageFor(model => model.ProductId) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ImageTitle) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ImageTitle) %>
            <%: Html.ValidationMessageFor(model => model.ImageTitle) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ImageAltText) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ImageAltText) %>
            <%: Html.ValidationMessageFor(model => model.ImageAltText) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ImageName) %>
        </div>
        <div class="editor-field">
           <input type="file" name="ImageName" />
            
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ImageIsMain) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ImageIsMain) %>
            <%: Html.ValidationMessageFor(model => model.ImageIsMain) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ImageCreated) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ImageCreated) %>
            <%: Html.ValidationMessageFor(model => model.ImageCreated) %>
        </div>

        <br />
        <br />
        <input type="submit" value="Save" class="button cursor" />
        <%: Html.ActionLink("Cancel", "Index", "ProductImage", null, new {@class="button"})%>
        <%: Html.ActionLink("Back to List", "Index", "ProductImage", null, new {@class="button"})%>
        <% } %>

      
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
