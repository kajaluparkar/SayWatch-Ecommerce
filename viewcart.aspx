<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewcart.aspx.cs" Inherits="SayWatch_Ecommerce.viewcart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
            <div class="row">
                <div class="col-md-8">
                    <h3>Shopping Bag (<asp:Label ID="ItemsCountLabel" runat="server" Text="1"></asp:Label> Items)</h3>

    <asp:Repeater ID="CartRepeater" runat="server" OnItemCommand="CartRepeater_ItemCommand" OnLoad="CartRepeater_Load">
         <ItemTemplate>
                            <div class="card mb-3">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <asp:Image ID="ProductImage" runat="server" CssClass="card-img" ImageUrl='<%# Eval("watchimage") %>' />
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title"><%# Eval("watchname") %></h5>
                                            <p class="card-text">
                                                <small class="text-muted">Price: ₹<%# Eval("watchprice") %></small><br /><strong><small class="text-muted">Dispatches By:<%#Eval("totalamount") %></small></strong></p>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Quantity</span>
                                                </div>
                                                <asp:Button ID="Btnplus" runat="server" Text="+" CommandName="plus" />
                                                <asp:TextBox style="width:30px" ID="txtQuantity" runat="server" Text='<%# Eval("quantity") %>' CssClass="form-control"></asp:TextBox>
                                                <asp:Button ID="Btnminus" runat="server" Text="-" CommandName="minus" />

                                            </div>
                                            <asp:Button ID="RemoveButton" runat="server" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("watchid") %>' CssClass="btn btn-danger" />
                                             <asp:Button ID="UpdateButton" runat="server" Text="Update" CommandName="Update" CommandArgument='<%# Eval("watchid") %>' CssClass="btn btn-dark" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Order Summary (<asp:Label ID="SummaryItemsCountLabel" runat="server" Text="0"></asp:Label> Items)</h5>
                            <p class="card-text">Order Value: ₹<asp:Label ID="OrderValueLabel" runat="server" Text=""></asp:Label></p>
                             <p class="card-text">Discount: - ₹<asp:Label ID="DiscountLabel" runat="server" Text="0"></asp:Label></p>
                            <p class="card-text">Shipping: <asp:Label ID="ShippingLabel" runat="server" Text="Free" ForeColor="Yellow"></asp:Label></p>
                            <h5 class="card-text">You Pay: ₹<asp:Label ID="TotalPayLabel" runat="server" Text="0"></asp:Label></h5>
                              <asp:Button ID="btngoback" runat="server" Text="Go Back" CssClass="btn btn-light btn-block" OnClick="GoBack_Click" />
                            <asp:Button ID="btncheckout" runat="server" Text="Proceed To Checkout" CssClass="btn btn-primary btn-block" OnClick="ProceedToCheckout_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>
