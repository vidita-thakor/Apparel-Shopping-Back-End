<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Category>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Create Category
</asp:Content>
<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/jquery.cleditor.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="full_w">
        <div class="h_title">Create Category</div>

        <section id="loginForm">
            <% using (Html.BeginForm())
               { %>
            <%: Html.ValidationSummary(true) %>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CategoryName) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CategoryName) %>
                <%: Html.ValidationMessageFor(model => model.CategoryName) %>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ParentCategoryId) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("ParentCategoryId",(SelectList) ViewBag.ParentCategoryId, "--Select Parent Category--") %>
                <%: Html.ValidationMessageFor(model => model.ParentCategoryId) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CategoryDescription) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.CategoryDescription,new { @id="input" }) %>
                <%: Html.ValidationMessageFor(model => model.CategoryDescription) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CategoryUrl) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CategoryUrl) %>
                <%: Html.ValidationMessageFor(model => model.CategoryUrl) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CategoryCreated) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CategoryCreated) %>
                <%: Html.ValidationMessageFor(model => model.CategoryCreated) %>
            </div>

            <br />
            <br />
            <input type="submit" value="Create" class="button cursor" />
            <%: Html.ActionLink("Cancel", "Index", "Category", null, new {@class="button"})%>
            <%: Html.ActionLink("Back to List", "Index", "Category", null, new {@class="button"})%>
            <% } %>
        </section>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
     <script type="text/javascript" src="../../Scripts/jquery.cleditor.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#input").cleditor({ width: 500, height: 180, useCSS: true })[0].focus();
        });
    </script>
</asp:Content>
