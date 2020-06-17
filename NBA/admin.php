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
	<form action="managePlayer.php" method="post">
        <h>Manage player info:</h><br>
		<label for="PlayerID">PlayerID:</label>
        <input type="text" name="PlayerID" size="30" required><br>
        <label for="Name">Name:&nbsp&nbsp&nbsp&nbsp&nbsp</label>
        <input type="text" name="Name" size="30" required><br>
        <label for="Age">Age:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
        <input type="text" name="Age" size="30" required><br>
        <label for="Height">Height:&nbsp&nbsp&nbsp&nbsp</label>
        <input type="text" name="Height" size="30" required><br>
        <label for="Weight">Weight:&nbsp&nbsp&nbsp</label>
        <input type="text" name="Weight" size="30" required><br>
        <label for="Birthdate">Birthdate:</label>
		<input type="date" name="Birthdate" size="30" required>
		</div>
        <button type="submit" name="player" value ='insert'>Insert</button>
        <button type="submit" name="player" value ='delete'>Delete</button>
        <button type="submit" name="player" value ='update'>Update</button>
	</form>
	</div>
<div>