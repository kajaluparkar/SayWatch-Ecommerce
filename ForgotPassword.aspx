<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="SayWatch_Ecommerce.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style>
        .card-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 2px 2px 12px #808080;
            border-radius: 10px;
        }

       
           

        .card-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: inset 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #59ab6e;
            color: white;
            cursor: pointer;
            width: 100%;
        }

        .btn:hover {
            background-color: #63D988;
        }
    </style>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card card-container mt-5">
                    <div class="card-header text-center">
                     <h3 style="color:#59ab6e">Forgot Password</h3>
                       </div>
                    <div class="card-body">
                        <asp:Panel runat="server">
                            <div class="form-group">
                                <label for="inputEmail"><strong>Email Address:</strong></label>
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email can't be blank" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email address" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group text-center">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Reset Password" OnClick="btnSubmit_Click" />
                            </div>
                            <br />
                            <div class="form-group text-center">
                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
