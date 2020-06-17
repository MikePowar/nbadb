<?php
	include_once 'connectnba.php';
    $conn = OpenCon();
    $sql = "SELECT * FROM Season;";
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
<h1 class="FormTitle">NBA League Season Index:</h1>
<form action="selectSeason.php" method="post">
<div>
<p style="font-size:20px">Search for a specific season:</p>
    <label for="year">Insert a year:</label>
    <input type="text" name="year" size="30" required>
    <label for="type">Select type:</label>
        <select name="type" required>
        <option type="Preseason">Preseason</option>
	    	<option type="Regular">Regular</option>
        <option type="Playoff">Playoff</option>
        </select>
        <button>Search</button>
</div> </br>
<table>
		<tr>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Season Type</th>
		</tr>
	<?php 
		while($rows=mysqli_fetch_assoc($result))
		{
	?>
			<tr>
                <td><?php echo $rows['startDate']; ?></td>
				<td><?php echo $rows['endDate']; ?></td>
				<td><?php echo $rows['seasonType']; ?></td>
			</tr>
    <?php 	
		}
    ?>
        
    </table>	
</body>
</html>