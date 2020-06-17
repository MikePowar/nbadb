<?php
	include_once 'connectnba.php';
	$conn = OpenCon();
	$id = $_POST['PlayerID'];
	$name = $_POST['Name'];
    $age = $_POST['Age'];
    $height = $_POST['Height'];
    $weight = $_POST['Weight'];
    $birthdate = $_POST['Birthdate'];
    $date=date("Y-m-d H:i:s",strtotime($birthdate));
    $player = $_POST['player'];
    if ($player == "insert") {
        $sql = "INSERT INTO player (playerID, name, age, height, weight, dob) VALUES ($id, '$name', $age, $height, $weight, '$birthdate');";
    } elseif ($player == "delete") {
        $sql = "DELETE FROM player WHERE playerID = $id";
    } else {
        $sql = "UPDATE player set playerID = $id, name = '$name', age = $age, height = $height, weight = $weight, dob = '$birthdate' WHERE playerID = $id";
    }
	mysqli_query($conn, $sql);	
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
<h1>Valid changes will be reflected...</h1>
<?php 
header( "refresh:2; url=Players.php" ); 
exit; 
?>
</body>
</html>