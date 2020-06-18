<?php
	include_once 'connectnba.php';
    $conn = OpenCon();
    $sql = "SELECT * FROM Team;";
    $result = mysqli_query($conn, $sql);

?>
<!DOCTYPE html>
<html>
<head>
    <title>NBA Database</title>
    <link rel="stylesheet"  type="text/css" href="template.css">
</head>
<body>
  <div class="topnav">
  <a class="logo" href="home.php">
      <div class="logo-image">
            <img src="nba.png" class="img-fluid" width="50" height="30">
      </div>
    </a>
  <a class="active" href="home.php">Home</a>
  <a href="Seasons.php">Seasons</a>
  <a href="Teams.php">Teams</a>
  <a href="Players.php">Players</a>
  <div class="topnav-right">
  <a href="Admin.php">Admin</a>
  </div>
</div>
<form action="selectTeam.php" method="post">
<div>
<p style="font-size:20px">Search for a specific team:</p>
    <label for="team">Insert a team:</label>
    <input type="text" name="team" size="30">
    <button>Search</button>
    </form></div> </br>

<form action="divisionTeam.php" method="post">
<div>
<p style="font-size:20px">Find teams that have won all games at:</p>
        <select name="type">
        <option type="home">Home</option>
	    	<option type="away">Away</option>
        <option type="Home/Away">Home & Away</option>
        </select>
    <button>Search</button>
    </form></div> </br>
<h1 class="FormTitle">NBA League Teams:</h1>
<table>
		<tr>
	    <th></th>
	    <th>Title</th>
            <th>Founded</th>
            <th>Arena</th>
            <th>Division</th>
            <th>Conference</th>
		</tr>
	<?php 
		while($rows=mysqli_fetch_assoc($result))
		{
	?>
			<tr>
	 	<td><?php echo '<img src = "data:image;base64,'.base64_encode($rows['logo']).'" alt="Image" style = "width: 100px; height: 100px;" >'; ?></td>
                <td><?php echo $rows['title']; ?></td>
		<td><?php echo $rows['founded']; ?></td>
                <td><?php echo $rows['arena']; ?></td>
                <td><?php echo $rows['division']; ?></td>
                <td><?php echo $rows['conference']; ?></td>
			</tr>
    <?php 	
		}
    ?>
        
    </table>	
</body>
</html>