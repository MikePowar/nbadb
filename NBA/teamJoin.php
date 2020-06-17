<?php
	include_once 'connectnba.php';
    $conn = OpenCon();
    $member = $_POST['member'];
    $team = $_POST['team'];
    if ($member == 'Players') {
      $sql = "SELECT p.name,pt.position,pt.number from playerteams pt INNER JOIN player p ON pt.tname = '$team' and pt.playerID = p.playerID";
    } else if ($member == 'Owners') {
      $sql = "SELECT s.name,o.net_worth from `owner` o INNER JOIN staff s ON s.tname = '$team' and o.staffID = s.staffID";
    } else {
      $sql = "SELECT s.name,c.position,c.wins,c.losses from `coach` c INNER JOIN staff s ON s.tname = '$team' and c.staffID = s.staffID";
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

<?php 
if ($member == 'Players') {
  ?>
    <table>
    <br>
    <h1>Players</h1>
    <br>
		<tr>
			<th>Name</th>
            <th>Position</th>
            <th>Number</th>
		</tr>
	<?php 
		while($rows=mysqli_fetch_assoc($result))
		{
	?>
			<tr>
                <td><?php echo $rows['name']; ?></td>
                <td><?php echo $rows['position']; ?></td>
                <td><?php echo $rows['number']; ?></td>
			</tr>
    <?php 	
		}
    ?>
<?php 
} elseif ($member == 'Owners') {
  ?>        
    </table>
    <br>
    <h1>Owner</h1>
    <br>

    <table>
		<tr>
			<th>Name</th>
			<th>Net Worth (Billion)</th>
		</tr>
	<?php 
		while($rows=mysqli_fetch_assoc($result))
		{
	?>
			<tr>
                <td><?php echo $rows['name']; ?></td>
				<td><?php echo $rows['net_worth']; ?></td>
			</tr>
    <?php 	
		}
    ?>
<?php 
} else {
  ?>  
    </table>

    <br>
    <h1>Coach</h1>
    <br>

    <table>
		<tr>
			<th>Name</th>
			<th>Position</th>
            <th>Wins</th>
            <th>Losses</th>
		</tr>
	<?php 
		while($rows=mysqli_fetch_assoc($result))
		{
	?>
			<tr>
                <td><?php echo $rows['name']; ?></td>
				<td><?php echo $rows['position']; ?></td>
                <td><?php echo $rows['wins']; ?></td>
                <td><?php echo $rows['losses']; ?></td>
			</tr>
    <?php 	
		}
    ?>
        
    </table>
    <?php 	
		}
    ?>


</body>
</html>