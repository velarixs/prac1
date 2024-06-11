-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2024 at 11:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prac_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(100) NOT NULL,
  `post_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `user_first_name` varchar(50) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `user_first_name`, `comment`, `date`) VALUES
(1, 3, 1, 'sungchan', 'wait he looks kinda good no?', '2024-06-10');

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(100) NOT NULL,
  `user1` int(100) NOT NULL,
  `user2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `user1`, `user2`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `post_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `first_name`, `title`, `content`, `category`, `image`, `date`, `status`) VALUES
(1, 2, 'admin', '[When Thunder Pours] Featured Resonator Convene: Boosted Drop Rate for [Yinlin]', 'During the event, boosted drop rates for 5-star Resonator [Yinlin], 4-star Resonators [Taoqi], [Aalto], and [Yuanwu]!\r\n\r\n✦Event Period✦\r\n2024/06/06 10:00 - 2024/06/26 11:59 (server time)\r\n\r\n✦Participation Requirement✦\r\nReach Union Level 8 or complete the trial in &#34;First Resonance&#34;.\r\n\r\n✦Convene Rules✦\r\n[When Thunder Pours] is a [Featured Resonator Convene] event type.\r\nUse [Radiant Tide] to Convene. You are guaranteed at least one 4-star or higher rarity Resonator or weapon every 10 attempts.\r\nThe Guarantee count is shared among all [Featured Resonator Convene] events. If a 5-star Resonator is not obtained, the Guarantee count is carried over any [Featured Resonator Convene] event and resets once a 5-star Resonator is obtained.\r\nFeatured Resonator [Yinlin] is exclusive to the [When Thunder Pours] Featured Resonator Convene and will not be available in other Convene types currently open.\r\nDuring the event, [Yinlin&#39;s Waveband] will be available on [Store - Afterglow Coral] and will be removed from the Store after the event ends. You may purchase up to 2 limited-stock [Yinlin&#39;s Waveband].\r\n\r\n※For more details, please refer to the Convene screen in-game.\r\n#WutheringWaves', 'news and updates', 'wuwa 1.jpg', '2024-06-10', 'active'),
(2, 2, 'admin', '[Absolute Pulsation] Featured Weapon Convene: Boosted Drop Rate for [Stringmaster]', 'During the event, boosted drop rates for 5-star Weapon [Stringmaster], 4-star Weapons [Jinzhou Keeper], [Cadenza], and [Lunar Cutter]!\r\n\r\n✦Event Period✦\r\n2024/06/06 10:00 - 2024/06/26 11:59 (server time)\r\n\r\n✦Participation Requirement✦\r\nReach Union Level 8 or complete the trial in &#34;First Resonance&#34;.\r\n\r\n✦Convene Rules✦\r\n[Absolute Pulsation] is a [Featured Weapon Convene] event type.\r\nUse [Forging Tide] to Convene. You are guaranteed at least one 4-star or higher rarity Resonator or weapon every 10 attempts.\r\nThe Guarantee count is shared among all [Featured Weapon Convene] events. The Guarantee count is carried over any [Featured Weapon Convene] events until a 5-star Weapon is obtained.\r\nThe 5-star Weapon you Convene is guaranteed to be [Stringmaster].\r\nFeatured Weapon [Stringmaster] is exclusive to the [Absolute Pulsation] Featured Weapon Convene and will not be available in other Convene types currently open.\r\n\r\n※For more details, please refer to the Convene screen in-game.\r\n#WutheringWaves', 'news and updates', 'wuwa 2.jpg', '2024-06-10', 'active'),
(3, 1, 'elle', 'GESHULIN LEAKS', 'wait, this character looks good no?', 'general', 'wuwa 3.jpg', '2024-06-10', 'active'),
(4, 2, 'admin', 'Wuthering Waves Battle Rush is now live!', 'Share your thrilling battle moments with hashtags #WutheringWaves and #WuwaBattle on X (Twitter)/YouTube Shorts/TikTok to win Astrite x2,000 and a chance to get featured on our social media with direct credits! Other than these rewards, 10 extra winners will be selected to receive a $50 Amazon Gift Card.\r\nSubmission Period: 2024/06/7 - 2024/06/27 08:59 (PT)\r\nYou can check more details through the link: https://wutheringwaves.kurogames.com/en/main/news/detail/866', 'news and updates', 'wuwa 4.jpg', '2024-06-11', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `sender_id` int(50) NOT NULL,
  `receiver_id` int(50) NOT NULL,
  `status` enum('pending','accept','reject','') NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `image`) VALUES
(1, 'elle', 'eow', 'elle@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 'pfp 1.png'),
(2, 'admin', '-', 'admin@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', ''),
(3, 'keria', 'kim', 'keria@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'pfp 2.jpg'),
(4, 'sunghoon', 'park', 'sunghoon@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', ''),
(5, 'sungchan', 'jung', 'sungchan@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'pfp 4.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
