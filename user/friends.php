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

<!-- friend section starts  -->
<section class="friends">

    <h1 class="heading">Friends</h1>

    <p class="friends-title">Friends List</p>
    <div class="box-container">

    <?php

    $s_id = $_SESSION['user_id'];
    $sql_friendsList_get = "SELECT * FROM friends where user1 = :s_id or user2 = :s_id";

    $stmt_friendsList_get = $conn->prepare($sql_friendsList_get);
    $stmt_friendsList_get->bindParam(':s_id', $s_id);
    $stmt_friendsList_get->execute();

    while($row_friensList_get = $stmt_friendsList_get->fetch(PDO::FETCH_ASSOC)) {
        $myFriend = $row_friensList_get['user1'];
        // fetch name
        $sql_getName = "SELECT * FROM friends where id = :myFriend";
        $stmt_getName = $conn->prepare($sql_getName);
        $stmt_getName->bindParam(':myFriend', $myFriend);
        $stmt_getName->execute();
        $row_getName = $stmt_getName->fetch(PDO::FETCH_ASSOC);
        //  fetch profile pic
        $sql_ProfilePic = "SELECT * FROM users where id = :myFriend";
        $stmt_ProfilePic = $conn->prepare($sql_ProfilePic);
        $stmt_ProfilePic->bindParam(':myFriend', $myFriend);
        $stmt_ProfilePic->execute();
        $row_ProfilePic = $stmt_ProfilePic->fetch(PDO::FETCH_ASSOC);
        ?>


        <div class="box">
            <div class="col-4">
                <img src="../uploaded_img/<?php echo $row_ProfilePic['image']?>" alt="" height=50 width=50>
            </div>
            <div class="col-4">
                <h1 class='text-uppercase'><?php echo $fetch_profile['first_name']; ?></h1>
            </div>
        </div>

        <?php
            
        }  

    ?>
        

    </div>
</section>
<!-- friends section ends -->















<!-- custom js file link  -->
<script src="js/user_script.js"></script>

</body>
</html>






