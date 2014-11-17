<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<Administrator.Models.Order>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>List Orders
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Manage Orders </div>
        <br />
        <div class="entry">
            <% using (Html.BeginForm())
               { %>
            <p>Search By Customer Name: <%: @Html.TextBox("SearchString",ViewBag.CurrentFilter as string)%> &nbsp;&nbsp;<input type="submit" value="Search" class="button cursor" /></p>

            <% } %>
        </div>

        <div class="message-success">
            <%: ViewData["Success"] %>
        </div>
        <table>
            <thead>
                <tr>
                    <th scope="col" style="width: 20px;"><%: Html.ActionLink("Order Id", "Index", new { sortOrder=ViewBag.NameSortParm, currentFilter=ViewBag.CurrentFilter })%></th>
                    <th scope="col" style="width: 60px;"><%: Html.ActionLink("First Name", "Index", new { sortOrder=ViewBag.NameSortParm, currentFilter=ViewBag.CurrentFilter })%></th>
                    <th scope="col" style="width: 60px;"><%: Html.ActionLink("Last Name", "Index", new { sortOrder=ViewBag.NameSortParm, currentFilter=ViewBag.CurrentFilter })%></th>
                    <th scope="col" style="width: 20px;"><%: Html.ActionLink("Date", "Index", new { sortOrder=ViewBag.NameSortParm, currentFilter=ViewBag.CurrentFilter })%></th>
                    <th scope="col" style="width: 15px;"><%: Html.ActionLink("Total", "Index", new { sortOrder=ViewBag.NameSortParm, currentFilter=ViewBag.CurrentFilter })%></th>
                    <th scope="col" style="width: 60px;"><%: Html.ActionLink("Status", "Index", new { sortOrder=ViewBag.NameSortParm, currentFilter=ViewBag.CurrentFilter })%></th>
                    <th style="width: 10px;" scope="col">Modify</th>
                </tr>
            </thead>
            <tbody>
                <% foreach (var item in Model)
                   { %>
                <tr>
                    <td>
                        <%: Html.DisplayFor(modelItem => item.OrderId) %>
                    </td>
                    <td>
                        <%: Html.DisplayFor(modelItem => item.Customer.CustomerFirstName) %>
                    </td>
                    <td>
                        <%: Html.DisplayFor(modelItem => item.Customer.CustomerLastName) %>
                    </td>
                    <td>
                        <%: Html.DisplayFor(modelItem => item.OrderDate) %>
                    </td>
                    <td>
                        <%: Html.DisplayFor(modelItem => item.OrderTotal) %>
                    </td>
                    <td>
                        <%: Html.DisplayFor(modelItem => item.OrderStatus) %>
                    </td>
                    <td>
                        <%: Html.ActionLink(" ", "Edit", new { id=item.OrderId },new {@class="table-icon edit"}) %> |
            <%: Html.ActionLink(" ", "Details", new { id=item.OrderId },new {@class="table-icon archive"}) %>
                    </td>
                </tr>
                <% } %>
            </tbody>

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
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
