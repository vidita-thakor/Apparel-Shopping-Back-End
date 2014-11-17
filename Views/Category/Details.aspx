<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Category>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Details Category
</asp:Content>
<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/jquery.cleditor.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="full_w">
        <div class="h_title">Details Category</div>
        <section id="loginForm">
            <% using (Html.BeginForm())
               { %>
            <div class="display-label">
                <%: Html.LabelFor(model => model.CategoryName) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CategoryName,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>
             <div class="display-label">
                <%: Html.LabelFor(model => model.ParentCategoryId) %>
            </div>
            <div class="display-field">
                <%: Html.DropDownList("ParentCategoryId",null,"--Select Parent Category--",new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>
            <div class="display-label">
                <%: Html.LabelFor(model => model.CategoryDescription) %>
            </div>
            <div class="display-field">
                <%: Html.TextAreaFor(model => model.CategoryDescription,new {@id="input", disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CategoryUrl) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CategoryUrl,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.CategoryCreated) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.CategoryCreated,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>
            <br />
            <br />
            <p> 
                <%: Html.ActionLink("Edit", "Edit", new { id=Model.CategoryId }, new {@class="button"}) %>
                <%: Html.ActionLink("Back to List", "Index",null, new {@class="button"}) %>
            </p>
            <% } %>
        </section>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
     <script type="text/javascript" src="../../Scripts/jquery.cleditor.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#input").cleditor({ width: 500, height: 180, useCSS: true })[0].focus();
        });
    </script>
</asp:Content>
