<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewDetails.aspx.cs" Inherits="SayWatch_Ecommerce.viwedetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
    <ItemTemplate>
     <div class="container mt-4">
            <div class="row">
                <div class="col-md-6">
                    <asp:Image ID="watchImage" runat="server" CssClass="img-fluid" ImageUrl='<%#Eval("imagename","{0}")%>' />
                </div>
                <div class="col-md-6">
                    <h1><asp:Label ID="WatchName" runat="server" Text='<%#Eval("watchname")%>' ></asp:Label></h1>
                    <h2>Price: ₹<asp:Label ID="WatchPrice" runat="server" Text='<%#Eval("watchprice") %>'></asp:Label></h2>
                    <p><asp:Label ID="WatchDescription" runat="server" Text='<%#Eval("watch_descrip")%>'></asp:Label></p>
                     <asp:Button ID="GoBack" runat="server" Text="Go Back" CssClass="btn btn-light" CommandName="goback"  />
                    <asp:Button ID="AddToBag" runat="server" Text="Add To Bag" CssClass="btn btn-primary" CommandName="addtobag"  CommandArgument='<%#Eval("watchid") %>'/>
                    <asp:Button ID="BuyNow" runat="server" Text="Buy Now" CssClass="btn btn-success"  CommandName="buynow" />
                </div>
            </div>
        </div>
        </ItemTemplate>
        </asp:DataList>
</asp:Content>
