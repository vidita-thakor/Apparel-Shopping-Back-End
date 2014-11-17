<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Product>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Edit Product
</asp:Content>
<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/jquery.cleditor.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="full_w">
    <div class="h_title">Edit Product</div>
    <section id="loginForm">
        <% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    
        <%: Html.HiddenFor(model => model.ProductId) %>
        <%: Html.HiddenFor(model => model.ProductUpdated) %>
          <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductName) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ProductName) %>
            <%: Html.ValidationMessageFor(model => model.ProductName) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CategoryId, "Category") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("CategoryId",null,"--Select Category--") %>
            <%: Html.ValidationMessageFor(model => model.CategoryId) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductShortDescription) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.ProductShortDescription,new { @id="input1" }) %>
            <%: Html.ValidationMessageFor(model => model.ProductShortDescription) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductLongDescription) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.ProductLongDescription,new { @id="input2" }) %>
            <%: Html.ValidationMessageFor(model => model.ProductLongDescription) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductUrl) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ProductUrl) %>
            <%: Html.ValidationMessageFor(model => model.ProductUrl) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductPrice) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ProductPrice) %>
            <%: Html.ValidationMessageFor(model => model.ProductPrice) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductDeliveryTxt) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.ProductDeliveryTxt,new { @id="input3" }) %>
            <%: Html.ValidationMessageFor(model => model.ProductDeliveryTxt) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductReturnsTxt) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.ProductReturnsTxt,new { @id="input4" }) %>
            <%: Html.ValidationMessageFor(model => model.ProductReturnsTxt) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductInfoCareTxt) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.ProductInfoCareTxt,new { @id="input5" }) %>
            <%: Html.ValidationMessageFor(model => model.ProductInfoCareTxt) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductCreated) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ProductCreated) %>
            <%: Html.ValidationMessageFor(model => model.ProductCreated) %>
        </div>

            <br />
            <br />
            <input type="submit" value="Save" class="button cursor" />
            <%: Html.ActionLink("Cancel", "Index", "Product", null, new {@class="button"})%>
            <%: Html.ActionLink("Back to List", "Index", "Product", null, new {@class="button"})%>

   
<% } %>


        </section>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <script type="text/javascript" src="../../Scripts/jquery.cleditor.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("textarea").cleditor({ width: 500, height: 180, useCSS: true });
        });
    </script>
</asp:Content>
