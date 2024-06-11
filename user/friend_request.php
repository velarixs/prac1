<?php

include '../components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
   header('location:login.php');
};


?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>update profile</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="../css/user_style.css">

</head>
<body>
   
<!-- header section starts  -->
<?php include '../components/user_header.php'; ?>
<!-- header section ends -->

<!-- request section starts  -->
<section class="requests">

    <h1 class="heading">Requests</h1>
   
    <p class="request-title">Friend Request</p>
    <div class="box-container">
        
    <?php
    
    // Function to send a friend request
    function sendFriendRequest($sender_id, $receiver_id) {
    // Check if the sender and receiver are not the same user
    if ($sender_id == $receiver_id) {
        return 'You cannot send a friend request to yourself.';
    }

    // Check if the friend request already exists
    $query = "SELECT * FROM requests WHERE sender_id = '$sender_id' AND receiver_id = '$receiver_id'";
    $result = $conn->query($query);
    if ($result->num_rows > 0) {
        return 'You have already sent a friend request to this user.';
    }

    // Insert the friend request into the database
    $query = "INSERT INTO requests (sender_id, receiver_id, request_status, request_date) VALUES ('$sender_id', '$receiver_id', 'pending', NOW())";
    if ($conn->query($query) === TRUE) {
        return 'Friend request sent successfully.';
    } else {
        return 'Error sending friend request: ' . $conn->error;
    }
}

    // Example usage:
    $sender_id = 1; // Replace with the ID of the user sending the friend request
    $receiver_id = 2; // Replace with the ID of the user receiving the friend request
    echo sendFriendRequest($sender_id, $receiver_id);


    ?>

    </div>

</section>
<!-- request section ends -->





<!-- custom js file link  -->
<script src="js/user_script.js"></script>

</body>
</html>