<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Page>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Edit Page
</asp:Content>
<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/jquery.cleditor.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="full_w">
        <div class="h_title">Edit Page</div>

        <section id="loginForm">
            <% using (Html.BeginForm())
               { %>
            <%: Html.ValidationSummary(true) %>

            <%: Html.HiddenFor(model => model.PageId) %>
            <%: Html.HiddenFor(model => model.PageUpdated) %>
            <%: Html.HiddenFor(model => model.PageTitle) %>


            <div class="editor-label">
                <%: Html.LabelFor(model => model.PageTitle )%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.PageTitle, new {@readonly = "readonly" }) %>
                (Field is in Read Only Mode)
                <%: Html.ValidationMessageFor(model => model.PageTitle) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.PageDescription) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.PageDescription,new { @id="input" }) %>
                <%: Html.ValidationMessageFor(model => model.PageDescription) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.PageCreated) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.PageCreated) %>
                <%: Html.ValidationMessageFor(model => model.PageCreated) %>
            </div>

            <br />
            <br />
            <input type="submit" value="Save" class="button cursor" />
            <%: Html.ActionLink("Cancel", "Index", "Page", null, new {@class="button"})%>
            <%: Html.ActionLink("Back to List", "Index", "Page", null, new {@class="button"})%>


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
