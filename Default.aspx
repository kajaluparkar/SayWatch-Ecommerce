<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SayWatch_Ecommerce._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        
        <section class="row" aria-labelledby="aspnetTitle">

            <!--imageslider start -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="2000">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <div class="d-flex align-items-center slider-item">
          <div class="col-md-6 text-side">
            <h2 style="color:green;"><strong>Decker Fossil</strong></h2>
            <p><strong><em>Tiny and Perfect Watch</em></strong></p>
            <p><strong><em>From classic to trendy, the Fossil watches incorporate vintage aesthetics with modern elements. The label caters to all genders and age groups,
                featuring a diverse range of women's Fossil watches and men's Fossil watches.</em></strong></p>
          </div>
          <div class="col-md-6">
            <img src="banner/banner1.png" class="d-block w-100" alt="Watch">
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="d-flex align-items-center slider-item">
          <div class="col-md-6 text-side">
            <h2 style="color:green;"><strong>Timex</strong></h2>        
              <p><strong><em>Men, women and kids</em></strong></p>
            <p><strong><em>Timex has carved a niche in the Indian market with its elegant yet affordable timepieces. The brand’s reputation precedes it,
                offering a blend of style and functionality. Timex Fashion’s iconic collection exemplifies the brand’s commitment to craftsmanship.</em></strong></p>
          </div>
          <div class="col-md-6">
            <img src="banner/banner2.jpg" class="d-block w-100" alt="Second Slide Image">
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="d-flex align-items-center slider-item">
          <div class="col-md-6 text-side">
            <h2>Third Slide Title</h2>
            <p>Some description for the third slide.</p>
            <p>Additional text for the third slide. Customize as needed.</p>
          </div>
          <div class="col-md-6">
            <img src="banner/banner3.png" class="d-block w-100" alt="Third Slide Image">
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
            <br /> <br />
            <br />
            <hr />
                    <!--imageslider End -->

            <!--watchdata start-->
     <style>

    th{
        text-align:center;
          background-color:rgb(200 245 182);
    }
   
   
        
         .newStyle3 {
             font-family: "Agency FB";
         }
   /* Center the DataList items */
    .dataList-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    /* Style for each table inside the DataList */
    .dataList-container table {
        margin: 10px;
        border-collapse: collapse;
        text-align: center;
        width: 100px;
        border-radius: 10px; /* Rounded corners for the table */
        overflow: hidden; /* Ensures the content respects the border radius */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Box shadow */
    }
    /* Adding box shadow to images */
    .dataList-container img {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Box shadow */
        transition: transform 0.3s; /* Smooth hover effect */
        width: 200px; /* Smaller width */
        height: 200px; /* Smaller height */
    }

    /* Transform image on hover */
    .dataList-container img:hover {
        transform: scale(1.05); /* Slightly enlarge the image */
    }

    /* Button styles */
    .dataList-container .btn-detail {
        background-color:greenyellow; /* Button color */
        color: black; /* Text color */
        border: none; /* Remove border */
        padding: 10px 20px; /* Padding */
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 12px;
        margin: 4px 2px;
        cursor: pointer;
        transition: background-color 0.3s; /* Smooth background color transition */
    }

    /* Button hover effect */
    .dataList-container .btn-detail:hover {
        background-color: #0056b3; /* Darker blue on hover */
    }       
   
   
     </style>
      <strong> <h1 id="aspnetTitle" style="text-align:center; color:#59ab6e" ><span class="newStyle3">Category of the Month</span></h1></strong> 
   <p>
<asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnItemCommand="DataList1_ItemCommand" >
    <ItemTemplate> 
        <div class="dataList-container">
            <table width="100%" style="background-color:#59ab6e">
                
                <tr >
                    <th >
                        <asp:Image runat="server" ID="image1" ImageUrl='<%#Eval("imageName","{0}") %>' Width="200px" Height="200px" /> 
                    </th>
                </tr>
                <tr >
                  <th >
                    <u><asp:Label runat="server" ID="pn" Text='<%#Eval("watchname") %>' /> </u> 
                   </th>
                   </tr>
                <tr >
                    <th >
                       Rs.<asp:Label runat="server" ID="pprice" Text='<%#Eval("watchprice") %>' /> 
                    </th>
                </tr>
                <tr>
                    <th >
                        <asp:Button ID="btndetail" runat="server" Text="View Details" CommandArgument='<%#Eval("watchid") %>' CssClass="btn-detail" />
                    </th>
                </tr>
            </table>
        </div>
    </ItemTemplate>
</asp:DataList>                
                  <!--watchdata End-->
        <style>
     .video-container {
        width: 100% !important;
        height: 500px;
        background-color:black;
    }
    
     .video-container video {
        width: 100% !important;
        height:500px;
        display:block;
    }
</style>

   <!-- Video Section Start -->
          <div class='video-container'>

<div class="container-fluid">
                <div class="row">
                    <div class="col-12 p-0">
      <video width="100%" height="500" autoplay muted loop controls>
    <source src='watch_video1.mp4' type='video/mp4'>
    Your browser does not support the video tag.
</video>";  
</div>
                    </div>
                    </div>
            <!-- Video Section End -->
        </section>

        
    </main>
    <script>
        $('.carousel').carousel()

    </script>

</asp:Content>
