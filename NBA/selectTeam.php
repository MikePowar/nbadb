<?php
	include_once 'connectnba.php';
    $conn = OpenCon();
    $team = $_POST['team'];
    $sql = "SELECT * from teamstatistic WHERE tname = '$team'";
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
<br>
<?php
echo '<span style ="font-size: 200%">' . 'Start of Season to Date ' . $team . ' Stats'. '</span>';
?>
<br>
<br>


<?php if (mysqli_num_rows($result) == 0) 
	{
?>	
	 <h3>No stats found</h3>
<?php
	} 
?>
<table style="overflow-x:auto;">
		<tr>
            <th>Date</th>
			<th>Name</th>
            <th>Games Played</th>
			<th>Points</th>
            <th>Wins</th>
            <th>Losses</th>
            <th>FT Attempted</th>
            <th>FT Made</th>
            <th>FT Percent</th>
            <th>FG Attempted</th>
            <th>FG Made</th>
            <th>FG Percent</th>
            <th>Threes Attempted</th>
            <th>Threes Made</th>
            <th>Threes Percent</th>
            <th>Total Rebounds</th>
            <th>Offensive Rebounds</th>
            <th>Defensive Rebounds</th>
            <th>Assists</th>
            <th>Steals</th>
            <th>Personal Fouls</th>
            <th>Turnovers</th>
            <th>Blocks</th>
		</tr>
	<?php 
		while($rows=mysqli_fetch_assoc($result))
		{
	?>
			<tr>
                <td><?php echo $rows['tDate']; ?></td>
				<td><?php echo $rows['tname']; ?></td>
				<td><?php echo $rows['games_played']; ?></td>
                <td><?php echo $rows['points']; ?></td>
                <td><?php echo $rows['wins']; ?></td>
                <td><?php echo $rows['losses']; ?></td>
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
                <td><?php echo $rows['assist']; ?></td>
                <td><?php echo $rows['steals']; ?></td>
                <td><?php echo $rows['personal_fouls']; ?></td>
                <td><?php echo $rows['turnovers']; ?></td>
                <td><?php echo $rows['blocks']; ?></td>
			</tr>
    <?php 	
		}
    ?>
    </table>

    <form action="teamJoin.php" method="post">
<div>
<p style="font-size:20px">Get team members:</p>
    <input type="hidden" name="team" value="<?php echo htmlspecialchars($team);?>"/>
    <label for="member">Select:</label>
        <select name="member" required>
        <option type="Players">Players</option>
	    	<option type="Owners">Owners</option>
        <option type="Coaches">Coaches</option>
        </select>
        <button>Search</button>
</div> </br>


</body>
</html>