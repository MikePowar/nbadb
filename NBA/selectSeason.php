<?php
	include_once 'connectnba.php';
    $conn = OpenCon();
    $year = $_POST['year'];
    $type = $_POST['type'];
    $sql = "SELECT * from team WHERE exists 
    (SELECT ts.tname from TeamSeasons ts, Season s
    where $year = year(ts.startDate) 
    and '$type' = s.seasonType)";
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
<p style="font-size:20px">Get team stats:</p>
    <label for="team">Insert a team:</label>
    <input type="text" name="team" size="30" required>
    <button>Search</button>
</div> </br>
<?php
echo '<span style ="font-size: 200%">' . 'Teams that played in ' . $type . ' season '. $year . ':' . '</span>';
?>
<?php if (mysqli_num_rows($result) == 0) 
	{
?>	
	 <h3>No teams found</h3>
<?php
	} 
?>
<table>
		<tr>
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