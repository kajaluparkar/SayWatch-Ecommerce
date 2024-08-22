<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderConfirmation.aspx.cs" Inherits="SayWatch_Ecommerce.OrderConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container">
        <h2 class="text-center">Order Confirmation</h2>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title text-warning text-center">Thank you for your order !</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="lblOrderValue" runat="server" Text="Order Value: " CssClass="card-text"></asp:Label>
                                <br />
                                <asp:Label ID="lblDiscount" runat="server" Text="Discount: " CssClass="card-text"></asp:Label>
                                <br />
                                <asp:Label ID="lblShipping" runat="server" Text="Shipping: " CssClass="card-text"></asp:Label>
                                <br />
                                <asp:Label ID="lblTotalPayable" runat="server" Text="You Pay: " CssClass="card-text"></asp:Label>
                                <br />
                                <asp:Label ID="lblOrderDate" runat="server" Text="Order Date: " CssClass="card-text"></asp:Label>
                            </div>
                        </div>
                       <br />
                        <div class="text-center">
                            <asp:HyperLink ID="hlBackToHome" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn btn-outline-primary">Back to Home</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
