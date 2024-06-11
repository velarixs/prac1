<?php
if(isset($message)){
   foreach($message as $message){
      echo '
      <div class="message">
         <span>'.$message.'</span>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
      ';
   }
}
?>

<header class="header">

   <a href="dashboard.php" class="logo">Profile<span>Page</span></a>

   <div class="profile">
      <?php
         $select_profile = $conn->prepare("SELECT * FROM `users` WHERE  id = ?");
         $select_profile->execute([$user_id]);
         $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
      ?>
      <p><?= $fetch_profile['first_name']; ?></p>
      <a href="update_profile.php" class="btn">update profile</a>
   </div>

   <nav class="navbar">
      <a href="dashboard.php"><i class="fas fa-desktop"></i> <span>dashboard</span></a>
      <a href="../home.php"><i class="fas fa-home"></i> <span>home</span></a>
      <a href="add_posts.php"><i class="fas fa-pen"></i> <span>add posts</span></a>
      <a href="view_posts.php"><i class="fas fa-eye"></i> <span>view posts</span></a>
      <a href="friends.php"><i class="fas fa-inbox"></i> <span>friends</span></a>
      <a href="friend_request.php"><i class="fas fa-bell"></i> <span>requests</span></a>
      <a href="../components/logout.php" style="color:var(--red);" onclick="return confirm('logout from the website?');"><i class="fas fa-right-from-bracket"></i><span>logout</span></a>
   </nav>

   <div class="flex-btn">
      <a href="../login.php" class="option-btn">login</a>
      <a href="../register.php" class="option-btn">register</a>
   </div>

</header>

<div id="menu-btn" class="fas fa-bars"></div>
