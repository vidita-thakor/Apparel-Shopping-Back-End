<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.ProductParam>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Create Attributes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="full_w">
        <div class="h_title">Create Attribute</div>

        <section id="loginForm">
            <% using (Html.BeginForm())
               { %>
            <%: Html.ValidationSummary(true) %>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ProductParamName) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ProductParamName) %>
                <%: Html.ValidationMessageFor(model => model.ProductParamName) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ProductParamDescription) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ProductParamDescription) %>
                <%: Html.ValidationMessageFor(model => model.ProductParamDescription) %>
            </div>

            <br />
            <br />
            <input type="submit" value="Create" class="button cursor" />
            <%: Html.ActionLink("Cancel", "Index", "Attribute", null, new {@class="button"})%>
            <%: Html.ActionLink("Back to List", "Index", "Attribute", null, new {@class="button"})%>
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
