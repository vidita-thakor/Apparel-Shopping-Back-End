<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Page>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Details Page
</asp:Content>
<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/jquery.cleditor.css" type="text/css" rel="stylesheet" media="screen" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Details Page</div>
        <section id="loginForm">
             <% using (Html.BeginForm())
               { %>
            <div class="display-label">
                <%: Html.LabelFor(model => model.PageTitle) %>
            </div>
            <div class="display-field">
                
                <%: Html.TextBoxFor(model => model.PageTitle,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.PageDescription) %>
            </div>
            <div class="display-field">
                <%: Html.TextAreaFor(model => model.PageDescription,new { @id="input", disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.PageCreated) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.PageCreated,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>
            <br />
            <br />
            <p>
             <%: Html.ActionLink("Edit", "Edit", "Page", new { id=Model.PageId }, new {@class="button"})%>
             <%: Html.ActionLink("Back to List", "Index", "Page", null, new {@class="button"})%>
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
