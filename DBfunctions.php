<?php
    $servername = "localhost";
    $username = "root";
    $password = "123456789";
    $database = "tichudb";

	// create connection with the db
    $connection = mysqli_connect($servername, $username, $password, $database);
    //checking for successful connection
    // Check connection
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    }
    // echo "DB Connected successfully";
    
    $query = $_REQUEST["query"];

    switch ($query) {
        // GET the player's score
        case "player_A_score":
            $sql = "SELECT player_A_score FROM current_match";
            
            $result = mysqli_query($connection, $sql);
            if ($result != null) {
                $playerScore = mysqli_fetch_array($result)['player_A_score'];
                echo json_encode($playerScore);
                // echo ($result);
            } else {
                header("HTTP/1.1 400 No Content");
                echo 'No Content';
            }
            $connection->close();
            break;

        // GET the player's B score
        case "player_B_score":
            $sql = "SELECT player_B_score FROM current_match";
            
            $result = mysqli_query($connection, $sql);
            if ($result != null) {
                $playerScore = mysqli_fetch_array($result)['player_B_score'];
                echo json_encode($playerScore);
                // echo ($result);
            } else {
                header("HTTP/1.1 400 No Content");
                echo 'No Content';
            }
            $connection->close();
            break;

        // GET the status of the current match
        case "current_match_status":
            $sql = "SELECT match_status FROM current_match";
                
            $result = mysqli_query($connection, $sql);
            if ($result != null) {
                $currentMatch = mysqli_fetch_array($result)['match_status'];
                echo json_encode($currentMatch);
            } else {
                header("HTTP/1.1 400 No Content");
                echo 'No Content';
            }
            $connection->close();
            break;
            
        // GET the cards of player A
        case "player_A_cards":
            $sql = "SELECT player_A_cards FROM current_match";
            
            $result = mysqli_query($connection, $sql);
            if ($result != null) {
                $Acards = mysqli_fetch_array($result)['player_A_cards'];
                echo json_encode($Acards);
            } else {
                header("HTTP/1.1 400 No Content");
                echo 'No Content';
            }
            $connection->close();
            break;

        // GET the cards of player B 
         case "player_B_cards":
            $sql = "SELECT player_B_cards FROM current_match";
            
             $result = mysqli_query($connection, $sql);
             if ($result != null) {
                $Bcards = mysqli_fetch_array($result)['player_B_cards'];
                echo json_encode($Bcards);
            } else {
                header("HTTP/1.1 400 No Content");
                echo 'No Content';
            }
            $connection->close();
            break;

        // GET the cards that player A has in bank
        case "player_A_bank":
            $sql = "SELECT player_A_bank FROM current_match";
        
            $result = mysqli_query($connection, $sql);
            if ($result != null) {
                $Abank = mysqli_fetch_array($result)['player_A_bank'];
                echo json_encode($Abank);
            } else {
                header("HTTP/1.1 400 No Content");
                echo 'No Content';
            }
            $connection->close();
            break;


        // GET the cards that player B has in bank
        case "player_B_bank":
            $sql = "SELECT player_B_bank FROM current_match";
        
            $result = mysqli_query($connection, $sql);
            if ($result != null) {
                $Bbank = mysqli_fetch_array($result)['player_B_bank'];
                echo json_encode($Bbank);
            } else {
                header("HTTP/1.1 400 No Content");
                echo 'No Content';
            }
            $connection->close();
            break;

        //get the cards of the main stack
        case "thrown_stack_cards":
            $sql = "SELECT thrown_stack_cards FROM current_match";
        
            $result = mysqli_query($connection, $sql);
            if ($result != null) {
                $MainStack = mysqli_fetch_array($result)['thrown_stack_cards'];
                echo json_encode($MainStack);
            } else {
                header("HTTP/1.1 400 No Content");
                echo 'No Content';
            }
            $connection->close();
            break;

        //get the names of the players
        case "player":
            $sql = "SELECT username FROM player";
        
            $result = mysqli_query($connection, $sql);
            if ($result != null) {
                $names = mysqli_fetch_array($result)['username'];
                echo json_encode($names);
            } else {
                header("HTTP/1.1 400 No Content");
                echo 'No Content';
            }
            $connection->close();
            break;

        // UPDATE  player's A score with a new one
        case "player_A_scoreP":
            $sql = "UPDATE current_match SET player_A_score=" . $_REQUEST['score'];

            $result = mysqli_query($connection, $sql);     
            if (mysqli_query($connection, $sql)) {
               // echo "Record updated successfully";
                echo json_encode($result);
            } else {
                echo "Error updating record: " . mysqli_error($connection);
            }
            
            mysqli_close($connection);
        // $connection->close();
            break;
        
    // UPDATE  player's B score with a new one
    case "player_B_scoreP":
         $sql = "UPDATE current_match SET player_B_score=" . $_REQUEST['score'];

         $result = mysqli_query($connection, $sql);      
         if (mysqli_query($connection, $sql)) {
           // echo "Record2 updated successfully";
            echo json_encode($result);
        } else {
            echo "Error updating record2: "; //. mysqli_error($connection);
        }
        
        mysqli_close($connection);
        break;

    // GET whose turn is
    case "player_turn":
        $sql = "SELECT player_turn FROM current_match";
    
        $result = mysqli_query($connection, $sql);
        if ($result != null) {
            $turn = mysqli_fetch_array($result)['player_turn'];
            echo json_encode($turn);
        } else {
            header("HTTP/1.1 400 No Content");
            echo 'No Content';
        }
        $connection->close();
        break;

    // Change the players turn
    case "CHplayer_turn":
        $sql1 = "SELECT player_turn FROM current_match";
        
        $result1 = mysqli_query($connection, $sql1);
        if ($result1 == 'playerA') {
            $sql2="UPDATE current_match SET player_turn='playerB'";
            $result2 = mysqli_query($connection, $sql2);
            echo "B";
        } else {
            $sql3="UPDATE current_match SET player_turn='playerA'";
            $result3 = mysqli_query($connection, $sql3);
            echo "A";
        }
        $connection->close();
        break;


    //Search if this player exists
    case "Eplayer":
        $loginName = $_REQUEST['name'];
        $sql = "SELECT * FROM player WHERE username='$loginName'";
        $result = mysqli_query($connection, $sql);
        if (($result != null) ) {
            echo 'false'; 
        } else {
            echo 'true';
        }
        
        mysqli_close($connection);
        break;
  

    }
?>