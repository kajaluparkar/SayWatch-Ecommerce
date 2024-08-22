<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProceedToBuy.aspx.cs" Inherits="SayWatch_Ecommerce.ProceedToBuy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
            <h2>Payment and Shipping Details</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
            <div class="form-group">
                <label for="txtName">Full Name:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtAddress">Address:</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtCity">City:</label>
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtState">State:</label>
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtZipCode">Zip Code:</label>
                <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPhone">Phone Number:</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlPaymentMethod">Payment Method:</label>
                <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Credit Card" Value="Credit Card"></asp:ListItem>
                    <asp:ListItem Text="Debit Card" Value="Debit Card"></asp:ListItem>
                    <asp:ListItem Text="Net Banking" Value="Net Banking"></asp:ListItem>
                    <asp:ListItem Text="Cash on Delivery" Value="Cash on Delivery"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnProceed" runat="server" Text="Proceed to Order Confirmation" CssClass="btn btn-primary" OnClick="btnProceed_Click" />
        </div>
</asp:Content>
