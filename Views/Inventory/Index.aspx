<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<Administrator.Models.Inventory>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %> List Inventory
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="full_w">
    <div class="h_title">Manage Inventory </div>
    <br />
        <p><%: @Html.ActionLink("Create", "Create", "Inventory", null, new {@class="button add"})%></p>
    <div class="entry">
            <% using (Html.BeginForm())
               { %>
            <p>Search By Product, Size, Color: <%: @Html.TextBox("SearchString",ViewBag.CurrentFilter as string)%> &nbsp;&nbsp;<input type="submit" value="Search" class="button cursor" /></p>

            <% } %>
        </div>
    <div class="message-success">
            <%: ViewData["Success"] %>
        </div>
    <table>
    <tr>
        <th>
            <%: Html.ActionLink("Product Name", "Index", new { sortOrder=ViewBag.ProductSortParm, currentFilter=ViewBag.CurrentFilter })%>
        </th>
        <th>
            <%: Html.ActionLink("Size", "Index", new { sortOrder=ViewBag.SizeSortParm, currentFilter=ViewBag.CurrentFilter })%>
        </th>
        <th>
           <%: Html.ActionLink("Color", "Index", new { sortOrder=ViewBag.ColorSortParm, currentFilter=ViewBag.CurrentFilter })%>
        </th>
        <th>
            Quantity
        </th>
        <th>Modify</th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Product.ProductName) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ParamValue1.ParamValue1) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ParamValue.ParamValue1) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Quantity) %>
        </td>
        <td>
            <%: Html.ActionLink(" ", "Edit", new { id=item.InventoryId }, new {@class="table-icon edit"}) %> |
            <%: Html.ActionLink(" ", "Details", new { id=item.InventoryId }, new {@class="table-icon archive"}) %> |
            <%: Html.ActionLink(" ", "Delete", new { id=item.InventoryId }, new {@class="table-icon delete"}) %>
        </td>
    </tr>
<% } %>

</table>
    <div class="entry">
            <div class="pagination">
                Page <%: Model.PageCount < Model.PageNumber ? 0 : Model.PageNumber %> of <%: @Model.PageCount %>

                <% if (Model.HasPreviousPage)
                   { %>

                <%: Html.ActionLink("<<", "Index", new { page = 1, sortOrder = ViewBag.CurrentSort, currentFilter = ViewBag.CurrentFilter }) %>
                <%: Html.Raw(" ") %>
                <%: Html.ActionLink("< Prev", "Index", new { page = Model.PageNumber - 1, sortOrder = ViewBag.CurrentSort, currentFilter=ViewBag.CurrentFilter  }) %>

                <% 
                   }
                   else
                   { 
                %>
                 << 
                    <%: Html.Raw(" ") %>
                 < Prev 
             <%  
             }
             %>

                <% if (Model.HasNextPage)
                   {
                %>
                <%: Html.ActionLink("Next >", "Index", new { page = Model.PageNumber + 1, sortOrder = ViewBag.CurrentSort, currentFilter=ViewBag.CurrentFilter  }) %>
                <%: Html.Raw(" ") %>
                <%: Html.ActionLink(">>", "Index", new { page = Model.PageCount, sortOrder = ViewBag.CurrentSort, currentFilter=ViewBag.CurrentFilter  }) %>
                <% 
                }
                   else
                   { 
                %>
                Next >
                <%: Html.Raw(" ") %>
                >> 
              <% 
               } 
              %>
            </div>
            <div class="sep"></div>
            <%: @Html.ActionLink("Create", "Create", "Inventory", null, new {@class="button add"})%>
        </div>
    </div>




</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
