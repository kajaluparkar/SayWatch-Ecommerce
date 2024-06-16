<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="SayWatch_Ecommerce.signin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
       
        .group{
            padding-left:90px;
        }
        .auto-style2 {
            margin-bottom: 1rem;
            text-align: center;
            padding-left:170px;
        }
        
        .card{
            border:1px solid #f8f9fa;
            box-shadow:0 0 10px #808080;


        }
        .form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-shadow: inset 1px 1px 3px rgba(0, 0, 0, 0.1);

}
    </style>
     <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card mt-5">
                    <div class="card-header text-center">
                        <h3 style="color:#59ab6e">Sign In</h3>
                    </div>
                    <div class="card-body ">
                        <asp:Panel runat="server">
                            <div class="form-group group">
                                <asp:Label runat="server" AssociatedControlID="txtUsername" CssClass="control-label">Username</asp:Label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username" Width="100%"></asp:TextBox>
                            </div>
                            <div class="form-group group">
                                <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="control-label">Password</asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password" Width="100%"></asp:TextBox>
                            </div>
                            <div class="auto-style2">
                                <asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btn btn-success btn-block" Width="100px" OnClick="btnSignIn_Click" />
                                
                            </div>
                            <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                            <div class="form-group text-center">
                                <asp:HyperLink ID="lnkForgotPassword" runat="server" NavigateUrl="~/ForgotPassword.aspx">Forgot Password? </asp:HyperLink>
                            </div>
                            <div class="form-group text-center ">
                                <asp:HyperLink ID="lnkSignUp" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
