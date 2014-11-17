<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.ParamValue>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Delete Attribute Value
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Delete Attribute Values</div>

        <section id="loginForm">
            <h3>Are you sure you want to delete this?</h3>
            <% using (Html.BeginForm())
               { %>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ProductParam.ProductParamName) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.ProductParam.ProductParamName,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ParamValue1) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.ParamValue1,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>
            <br />
            <br />

            <input type="submit" value="Delete" class="button cursor" />
            <%: Html.ActionLink("Edit", "Edit", "AttributeValues", new { id=Model.ParamValue1 }, new {@class="button"})%>
            <%: Html.ActionLink("Back to List", "Index", "AttributeValues", null, new {@class="button"})%>

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
