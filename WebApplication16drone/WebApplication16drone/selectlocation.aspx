<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectlocation.aspx.cs" Inherits="WebApplication16drone.selectlocation" %>


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
			
                  <br /> 
            lat: <asp:TextBox id='lat' runat="server"></asp:TextBox>
            Lon:  <asp:TextBox id='lon' runat="server"></asp:TextBox>
                <asp:Button ID="ButtonConfirm" runat="server" Text="Confirm" OnClick="ButtonConfirm_Click" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorlat" runat="server" ErrorMessage="Please select your Location" ControlToValidate="lat"></asp:RequiredFieldValidator>
        <br /> <br />

            </div>

			<main class="main-content">
				</form>

      
						</div>
					</div>
				</div>

			</main> <!-- .main-content -->

		</div>

		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/app.js"></script>

        <head>
    <title>Remove Markers</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
  </head>
  <body>

    <div id="map"></div>
    <p>Click on the map to add markers.</p>
    <script>

        // In the following example, markers appear when the user clicks on the map.
        // The markers are stored in an array.
        // The user can then click an option to hide, show or delete the markers.
        var map;
        var markers = [];

        function initMap() {
            var haightAshbury = { lat: 6.925501, lng: 79.884014 };

            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                center: haightAshbury,
                mapTypeId: 'terrain'
            });

            // This event listener will call addMarker() when the map is clicked.
            map.addListener('click', function (event) {
                deleteMarkers();
                addMarker(event.latLng);
                var clickLat = event.latLng.lat();
                var clickLon = event.latLng.lng();

                // show in input box
                document.getElementById("lat").value = clickLat.toFixed(5);
                document.getElementById("lon").value = clickLon.toFixed(5);
            });
            addMarker(haightAshbury);
            var outerCoords = [
                { lat: 10.161432, lng: 80.084313 },
                { lat: 5.832465, lng: 78.551720 },
                { lat: 5.848859, lng: 82.770470 }
            ];

            // Define the LatLng coordinates for the polygon's inner path.
            // Note that the points forming the inner path are wound in the
            // opposite direction to those in the outer path, to form the hole.
            var innerCoords = [
                { lat: 7.080589, lng: 79.830891 },
                { lat: 7.076735, lng: 80.162995 },

                { lat: 6.889746, lng: 80.345555 },
                { lat: 6.544492, lng: 79.982377 }
            ];

            // Construct the polygon, including both paths.
            var bermudaTriangle = new google.maps.Polygon({
                paths: [outerCoords, innerCoords],
                strokeColor: '#FFC107',
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: '#FFC107',
                fillOpacity: 0.35
            });
            bermudaTriangle.setMap(map);
        }

        // Adds a marker to the map and push to the array.
        function addMarker(location) {
            var marker = new google.maps.Marker({
                position: location,
                map: map
            });
            markers.push(marker);
        }

        // Sets the map on all markers in the array.
        function setMapOnAll(map) {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(map);
            }
        }

        // Removes the markers from the map, but keeps them in the array.
        function clearMarkers() {
            setMapOnAll(null);
        }

        // Shows any markers currently in the array.
        function showMarkers() {
            setMapOnAll(map);
        }

        // Deletes all markers in the array by removing references to them.
        function deleteMarkers() {
            clearMarkers();
            markers = [];
        }

        var citymap = {
            chicago: {
                center: { lat: 6.871308, lng: 79.908905 },
                population: 14856
            }
        };


    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&callback=initMap">
    </script>
  </body>
		</form>
	</body>

</html>
