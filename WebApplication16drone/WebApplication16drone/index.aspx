<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs"  MaintainScrollPositionOnPostback="true" Inherits="WebApplication16drone.index" %>




<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Holiday - templatemo</title>
<!--
Holiday Template
http://www.templatemo.com/tm-475-holiday
-->
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
  <link href="css/flexslider.css" rel="stylesheet">
  <link href="css/templatemo-style.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/magnific-popup.css" rel="stylesheet"> 
   
   <link href="css/templatemo_style.css" rel="stylesheet" type="text/css">	
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    </head>
  <body class="tm-gray-bg">

      <form id="form1" runat="server">
  	<!-- Header -->
  	<div class="tm-header">
  		<div class="container">
  			<div class="row">
  				<div class="col-lg-6 col-md-4 col-sm-3 tm-site-name-container">
  					<a href="#" class="tm-site-name">Holiday</a>	
  				</div>
	  			<div class="col-lg-6 col-md-8 col-sm-9">
	  				<div class="mobile-menu-icon">
		              <i class="fa fa-bars"></i>
		            </div>
	  				<nav class="tm-nav">
						<ul>
							<li><a href="index.html" class="active">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="tours.html">Our Tours</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</nav>		
	  			</div>				
  			</div>
  		</div>	  	
  	</div>
	
	<!-- Banner -->
	<section class="tm-banner">
		<!-- Flexslider -->
		<div class="flexslider flexslider-banner">
		  <ul class="slides">
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Find <span class="tm-yellow-text">The Best</span> Place</h1>
					<p class="tm-banner-subtitle">For Your Holidays</p>
					<a href="#more" class="tm-banner-link">Learn More</a>	
				</div>
				<img src="img/banner-1.jpg" alt="Image" />	
		    </li>
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Lorem <span class="tm-yellow-text">Ipsum</span> Dolor</h1>
					<p class="tm-banner-subtitle">Wonderful Destinations</p>
					<a href="#more" class="tm-banner-link">Learn More</a>	
				</div>
		      <img src="img/banner-2.jpg" alt="Image" />
		    </li>
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Proin <span class="tm-yellow-text">Gravida</span> Nibhvell</h1>
					<p class="tm-banner-subtitle">Velit Auctor</p>
					<a href="#more" class="tm-banner-link">Learn More</a>	
				</div>
		      <img src="img/banner-3.jpg" alt="Image" />
		    </li>
		  </ul>
		</div>	
	</section>

	<!-- gray bg -->	
	<section class="container tm-home-section-1" id="more">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6">
				<!-- Nav tabs -->
				<div class="tm-home-box-1">
					<ul class="nav nav-tabs tm-white-bg" role="tablist" id="hotelCarTabs">
					    <li role="presentation" class="active">
					    	<a href="#hotel" aria-controls="hotel" role="tab" data-toggle="tab">Hotel</a>
					    </li>
					    <li role="presentation">
					    	<a href="#car" aria-controls="car" role="tab" data-toggle="tab">Car Rental</a>
					    </li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
					    <div role="tabpanel" class="tab-pane fade in active tm-white-bg" id="hotel">
					    	<div class="tm-search-box effect2">
								<form action="#" method="post" class="hotel-search-form">
									<div class="tm-form-inner">
										<div class="form-group">
							            	 

                                            <asp:DropDownList ID="DropDownList1" runat="server" Width="283px" Height="36px" AutoPostBack = "true"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                               
                                             
                                            </asp:DropDownList>

							          	</div>
							          	<div class="form-group">
							                <div class='input-group date' id='datetimepicker1'>
                                                <asp:Calendar ID="Calendar1" runat="server" OnDayRender=" Calendar1DayRender" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="227px" ShowGridLines="True" Width="280px" OnSelectionChanged="Calendar1_SelectionChanged" >
                                                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                                    <OtherMonthDayStyle ForeColor="#CC9966" />
                                                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                                    <SelectorStyle BackColor="#FFCC66" />
                                                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                                </asp:Calendar>
							                    
                                                
							                   
							                </div>
							            </div>
							          	
							            
									</div>
                                     <div class="form-group tm-yellow-gradient-bg text-center">
							                    
                                                <asp:Button ID="Button1" runat="server" class="tm-yellow-btn" Text="Clear" OnClick="ButtonCheck1_Click"/>
							                   
							                </div>
							            
						            <div class="form-group tm-yellow-gradient-bg text-center">
						            	
                                        <asp:Button ID="ButtonCheck" runat="server" class="tm-yellow-btn" Text="Check Now" OnClick="ButtonCheck_Click" />
						            </div>  
								</form>
							</div>
					    </div>
					    <div role="tabpanel" class="tab-pane fade tm-white-bg" id="car">
							<div class="tm-search-box effect2">
								<form action="#" method="post" class="hotel-search-form">
									<div class="tm-form-inner">
										<div class="form-group">
							            	 <select class="form-control">
							            	 	<option value="">-- Select Model -- </option>
							            	 	<option value="shangrila">BMW</option>
												<option value="chatrium">Mercedes-Benz</option>
												<option value="fourseasons">Toyota</option>
												<option value="hilton">Honda</option>
											</select> 
							          	</div>
							          	<div class="form-group">
							                <div class='input-group date-time' id='datetimepicker3'>
							                    <input type='text' class="form-control" placeholder="Pickup Date" />
							                    <span class="input-group-addon">
							                        <span class="fa fa-calendar"></span>
							                    </span>
							                </div>
							            </div>
							          	<div class="form-group">
							                <div class='input-group date-time' id='datetimepicker4'>
							                    <input type='text' class="form-control" placeholder="Return Date" />
							                    <span class="input-group-addon">
							                        <span class="fa fa-calendar"></span>
							                    </span>
							                </div>
							            </div>
							            <div class="form-group">
							            	 <select class="form-control">
							            	 	<option value="">-- Options -- </option>
							            	 	<option value="">Child Seat</option>
												<option value="">GPS Navigator</option>
												<option value="">Insurance</option>
											</select> 
							          	</div>							           
									</div>							
						            <div class="form-group tm-yellow-gradient-bg text-center">
						            	<button type="submit" name="submit" class="tm-yellow-btn">Check Now</button>
						            </div>  
								</form>
							</div>
					    </div>				    
					</div>
				</div>								
			</div>

			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-center">
					<img src="img/index-01.jpg" alt="image" class="img-responsive">
					<a href="#">
						<div class="tm-green-gradient-bg tm-city-price-container">
							<span>New York</span>
							<span>$6,600</span>
						</div>	
					</a>			
				</div>				
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-right">
					<img src="img/index-02.jpg" alt="image" class="img-responsive">
					<a href="#">
						<div class="tm-red-gradient-bg tm-city-price-container">
							<span>Paris</span>
							<span>$4,200</span>
						</div>	
					</a>					
				</div>				
			</div>
		</div>
	
		<div class="section-margin-top">
			<div class="row">				
				<div class="tm-section-header">
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title">Lorem Ipsum Dolor</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
						<img src="img/index-03.jpg" alt="image" class="img-responsive">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
						<p class="tm-date">28 March 2016</p>
						<div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="img/index-04.jpg" alt="image" class="img-responsive">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
						<p class="tm-date">26 March 2016</p>
						<div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="img/index-05.jpg" alt="image" class="img-responsive">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
						<p class="tm-date">24 March 2016</p>
						<div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2 tm-home-box-2-right">						
					    <img src="img/index-06.jpg" alt="image" class="img-responsive">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
						<p class="tm-date">22 March 2016</p>
						<div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<p class="home-description">Holiday is free Bootstrap v3.3.5 responsive template for tour and travel websites. You can download and use this layout for any purpose. You do not need to provide a credit link to us. If you have any question, feel free to <a href="http://www.facebook.com/templatemo" target="_parent">contact us</a>. Credit goes to <a rel="nofollow" href="http://unsplash.com" target="_parent">Unspash</a> for images used in this template.</p>					
				</div>
			</div>			
		</div>
	</section>		
	
	<!-- white bg -->
	<section class="tm-white-bg section-padding-bottom">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">Popular Packages</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
				</div>
                <div style="background-color:white;">

		<div class="content-container" >
			<header>
			<!--<h1 class="center-text">Gallary at glance</h1>-->
			
		</header>
            <div id="portfolio-content" class="center-text">
			<div class="portfolio-page" id="page-1">
             <asp:Repeater ID="Repeater1" runat="server">
     <ItemTemplate>
		
			
				<div class="portfolio-group">
				<asp:hyperlink runat="server" id="hlDividents"  class="portfolio-item" navigateurl='<%# String.Format("form.aspx?id1={0}", Eval("DroneName")) %>' > 
						  <asp:Image ID="Image1" runat="server" ImageUrl='<%# "EmployeeImageHandler.ashx?Id="+ Eval("Id") %>'   Height="225px" Width="250px"
                            />
						<div class="detail">
							<h3><%#Eval("DroneName") %></h3>
							<p> <asp:TextBox id="txtPost" runat="server" textmode="multiline" Columns="31" BorderColor="White" Rows="5" text='<%#Eval("Description") %>'></asp:TextBox></p>
							<span class="btn">Book
                                



							</span>
						</div>
					</asp:hyperlink>				
			</div>
				
				
			
	<!-- /.content-container -->	
	 </ItemTemplate>
</asp:Repeater>	
	</div>
			
		</div>
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="js/modernizr.2.5.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script> 
	<script type="text/javascript" src="js/templatemo_script.js"></script>
	<script type="text/javascript">
        $(function () {
            $('.pagination li').click(changePage);
            $('.portfolio-item').magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        });
	</script>
</div>	
         
			    
			</div>	
			    
				
			 
			</div>		
		</div>
	</section>
	<footer class="tm-black-bg">
		<div class="container">
			<div class="row">
				<p class="tm-copyright-text">Copyright &copy; 2084 Your Company Name 
                
                | Designed by <a rel="nofollow" href="http://www.templatemo.com" target="_parent">templatemo</a></p>
			</div>
		</div>		
	</footer>
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
  	<script type="text/javascript" src="js/moment.js"></script>							<!-- moment.js -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>					<!-- bootstrap js -->
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>	<!-- bootstrap date time picker js, http://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
<!--
	<script src="js/froogaloop.js"></script>
	<script src="js/jquery.fitvid.js"></script>
-->
   	<script type="text/javascript" src="js/templatemo-script.js"></script>      		<!-- Templatemo Script -->
	<script>
        // HTML document is loaded. DOM is ready.
        $(function () {

            $('#hotelCarTabs a').click(function (e) {
                e.preventDefault()
                $(this).tab('show')
            })

            $('.date').datetimepicker({
                format: 'MM/DD/YYYY'
            });
            $('.date-time').datetimepicker();

            // https://css-tricks.com/snippets/jquery/smooth-scrolling/
            $('a[href*=#]:not([href=#])').click(function () {
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                    var target = $(this.hash);
                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                    if (target.length) {
                        $('html,body').animate({
                            scrollTop: target.offset().top
                        }, 1000);
                        return false;
                    }
                }
            });
        });

        // Load Flexslider when everything is loaded.
        $(window).load(function () {
            // Vimeo API nonsense

            /*
                          var player = document.getElementById('player_1');
                          $f(player).addEvent('ready', ready);
                         
                          function addEvent(element, eventName, callback) {
                            if (element.addEventListener) {
                              element.addEventListener(eventName, callback, false)
                            } else {
                              element.attachEvent(eventName, callback, false);
                            }
                          }
                         
                          function ready(player_id) {
                            var froogaloop = $f(player_id);
                            froogaloop.addEvent('play', function(data) {
                              $('.flexslider').flexslider("pause");
                            });
                            froogaloop.addEvent('pause', function(data) {
                              $('.flexslider').flexslider("play");
                            });
                          }
            */



            // Call fitVid before FlexSlider initializes, so the proper initial height can be retrieved.
            /*
            
                          $(".flexslider")
                            .fitVids()
                            .flexslider({
                              animation: "slide",
                              useCSS: false,
                              animationLoop: false,
                              smoothHeight: true,
                              controlNav: false,
                              before: function(slider){
                                $f(player).api('pause');
                              }
                          });
            */




            //	For images only
            $('.flexslider').flexslider({
                controlNav: false
            });


        });
	</script>

    </form>
 </body>
 </html>