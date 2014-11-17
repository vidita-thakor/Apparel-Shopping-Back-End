<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<Administrator.Models.Product>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>List Product
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="full_w">
        <div class="h_title">Manage Products </div>
        <br />
        <p><%: @Html.ActionLink("Create", "Create", "Product", null, new {@class="button add"})%></p>
        <div class="entry">
            <% using (Html.BeginForm())
               { %>
            <p>Search By Name, Category: <%: @Html.TextBox("SearchString",ViewBag.CurrentFilter as string)%> &nbsp;&nbsp;<input type="submit" value="Search" class="button cursor" /></p>

            <% } %>
        </div>
        <div class="message-success">
            <%: ViewData["Success"] %>
        </div>
        <table>
            <tr>
                <th>
                    <%: Html.ActionLink("Name", "Index", new { sortOrder=ViewBag.NameSortParm, currentFilter=ViewBag.CurrentFilter })%>
                </th>
                <th>
                    <%: Html.ActionLink("Category", "Index", new { sortOrder=ViewBag.CategorySortParm, currentFilter=ViewBag.CurrentFilter })%>
                </th>
                <th scope="col" style="width: 50px;">
                    <%: Html.ActionLink("Price", "Index", new { sortOrder=ViewBag.PriceSortParm, currentFilter=ViewBag.CurrentFilter })%>
                </th>
                <th scope="col" style="width: 116px;">
                    <%: Html.ActionLink("Created", "Index", new { sortOrder=ViewBag.DateSortParm, currentFilter=ViewBag.CurrentFilter })%>
                </th>
                <th scope="col" style="width: 20px;">Images</th>
                <th scope="col" style="width: 80px;">Modify</th>
            </tr>

            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.ProductName) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.Category.CategoryName) %>
                </td>

                <td>
                    <%: Html.DisplayFor(modelItem => item.ProductPrice) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.ProductCreated) %>
                </td>
                <td>
                    <%: Html.ActionLink(" ", "Index", "ProductImage", new { pid=item.ProductId }, new {@class="table-icon image"}) %>
                </td>
                <td>
                    <%: Html.ActionLink(" ", "Edit", new { id=item.ProductId },new {@class="table-icon edit"}) %> |
                    <%: Html.ActionLink(" ", "Details", new { id=item.ProductId }, new {@class="table-icon archive"}) %> |
                    <%: Html.ActionLink(" ", "Delete", new { id=item.ProductId }, new {@class="table-icon delete"}) %>
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
            <%: @Html.ActionLink("Create", "Create", "Product", null, new {@class="button add"})%>
        </div>
    </div>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
