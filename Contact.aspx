<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SayWatch_Ecommerce.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" style="padding-top:20px">
        <style>
            .img{
    padding-top:200px;
   
     }
            .custom-padding{
                padding-left:200px;
            }
           
        </style>
       

         <div style="border:1px solid #f8f9fa; box-shadow:0 0 10px #808080">
        <div style="text-align:center;padding-top:40px;">
        <div class="col-md-6 m-auto">
            <h1 class="h1"style="color:#59ab6e" >Contact Us</h1>
                <p>"Got a question, suggestion, or just want to say hi? We'd love to hear from you! Drop us a line and let's start a conversation. Your feedback fuels our growth!"</p>
             </div>
    </div>
        <!---Start Contact-->
        <div class="container" style="display:flex;">
                <div class="col-lg-6" width="200px">
        <div class="row py-5">
            <div class="col-md-9 m-auto">
                <div class="row">
                    <div class="form-group mb-3">
                        <label for="inputname"><strong>Name :-</strong></label>
                        <asp:TextBox ID="name" runat="server" CssClass="form-control mt-1" Placeholder="Name" Width="100%"></asp:TextBox>
                    </div>
                    <div class="form-group mb-3">
                        <label for="inputemail"><strong>Email :-</strong></label>
                        <asp:TextBox ID="email" runat="server" CssClass="form-control mt-1" Placeholder="Email" TextMode="Email" Width="100%"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group mb-3">
                    <label for="inputsubject"> <strong>Mobile Number :-</strong></label>
                    <asp:TextBox ID="mobile" runat="server" CssClass="form-control mt-1" Placeholder="mob number"  Width="100%" ></asp:TextBox>
                </div>
                <div class="form-group mb-3">
                    <label for="inputmessage"> <strong>Message :-</strong></label>
                    <asp:TextBox ID="message" runat="server" CssClass="form-control mt-1" Placeholder="Message" TextMode="MultiLine" Rows="8"></asp:TextBox>
                </div>
                
                <div class="row">
                    <div class="col text-end mt-2 custom-padding">
                        <asp:Button ID="submitButton" runat="server" CssClass="btn btn-success btn-lg px-5" Text="Let’s Talk" OnClick="SubmitButton_Click"  />
                    </div>
                </div>
            </div>
        </div>
         <!---End Contact-->
</div>
           
        <div class="col-lg-6">
            <asp:Image ID="Image1" runat="server"  ImageUrl="~/contact3.jpg" Width="500px" Height="500px" Class="img"/>
        </div>
            </div>
            </div>
    </main>
</asp:Content>
