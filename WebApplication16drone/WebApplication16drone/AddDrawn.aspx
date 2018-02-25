<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDrawn.aspx.cs" Inherits="WebApplication16drone.AddDrawn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head runat="server">  
    <title></title> 
    
    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css"/>
		<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css"/>

		<!-- Loading main css file -->
		<link rel="stylesheet" href="style.css"/>
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
								<li class="home menu-item" class="menu-item current-menu-item"><a href="index.html"><img src="images/home-icon.png" alt="Home"></a></li>
								<li class="menu-item"><a href="about.html">About</a></li>
								<li class="menu-item"><a href="services.html">Services</a></li>
								<li class="menu-item"><a href="projects.html">Our projects</a></li>
								
							</ul>
						</nav>

						<div class="mobile-navigation"></div>
					</div>
				</div>
			</header>

			<div class="page-head" data-bg-image="images/page-head-4.jpg">
				<div class="container">
					<h2 class="page-title">Contact</h2>
					<small>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit consequuntur magni </small>
				</div>
			</div>

			<main class="main-content">
				
				<div class="fullwidth-block">
					<div class="container">
    <div style="top: 300px; left: 50px; position: absolute" >  
        <table >  
            <tr>  
                <td colspan="2">  
                    <h2>Add Remove Drones</h2>  
                </td>  
            </tr>  
            <tr>  
                <td>Drone ID</td>  
                <td>  
          
                    <asp:TextBox ID="txtID" runat="server" Width="211px"></asp:TextBox></td>  
            </tr>  
            <tr>  
                <td>Drone Name</td>  
                <td><asp:TextBox ID="txtName" runat="server" Width="211px"></asp:TextBox></td>  
            </tr>  
            <tr>  
                <td>Drone type</td>  
                <td><asp:TextBox ID="txtBloodGroup" runat="server" Width="211px"></asp:TextBox></td>  
            </tr>  
            <tr>  
                <td>Discription</td>  
                <td><asp:TextBox ID="txtContactNo" runat="server"  TextMode="multiline" Columns="50" Rows="8"></asp:TextBox></td>  
            </tr>  
            <tr>  
                <td>Photo:</td>  
                <td><asp:FileUpload ID="fileuploadEmpImage" runat="server" Width="180px" /></td>  
            </tr>  
            <tr>  
                <td colspan="2"><asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click" /></td>  
            </tr>  
        </table>  
    </div>
                        <asp:GridView ID="grdEmployee" runat="server" AutoGenerateColumns="False" style="top: 873px; left: 0px; position: absolute; height: 300px; width: 500px; margin-bottom: 100px;" OnRowCommand="GridView1_RowCommand" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">  
            <Columns>  
             <asp:BoundField HeaderText="Id" DataField="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />  
              <asp:BoundField HeaderText="DroneName" DataField="DroneName" SortExpression="DroneName" />  
              <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" />  
                <asp:BoundField HeaderText="DroneType" DataField="DroneType" SortExpression="DroneType" />  
               
                
                
                <asp:BoundField DataField="NoOFDrones" HeaderText="NoOFDrones" SortExpression="NoOFDrones" />
               <asp:TemplateField HeaderText="Image">  
                    <ItemTemplate>  
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "EmployeeImageHandler.ashx?Id="+ Eval("Id") %>'  
                            Height="150px" Width="150px" />  
                    </ItemTemplate>  
                </asp:TemplateField>
                
                
            </Columns>  
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    <div>  
    </div>
                        	 	
					</div>
				</div>

				

			</main> <!-- .main-content -->

			
		</div>

		<script src="js/jquery-1.11.1.min.js"></script>
		
		<script src="js/plugins.js"></script>
		<script src="js/app.js"></script>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dronerentConnectionString %>" SelectCommand="SELECT * FROM [Drones]">
        </asp:SqlDataSource>
    </form>  
</body>  
</html> 
