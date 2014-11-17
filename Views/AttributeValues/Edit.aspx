<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.ParamValue>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Edit Attribute Values
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Edit Attribute</div>

        <section id="loginForm">

            <% using (Html.BeginForm())
               { %>
            <%: Html.ValidationSummary(true) %>

            <%: Html.HiddenFor(model => model.ParamValueId) %>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ProductParamId, "ProductParam") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("ProductParamId", null,"--Select Attribute--") %>
                <%: Html.ValidationMessageFor(model => model.ProductParamId) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.ParamValue1) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ParamValue1) %>
                <%: Html.ValidationMessageFor(model => model.ParamValue1) %>
            </div>
            <br />
            <br />
            <input type="submit" value="Save" class="button cursor" />

            <%: Html.ActionLink("Cancel", "Index", "AttributeValues", null, new {@class="button"})%>
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
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
