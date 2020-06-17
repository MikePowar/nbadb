<?php
	include_once 'connectnba.php';
    $conn = OpenCon();
    if(isset($_POST['submit'])){

        if(!empty($_POST['check_list'])) {    
            $check_list = implode(",",$_POST['check_list']);
            $arr = explode(",",$check_list);
        }
    
    }

    $sql = "SELECT " . $check_list . " FROM playerstatistic";
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

</br>
<div>
<h1 class="FormTitle">Narrowed stats:</h1>
<table>
        <tr>
        <?php foreach ($arr as $val) 
                {
            ?>
        <th><?php echo $val; ?></th>
        <?php 	
		    }
        ?>
        </tr>
	<?php 
		while($rows=mysqli_fetch_assoc($result))
		{
    ?>      
			    <tr>
                <?php foreach ($arr as $val) 
                {
            ?>
                <td><?php
                     echo $rows[$val]; 
                 ?></td>
			
        <?php 	
		    }
        ?>
        </tr>
    <?php 	
		}
    ?>
        
    </table>	
    </div>
</body>
</html>
