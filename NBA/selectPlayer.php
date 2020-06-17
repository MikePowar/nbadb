<?php
	include_once 'connectnba.php';
    $conn = OpenCon();
    $player = $_POST['player'];
    $query = $_POST['query'];
    if ($query == "all") {
        $sql ="SELECT * FROM playerstatistic";
    } else {
        $sql = "SELECT * from playerStatistic WHERE pname = '$player'";
    }
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
<form action="statAggregate.php" method="post">
<p style="font-size:20px">Search average stats for:</p>
    <label for="averageStat">Select a stat:</label>
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
    <button>Search</button>
</form></div> </br>
<form action="statProject.php" method="post">
<div>
<p style="font-size:20px">Narrow stat values:</p>
        <input type="checkbox" value ="pdate" name="check_list[]">
        <label for="pDate">Date</label>
        <input type="checkbox" value ="pname" name="check_list[]">
        <label for="pname">Player Name</label>
        <input type="checkbox" value ="minutes_played" name="check_list[]">
        <label for="minutes_played">Minutes Played</label>
        <input type="checkbox" value ="points" name="check_list[]">
        <label for="points">Points</label>
        <input type="checkbox" value ="FT_attempted" name="check_list[]">
        <label for="FT_attempted">FT Attempted</label>
        <input type="checkbox" value ="FT_made" name="check_list[]">
        <label for="FT_made">FT Made</label>
        <input type="checkbox" value ="FT_Percent" name="check_list[]">
        <label for="FT_Percent">FT Percent</label>
        <input type="checkbox" value ="FG_attempted" name="check_list[]">
        <label for="FG_attempted">FG Attempted</label>
        <input type="checkbox" value ="FG_made" name="check_list[]">
        <label for="FG_made">FG Made</label>
        <input type="checkbox" value ="FG_percent" name="check_list[]">
        <label for="FG_percent">FG Percent</label>
        <input type="checkbox" value ="Threes_attempted" name="check_list[]">
        <label for="Threes_attempted">Threes Attempted</label>
        <input type="checkbox" value ="Threes_made" name="check_list[]">
        <label for="Threes_made">Threes Made</label>
        <input type="checkbox" value ="Threes_percent" name="check_list[]">
        <label for="Threes_percent">Threes Percent</label>
        <input type="checkbox" value ="total_rebounds" name="check_list[]">
        <label for="total_rebounds">Total Rebounds</label>
        <input type="checkbox" value ="offensive_rebounds" name="check_list[]">
        <label for="offensive_rebounds">Offensive Rebounds</label>
        <input type="checkbox" value ="defensive_rebounds" name="check_list[]">
        <label for="defensive_rebounds">Defensive Rebounds</label>
        <input type="checkbox" value ="assists" name="check_list[]">
        <label for="assists">Assists</label>
        <input type="checkbox" value ="steals" name="check_list[]">
        <label for="steals">Steals</label>
        <input type="checkbox" value ="personal_fouls" name="check_list[]">
        <label for="personal_fouls">Personal Fouls</label>
        <input type="checkbox" value ="turnovers" name="check_list[]">
        <label for="turnovers">Turnovers</label>
        <input type="checkbox" value ="blocks" name="check_list[]">
        <label for="blocks">Blocks</label>
        <input type="checkbox" value ="plus_minus" name="check_list[]">
        <label for="plus_minus">Plus Minus</label>
        </div>
    <div>
    <button type="submit" name="submit">Execute</button>
</div>
</form>
<div>
<form action="nestedAggregation.php" method="post">
<p style="font-size:20px">Find those above average:</p>
    <label for="averageStat">Select a stat:</label>
        <select name="stat" required>
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
    <button>Search</button>
</form></div> </br>




<br>
<br>
<br>
<?php if (mysqli_num_rows($result) == 0) 
	{
?>	
	 <h3>No players found</h3>
<?php
	} 
?>
<div style="overflow-x:auto;">
<table>
		<tr>
			<th>pDate</th>
			<th>pname</th>
            <th>minutes_played</th>
			<th>points</th>
            <th>FT_attempted</th>
            <th>FT_made</th>
            <th>FT_percent</th>
            <th>FG_attempted</th>
            <th>FG_made</th>
            <th>FG_percent</th>
            <th>Threes_attempted</th>
            <th>Threes_made</th>
            <th>Threes_percent</th>
            <th>total_rebounds</th>
            <th>offensive_rebounds</th>
            <th>defensive_rebounds</th>
            <th>assists</th>
            <th>steals</th>
            <th>personal_fouls</th>
            <th>turnovers</th>
            <th>blocks</th>
            <th>plus_minus</th>
		</tr>
	<?php 
		while($rows=mysqli_fetch_assoc($result))
		{
	?>
			<tr>
                <td><?php echo $rows['pDate']; ?></td>
				<td><?php echo $rows['pname']; ?></td>
				<td><?php echo $rows['minutes_played']; ?></td>
                <td><?php echo $rows['points']; ?></td>
                <td><?php echo $rows['FT_attempted']; ?></td>
                <td><?php echo $rows['FT_made']; ?></td>
                <td><?php echo $rows['FT_percent']; ?></td>
				<td><?php echo $rows['FG_attempted']; ?></td>
				<td><?php echo $rows['FG_made']; ?></td>
                <td><?php echo $rows['FG_percent']; ?></td>
                <td><?php echo $rows['Threes_attempted']; ?></td>
                <td><?php echo $rows['Threes_made']; ?></td>
                <td><?php echo $rows['Threes_percent']; ?></td>
				<td><?php echo $rows['total_rebounds']; ?></td>
				<td><?php echo $rows['offensive_rebounds']; ?></td>
                <td><?php echo $rows['defensive_rebounds']; ?></td>
                <td><?php echo $rows['assists']; ?></td>
                <td><?php echo $rows['steals']; ?></td>
                <td><?php echo $rows['personal_fouls']; ?></td>
                <td><?php echo $rows['turnovers']; ?></td>
                <td><?php echo $rows['blocks']; ?></td>
                <td><?php echo $rows['plus_minus']; ?></td>
			</tr>
    <?php 	
		}
    ?>
    </div>

</body>
</html>