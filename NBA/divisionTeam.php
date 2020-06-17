<?php
	include_once 'connectnba.php';
    $conn = OpenCon();
    $type = $_POST['type'];
    if ($type == 'Home') {
        $sql = "SELECT t.title FROM Team t 
        WHERE NOT EXISTS 
        ((SELECT g.awayTeamName FROM game g WHERE g.homeTeamName = t.title) 
         EXCEPT (SELECT h.awayTeamName FROM game h WHERE h.homePTS > h.awayPTS AND h.homeTeamName = t.title))";
    } else if ($type == 'Away') {
        $sql = "SELECT t.title FROM Team t 
        WHERE NOT EXISTS 
        ((SELECT g.homeTeamName FROM game g WHERE g.awayTeamName = t.title) 
         EXCEPT (SELECT h.homeTeamName FROM game h WHERE h.homePTS < h.awayPTS AND h.awayTeamName = t.title))";
    } else {
        $sql = "SELECT t.title FROM Team t 
        WHERE NOT EXISTS 
        ((SELECT g.awayTeamName FROM game g WHERE g.homeTeamName = t.title) 
         EXCEPT (SELECT h.awayTeamName FROM game h WHERE h.homePTS > h.awayPTS AND h.homeTeamName = t.title))
         intersect
        SELECT t.title FROM Team t 
        WHERE NOT EXISTS 
        ((SELECT g.homeTeamName FROM game g WHERE g.awayTeamName = t.title) 
         EXCEPT (SELECT h.homeTeamName FROM game h WHERE h.homePTS < h.awayPTS AND h.awayTeamName = t.title))";
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
echo '<span style ="font-size: 200%">' . 'Teams that won in all ' . $type . ' games: ' . '</span>';
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
		</tr>
	<?php 
		while($rows=mysqli_fetch_assoc($result))
		{
	?>
			<tr>
                <td><?php echo $rows['title']; ?></td>
			</tr>
    <?php 	
		}
    ?>
        
    </table>

</body>
</html>