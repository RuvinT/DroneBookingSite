<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accept_del_form.aspx.cs" Inherits="WebApplication16drone.accept_del_form" %>

<!DOCTYPE html>
<html lang="en">
	<head runat="server">
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>Services : Science Labs</title>

		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
		<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

		<!-- Loading main css file -->
		<link rel="stylesheet" href="style.css">
		
		<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->

	    <style type="text/css">
            .auto-style2 {
                height: 194px;
            }
            .auto-style3 {
                height: 52px;
            }
            .auto-style4 {
                height: 71px;
            }
            .auto-style5 {
                height: 83px;
            }
            .auto-style6 {
                height: 125px;
            }
            .auto-style7 {
                height: 71px;
                width: 187px;
            }
            .auto-style8 {
                height: 83px;
                width: 187px;
            }
            .auto-style9 {
                height: 125px;
                width: 187px;
            }
            .auto-style10 {
                left: -97px;
                top: 128px;
            }
        </style>

	</head>


	<body>
		<form id="form1" runat="server">
		<div class="site-content">
			<header class="site-header" data-bg-image="">
				<div class="container">
					<div class="header-bar">
						<a href="index.html" class="branding">
							<img src="images/logo.png" alt="" class="logo">
							<div class="logo-type">
								<h1 class="site-title">Company name</h1>
								<small class="site-description">Tagline goes here</small>
							</div>
						</a>

						<nav class="main-navigation">
							<button class="menu-toggle"><i class="fa fa-bars"></i></button>
							<ul class="menu">
								<li class="home menu-item"><a href="index.html"><img src="images/home-icon.png" alt="Home"></a></li>
								<li class="menu-item"><a href="about.html">About</a></li>
								<li class="menu-item current-menu-item"><a href="services.html">Services</a></li>
								<li class="menu-item"><a href="projects.html">Our projects</a></li>
								<li class="menu-item"><a href="contact.html">Contact</a></li>
							</ul>
						</nav>

						<div class="mobile-navigation"></div>
					</div>
				</div>
			</header>

			<div class="page-head" data-bg-image="images/page-head-2.jpg">
				<div class="container">
					<h2 class="page-title">Services</h2>
					<small>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit consequuntur magni </small>
				</div>
			
                 

            </div>

			<main >
				
      <div >
					<div >
    <div style="top: 300px; left: 50px; position: absolute" >  
        <table >  
            <tr>  
                <td colspan="2">  
                    <h2>Booking details</h2>  
                </td>  
            </tr>   
            <tr  >  
                <td >Drone Name</td> 
                <td >  
          
                   <asp:TextBox ID="dname" runat="server" BorderColor="White"></asp:TextBox></td>  
            </tr> 
            <tr>  
                <td>Full Name</td> 
                <td> <asp:TextBox ID="name" runat="server" BorderColor="White"></asp:TextBox></td>  
            </tr>
            <tr>  
                <td class="auto-style3">Email</td>  
                <td class="auto-style3"><asp:TextBox ID="emaill" runat="server" BorderColor="White"></asp:TextBox></td>  
            </tr>
            <tr>  
                <td>ID</td>  
                <td> <asp:TextBox ID="nic" runat="server" BorderColor="White"></asp:TextBox></td>  
            </tr>   
            <tr>  
                <td>Phone</td>  
                <td> <asp:TextBox ID="phone" runat="server" BorderColor="White"></asp:TextBox></td>  
            </tr> <tr> <td></td></tr>
             <tr>  
                <td>Location</td>  
                <td>  <asp:TextBox ID="location" runat="server" BorderColor="White"></asp:TextBox></td>  
            </tr> <tr> <td></td></tr>
            <tr>  
                <td>Dates</td>  
                <td> <asp:Label ID="dates" runat="server" ForeColor="Black" ></asp:Label></td>  
            </tr>  <tr> <td></td></tr>
           
           
        </table>  
    </div>
              <div style="top: 300px; left: 500px; position: absolute" >  
        <table class="auto-style10" >  
            <tr>  
                <td colspan="2" class="auto-style2">  
                    <h2>Approve Booking</h2>  
                </td>  
            </tr>   
            <tr  >  
                <td class="auto-style7" style="color:blue" >Title</td> 
                <td  colspan="1" class="auto-style4">  
          
                   <asp:TextBox ID="title" runat="server" BorderColor="Black"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="dpassValidator" runat="server" ControlToValidate="title"  ErrorMessage="Please enter title for email" ForeColor="Red"  BorderStyle="None" ></asp:RequiredFieldValidator> 
                </td  > 
              
            </tr> 
           
            <tr>  
                <td class="auto-style8">Content</td> 
                <td  colspan="1" class="auto-style5"> <asp:TextBox ID="content" runat="server"  textmode="multiline" Columns="50" BorderColor="Black" Rows="5"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="content"  ErrorMessage="Please enter content for email" ForeColor="Red"  BorderStyle="None"></asp:RequiredFieldValidator>
                </td> 
                
            </tr>
             
           
            <tr>  
                <td colspan="1" class="auto-style9"><asp:Button ID="Button1" runat="server" Text="Approve" OnClick="Button1_Click"  /></td> 
                <td colspan="1" class="auto-style6"><asp:Button ID="btnSubmit" runat="server" Text="Delete" OnClick="btnSubmit_Click"  /></td> 
            </tr>   
        </table>  
    </div>

                        </div></div>
						

			</main> <!-- .main-content -->

	

		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/app.js"></script>

 </form>      
</body>
</html>

