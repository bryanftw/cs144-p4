<!DOCTYPE html> 
<%@ page import="edu.ucla.cs.cs144.ItemResult" %>
<html>   
<head> 
<title>Item Search</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
<style type="text/css"> 
  html { height: 100% } 
  body { height: 100%; margin: 0px; padding: 0px } 
  #map_canvas { height: 100% } 
</style> 

<script type="text/javascript" 
    src="http://maps.google.com/maps/api/js?sensor=false"> 
</script> 

<script type="text/javascript"> 
  function initialize() { 
    var latlng = new google.maps.LatLng(34.063509,-118.44541); 
    var myOptions = { 
      zoom: 14, // default is 8  
      center: latlng, 
      mapTypeId: google.maps.MapTypeId.ROADMAP 
    }; 
    var map = new google.maps.Map(document.getElementById("map_canvas"), 
        myOptions); 
  } 
</script>

</head> 
<body onload="initialize()"> 
  <form action="item" method="GET">
    <input name="id" type="text"><br>
    <input type="submit">
  </form>
  <h2>Results:</h2>
  <p>ItemID:<%= request.getAttribute("itemID")%></p>
  <p>Name: <%= request.getAttribute("name")%></p>
  <p>Categories: <%= request.getAttribute("categories")%></p>
  <p>First Bid: <%= request.getAttribute("firstBid")%></p>
  <p>Number of Bids: <%= request.getAttribute("numberOfBids")%></p>
  <p>Location: <%= request.getAttribute("location")%></p>
  <p>Country: <%= request.getAttribute("country")%></p>
  <p>Started: <%= request.getAttribute("started")%></p>
  <p>Ends: <%= request.getAttribute("ends")%></p>
  <p>Description: <%= request.getAttribute("description")%></p>
  <h3>Seller Details</h3>
  <p>Rating: <%= request.getAttribute("sellerRating")%></p>  
  <p>ID: <%= request.getAttribute("sellerID")%></p>
  <h3>Bid Details</h3>
  <table border="1">
    <tr>
  	<td>Bidder Rating</td>
  	<td>Bidder ID</td>
  	<td>Location</td>
  	<td>Country</td>
  	<td>Time</td>
  	<td>Amount</td>
    </tr>
    <c:forEach begin="0" end="${fn:length(times)}" var="index">
  	<tr>  
  	  <td><c:out value="${ratings[index]}"/></td>
  	  <td><c:out value="${ids[index]}"/></td>
  	  <td><c:out value="${locations[index]}"/></td> 
  	  <td><c:out value="${countries[index]}"/></td>
  	  <td><c:out value="${times[index]}"/></td>
  	  <td><c:out value="${amounts[index]}"/></td>
  	</tr>
    </c:forEach>
  </table>
  <div id="map-canvas"></div> 
</body> 
</html>
