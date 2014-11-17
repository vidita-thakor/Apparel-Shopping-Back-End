<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.ProductImage>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Create Product Image
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Create Product Image</div>
        <section id="loginForm">
            <% using (Html.BeginForm("Create", "ProductImage", new { @pid = Request.Params["pid"] }, FormMethod.Post, new { enctype = "multipart/form-data" }))
               { %>
            <%: Html.ValidationSummary(true) %>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ProductId, "Product") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("ProductId", null,"--Select Product--") %>
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
                <%: Html.TextBoxFor(model => model.ImageName,new { type = "file" }) %>
                <%: Html.ValidationMessageFor(model => model.ImageName) %>
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
            <input type="submit" value="Create" class="button cursor" />
            <%: Html.ActionLink("Cancel", "Index", "Product", null, new {@class="button"})%>
            <%: Html.ActionLink("Back to List", "Index", "Product", null, new {@class="button"})%>


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
