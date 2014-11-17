<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.ProductParam>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Delete Attribute
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="full_w">
        <div class="h_title">Delete Attribute</div>

        <section id="loginForm">
            <h3>Are you sure you want to delete this?</h3>
             <% using (Html.BeginForm())
               { %>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.ProductParamName) %>
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.ProductParamName,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>

    <div class="editor-label">
        <%: Html.LabelFor(model => model.ProductParamDescription) %>
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.ProductParamDescription,new { disabled = "disabled", @readonly = "readonly" }) %>
    </div>
<br />
            <br />
            
               <input type="submit" value="Delete" class="button cursor"  />
               <%: Html.ActionLink("Edit", "Edit", "Attribute", new { id=Model.ProductParamId }, new {@class="button"})%>
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
</asp:Content>
