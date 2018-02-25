<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminViewBookings.aspx.cs" Inherits="WebApplication16drone.AdminViewBookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  
		
		

		<!-- Loading third party fonts -->
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
     <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&callback=initMap">
    </script>
<script type="text/javascript">
    var markers = [
        <asp:Repeater ID="rptMarkers" runat="server">
            <ItemTemplate>
                {
                   
                    "lat": '<%# Eval("LocLat") %>',
            "lng": '<%# Eval("Loclang") %>',
            "description": '<%# Eval("FullName") %>'
                
        }
</ItemTemplate>
    <SeparatorTemplate>
        ,
</SeparatorTemplate>
        </asp:Repeater >
];
</script>
    <script type="text/javascript">
        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                   
                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(data.description);
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }
</script>
          <asp:GridView ID="GridView1" OnSelectedIndexChanged="Gridview1_SelectedIndexChanged " runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" style="top: 339px; left: 600px; position: absolute; height: 243px; width: 677px">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                 
                  <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                  <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                  <asp:BoundField DataField="DroneName" HeaderText="DroneName" SortExpression="DroneName" />
                  <asp:BoundField DataField="Locati" HeaderText="Locati" SortExpression="Locati" />
                  <asp:TemplateField HeaderText="View Details">
<ItemTemplate>
    <asp:HyperLink ID="lnkSelect" runat='server' NavigateUrl='<%# String.Format("~/accept_del_form.aspx?email={0}", Eval("Email")) %>'>Select</asp:HyperLink>
</ItemTemplate></asp:TemplateField>
                 
              </Columns>
              <EditRowStyle BackColor="#2461BF" />
              <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#EFF3FB" />
              <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F5F7FB" />
              <SortedAscendingHeaderStyle BackColor="#6D95E1" />
              <SortedDescendingCellStyle BackColor="#E9EBEF" />
              <SortedDescendingHeaderStyle BackColor="#4870BE" />
         </asp:GridView>
   
       <div id="dvMap" style="width: 600px; height: 500px; margin-left:-80px;">
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dronerentConnectionString %>" SelectCommand="SELECT DISTINCT [FullName], [Nic], [Phone], [Email], [DroneName], [Locati] FROM [Droneorders]">
           </asp:SqlDataSource>
</div>
     </div>
				</div>

				

			</main> <!-- .main-content -->

			
		</div>

		<script src="js/jquery-1.11.1.min.js"></script>
		
		<script src="js/plugins.js"></script>
		<script src="js/app.js"></script>
        
     </form>
   
		
	</body>
    
</body>
</html>
