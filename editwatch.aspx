<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="editwatch.aspx.cs" Inherits="SayWatch_Ecommerce.edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* styles.css */



.form-container {
     border: 1px solid #ccc;
     box-shadow: 2px 2px 12px #808080;
     padding: 20px;
     border-radius: 5px;
     max-width: 600px; 
     margin: 0 auto; 
     padding-left:50px;
 }

h2 {
    margin-top: 0;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
}

.form-label {
    display: block;
    margin-bottom: 5px;
    color: #555;
}

.form-input {
    width: 100%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

.form-input:focus {
    border-color: #4CAF50;
    outline: none;
}

.form-button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
}

.form-button:hover {
    background-color: #45a049;
}

.message {
    color: red;
    margin-bottom: 15px;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
<div class="form-container">
        <h2>Edit Watch Details</h2>
        <asp:Label ID="lblMessage" runat="server" Text="" CssClass="message" />
        <div class="form-group">
            <asp:Label ID="lblWatchId" runat="server" Text="Watch ID:" CssClass="form-label" />
            <asp:TextBox ID="txtWatchId" runat="server" CssClass="form-input" ReadOnly="true" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblWatchName" runat="server" Text="Watch Name:" CssClass="form-label" />
            <asp:TextBox ID="txtWatchName" runat="server" CssClass="form-input" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblWatchPrice" runat="server" Text="Watch Price:" CssClass="form-label" />
            <asp:TextBox ID="txtWatchPrice" runat="server" CssClass="form-input" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblWatchImage" runat="server" Text="Watch Image:" CssClass="form-label" />
            <asp:Image ID="imgWatch" runat="server" CssClass="form-image" Width="80px" Height="50px" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblUploadImage" runat="server" Text="Upload New Image:" CssClass="form-label" />
            <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="form-input" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload Image" CssClass="form-button" OnClick="btnUpload_Click" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblWatchDescription" runat="server" Text="Watch Description:" CssClass="form-label" />
            <asp:TextBox ID="txtWatchDescription" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="4" />
        </div>
        <div class="form-actions">
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="form-button" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnGoBack" runat="server" Text="Go Back" CssClass="form-button" OnClick="btnGoBack_Click" />
        </div>
    </div>
</asp:Content>
