<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="SayWatch_Ecommerce.addproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <h2>Add Product</h2>
    <form id="addProductForm" runat="server">
        <div class="form-group">
            <label for="productName">Product Name:</label>
            <asp:TextBox ID="productName" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="productPrice">Product Price:</label>
            <asp:TextBox ID="productPrice" runat="server" CssClass="form-control" />
        </div>
        <!-- Other product fields here -->
        <asp:Button ID="submitProductButton" runat="server" Text="Submit"  CssClass="btn btn-primary" />
    </form>
</div>
     

</asp:Content>
