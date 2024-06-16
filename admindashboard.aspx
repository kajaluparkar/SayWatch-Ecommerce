<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admindashboard.aspx.cs" Inherits="SayWatch_Ecommerce.admindashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
      /* styles.css */

/* styles.css */

table {
    width: 100%;
    border-collapse: collapse;
    font-family: Arial, sans-serif; /* Change font */
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
    color: #333;
}

td {
    background-color: #ffffff; /* Change the background color of td */
    color: #333; /* Text color */
}

tr:nth-child(even) td {
    background-color: #f9f9f9; /* Background color for even rows */
}

tr:hover td {
    background-color: #ddd; /* Hover color */
}

button {
    background-color: #4CAF50; /* Green */
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
}

button:hover {
    background-color: #45a049;
}
th,td{
    text-align:center;

}
td{
    font-family:'Bookman Old Style';
    color:darkred;
}

  </style> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <!-- Other content of admin dashboard -->
        <% if (Session["AlertMessage"] != null && Session["AlertType"] != null) { %>
            <div id="alertMessage" class="alert alert-dismissible fade show alert-<%= Session["AlertType"] %>" role="alert">
                <strong><%= Session["AlertMessage"] %></strong>
                <button type="button" class="close" aria-label="Close" onclick="dismissAlert()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <% // Clear session variables after displaying alert
               Session.Remove("AlertMessage");
               Session.Remove("AlertType");
            %>
        <% } %>
    </div>
           <asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand" BorderStyle="None" >
            <HeaderTemplate>
                <table width="100%">                    
                    <tr >
                        <td width="10%">WatchId</td>
                        <td width="20%">Watch Name</td>
                        <td width="15%">Watch Price</td>
                        <td width="15%">Watch Image</td>
                        <td width="20%">Watch Description</td>
                            <td width="20%" > - </td> 

                    </tr>
                </table>
        </HeaderTemplate>
            <ItemTemplate>
                <table width="100%" >
       <tr>
     <th width="10%"> <asp:Label ID="wid" runat="server"  Text='<%#Eval("watchid") %>' /></th>
     <th width="20%"> <asp:Label ID="wn" runat="server"  Text='<%#Eval("watchname") %>' /></th>
     <th width="15%"> <asp:Label ID="wp" runat="server"  Text='<%#Eval("watchprice") %>' /></th>
                      
     <th width="15%"><asp:Image ID="wimg" runat="server"  imageurl='<%#Eval("imagename","{0}") %>' Height="150" Width="150" /> </th>
     <th width="20%">
         <asp:Label ID="wdesc" runat="server"  Text='<%#Eval("watch_descrip") %>' /></th>
     </th>
<th width="20%"> 
<asp:Button CommandName="edit" ID="btnupdate" runat="server" Text="Edit"  CssClass="btn btn-warning" CommandArgument='<%#Eval("watchid") %>'/> 
                      | 
     <asp:Button CommandName="delete" ID="btndelete" runat="server" Text="delete" CssClass="btn btn-danger" /> 
 
                  </th> 

       </tr>
          </table>     
            </ItemTemplate>
               </asp:DataList>

     <script>
         function dismissAlert() {
             document.getElementById('alertMessage').classList.remove('show');
         }
    </script>
    </asp:Content>
