<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="SayWatch_Ecommerce.signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
       .form-container {
            border: 1px solid #ccc;
            box-shadow: 2px 2px 12px #808080;
            padding: 20px;
            border-radius: 5px;
            max-width: 600px; 
            margin: 0 auto; 
            padding-left:50px;
            

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
            background-color:#CBCBCB;

        }

        .form-check-input {
            margin-right: 10px; 
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #59ab6e;
            color: white;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #63D988;
        }

        .auto-style2 {
            width: 163px;
        }

        .newStyle1 {
            font-family: "Sitka Heading";
        }

        .auto-style3 {
            width: 1409px;
        }

        .auto-style4 {
            display: block;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: 4px;
            transition: none;
            box-shadow: inset 1px 1px 3px rgba(0, 0, 0, 0.1);
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #fff;
            width:500px;
            

        }
         .group{
     padding-left:80px;
 }
         .card{
    border:1px solid #f8f9fa;
    box-shadow:0 0 10px #808080;
}
 
       
    </style>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card mt-5">
                    <div class="card-header text-center">
                        <h3 style="color:#59ab6e">Sign-Up</h3>
                    </div>
                    <div class="card-body">
                        <asp:Panel runat="server">
                            <div class="form-group group">
                                <label for="inputUserName"><strong><em>UserName :-</em></strong></label>
                                <asp:TextBox ID="txtUname" CssClass="auto-style4" runat="server" placeholder="username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserName can't be blank" ControlToValidate="txtUname" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group group">
                                <label for="inputPassword"><strong><em>Password :-</em></strong></label>
                                <asp:TextBox ID="txtpass" CssClass="auto-style4" runat="server" placeholder="password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password can't be blank" ControlToValidate="txtpass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group group">
                                <label for="inputConfirm" class="auto-style2"><strong><em>Confirm Password :-</em></strong></label>
                                <asp:TextBox ID="txtConfirm" CssClass="auto-style4" runat="server" placeholder="Confirm password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirm Password can't be blank" ControlToValidate="txtConfirm" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match" ControlToCompare="txtpass" ControlToValidate="txtConfirm" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                            </div>
                            <div class="form-group group">
                                <label for="inputAddress2"><strong><em>Email :-</em></strong></label>
                                <asp:TextBox ID="txtEmail" CssClass="auto-style4" runat="server" placeholder="email@com" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email can't be blank" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group group">
                                <label for="inputCity"><strong><em>Gender :-</em></strong></label> &nbsp;
                                <asp:RadioButton ID="RadioMale" runat="server" GroupName="gender" Text="Male" /> &nbsp; &nbsp;
                                <asp:RadioButton ID="RadioFemale" runat="server" GroupName="gender" Text="Female" />
                            </div>
                            <div class="form-group text-center">
                                <asp:Button ID="submitButton" CssClass="btn btn-success" runat="server" Text="Sign Up" OnClick="submitButton_Click" />
                            </div>
                            <br />
                            <br />
                            <div class="form-group text-center">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                            <div class="form-group text-center ">
                             <asp:HyperLink ID="lnkSignIn" runat="server" NavigateUrl="~/Signin.aspx">Sign In</asp:HyperLink>
                              </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

