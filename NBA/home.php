<?php
	include_once 'connectnba.php';
    $conn = OpenCon();
    $sql = "SELECT * FROM game where year(mdate) = 2018 or year(mdate) = 2019;";
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
<h1>Matches 2018-19 Season</h1>
<table >
		<tr>
			<th>Date</th>
			<th>Home Team</th>
      <th>Away Team</th>
			<th>Home PTS</th>
      <th>Away PTS</th>
      <th>Location</th>
		</tr>
	<?php 
		while($rows=mysqli_fetch_assoc($result))
		{
	?>
			<tr>
        <td><?php echo $rows['mDate']; ?></td>
				<td><?php echo $rows['homeTeamName']; ?></td>
				<td><?php echo $rows['awayTeamName']; ?></td>
        <td><?php echo $rows['homePTS']; ?></td>
        <td><?php echo $rows['awayPTS']; ?></td>
        <td><?php echo $rows['located']; ?></td>
			</tr>
    <?php 	
		}
    ?>
    </div>
        
    </table>	
</body>
</html>