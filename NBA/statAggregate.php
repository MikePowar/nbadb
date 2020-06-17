<?php
	include_once 'connectnba.php';
    $conn = OpenCon();
    $stat = $_POST['stat'];
    $extrema = $_POST['extrema']?? 'Avg';
    if ($extrema == 'Avg') {
      $sql = "SELECT Avg($stat) as avg from playerstatistic;";
    } else {
      $sql = "SELECT pname,$stat from playerstatistic where $stat = (select $extrema($stat) from playerstatistic);";
    };
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
  if ($extrema == 'Avg') {
		while($rows=mysqli_fetch_assoc($result))
		{
      echo '<span style ="font-size: 200%">' . 'Avg value for ' . $stat . ' : ' . $rows['avg'] . '</span>';
    }
  } else {
    echo '<span style ="font-size: 200%">' . $extrema . ' value for ' . $stat . ' : ' . '</span>';
?>
<table>
		<tr>
			      <th>Name</th>
			      <th><?php echo $stat; ?></th>

		</tr>
  <?php 
		while($rows=mysqli_fetch_assoc($result))
		{
	?>
  
  			<tr>
                <td><?php echo $rows['pname']; ?></td>
				        <td><?php echo $rows[$stat]; ?></td>
        </tr>

<?php
    }
  }
?>
</table>





</body>
</html>