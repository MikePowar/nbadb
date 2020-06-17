<?php
	include_once 'connectnba.php';
    $conn = OpenCon();
    $sql = "SELECT * FROM Player;";
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
<div>
<form action="selectPlayer.php" method="post">
<p style="font-size:20px">Search for a player's stats:</p>
    <label for="player">Insert a player:</label>
    <input type="text" name="player" size="30">
        <button type="submit" name="query" value ='single'>Search</button>
        <button type="submit" name="query" value ='all'>Get all stats</button>
</form>
</div> 
</br>
<div>
<form action="statAggregate.php" method="post">
<p style="font-size:20px">Show highs/lows for a single game:</p>
    <label for="stat">Select a stat:</label>
        <select name="stat" required>
        <option type="minutes_played">Minutes_Played</option>
	    	<option type="points">Points</option>
        <option type="FT_attempted">FT_Attempted</option>
        <option type="FT_made">FT_Made</option>
	    	<option type="FT_percent">FT_Percent</option>
        <option type="FG_attempted">FG_Attempted</option>
        <option type="FG_made">FG_Made</option>
	    	<option type="FG_percent">FG_Percent</option>
        <option type="Threes_attempted">Threes_Attempted</option>
        <option type="Threes_made">Threes_Made</option>
	    	<option type="Threes_percent">Threes_Percent</option>
        <option type="total_rebounds">Total_Rebounds</option>
        <option type="offensive_rebounds">Offensive_Rebounds</option>
	    	<option type="defensive_rebounds">Defensive_Rebounds</option>
        <option type="assists">Assists</option>
        <option type="steals">Steals</option>
	    	<option type="personal_fouls">Personal_Fouls</option>
        <option type="turnovers">Turnovers</option>
        <option type="blocks">Blocks</option>
	    	<option type="plus_minus">Plus_Minus</option>
        </select>
    <label for="extrema">Find:</label>
        <select name="extrema" required>
        <option type="max">Max</option>
	    	<option type="min">Min</option>
        <option type="avg">Avg</option>
        </select>
        <button>Search</button>
  </form>
  </div> 
  </br>
<div>
<h1 class="FormTitle">NBA League Players:</h1>
<table>
		<tr>
          <th>PlayerID</th>
          <th>Name</th>
            <th>Age</th>
            <th>Height</th>
            <th>Weight</th>
            <th>Birthdate</th>
		</tr>
	<?php 
		while($rows=mysqli_fetch_assoc($result))
		{
	?>
			<tr>
                <td><?php echo $rows['playerID']; ?></td>
				        <td><?php echo $rows['name']; ?></td>
                <td><?php echo $rows['age']; ?></td>
                <td><?php echo $rows['height']; ?></td>
                <td><?php echo $rows['weight']; ?></td>
                <td><?php echo $rows['dob']; ?></td>
			</tr>
    <?php 	
		}
    ?>
        
    </table>	
    </div>
</body>
</html>