-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 27, 2023 at 05:43 PM
-- Server version: 10.3.38-MariaDB-log-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xonssl20_ci`
--

-- --------------------------------------------------------

--
-- Table structure for table `ac_messages`
--

CREATE TABLE `ac_messages` (
  `id` int(11) NOT NULL,
  `m_from` int(11) NOT NULL DEFAULT 0,
  `m_to` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `m_from_delete` tinyint(1) NOT NULL DEFAULT 0,
  `m_to_delete` tinyint(1) NOT NULL DEFAULT 0,
  `dt_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ac_messages`
--

INSERT INTO `ac_messages` (`id`, `m_from`, `m_to`, `message`, `is_read`, `m_from_delete`, `m_to_delete`, `dt_updated`) VALUES
(1, 2, 4, 'Hello, book rule', 1, 0, 0, '2023-04-25 21:56:30'),
(2, 2, 3, 'Hello, my favourite book is White Teeth by Zadie Smith. Have you read it?', 1, 0, 0, '2023-04-25 21:57:23');

-- --------------------------------------------------------

--
-- Table structure for table `ac_profiles`
--

CREATE TABLE `ac_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(256) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:offline;1:online;2:away;3:busy',
  `dt_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ac_profiles`
--

INSERT INTO `ac_profiles` (`id`, `user_id`, `fullname`, `avatar`, `status`, `dt_updated`) VALUES
(1, 4, 'clee84', '1682460198164.jpg', 0, '2023-04-25 22:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `ac_settings`
--

CREATE TABLE `ac_settings` (
  `id` int(11) NOT NULL,
  `s_name` varchar(512) DEFAULT NULL,
  `s_value` text DEFAULT NULL,
  `dt_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ac_settings`
--

INSERT INTO `ac_settings` (`id`, `s_name`, `s_value`, `dt_updated`) VALUES
(1, 'admin_user_id', '1', '2019-10-18 12:53:26'),
(2, 'pagination_limit', '5', '2019-10-18 12:53:26'),
(3, 'img_upload_path', 'upload', '2019-03-06 00:00:00'),
(4, 'assets_path', 'assets', '2019-10-18 12:53:26'),
(5, 'users_table', 'users', '2019-10-18 12:53:26'),
(6, 'users_col_id', 'id', '2019-10-18 12:53:26'),
(7, 'users_col_email', 'email', '2019-10-18 12:53:26'),
(8, 'site_name', 'AddChat', '2019-10-18 12:53:26'),
(9, 'site_logo', NULL, '2019-09-06 08:25:52'),
(10, 'chat_icon', NULL, '2019-09-06 08:24:20'),
(11, 'notification_type', '0', '2019-10-18 12:53:26'),
(12, 'footer_text', 'AddChat | by Classiebit', '2019-10-18 12:53:26'),
(13, 'footer_url', 'https://classiebit.com/addchat-codeigniter-pro', '2019-10-18 12:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `ac_users_messages`
--

CREATE TABLE `ac_users_messages` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `buddy_id` int(11) NOT NULL,
  `messages_count` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ci_books`
--

CREATE TABLE `ci_books` (
  `book_title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `book_img` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ci_books`
--

INSERT INTO `ci_books` (`book_title`, `author`, `description`, `book_img`, `author_id`, `book_id`) VALUES
('A Confederacy of Dunces', 'John Kennedy Toole', 'Meet Ignatius J. Reilly, the hero of John Kennedy Toole\'s tragicomic tale, A Confederacy of Dunces. This 30-year-old medievalist lives at home with his mother in New Orleans, pens his magnum opus on Big Chief writing pads he keeps hidden under his bed, and relays to anyone who will listen the traumatic experience he once had on a Greyhound Scenicruiser bound for Baton Rouge. (\"Speeding along in that bus was like hurtling into the abyss.\") But Ignatius\'s quiet life of tyrannizing his mother and writing his endless comparative history screeches to a halt when he is almost arrested by the overeager Patrolman Mancuso--who mistakes him for a vagrant--and then involved in a car accident with his tipsy mother behind the wheel. One thing leads to another, and before he knows it, Ignatius is out pounding the pavement in search of a job.\r\nOver the next several hundred pages, our hero stumbles from one adventure to the next. His stint as a hotdog vendor is less than successful, and he soon turns his employers at the Levy Pants Company on their heads. Ignatius\'s path through the working world is populated by marvelous secondary characters: the stripper Darlene and her talented cockatoo; the septuagenarian secretary Miss Trixie, whose desperate attempts to retire are constantly, comically thwarted; gay blade Dorian Greene; sinister Miss Lee, proprietor of the Night of Joy nightclub; and Myrna Minkoff, the girl Ignatius loves to hate.\r\nJohn Kennedy Toole committed suicide in 1969 and never saw the publication of his novel. Ignatius Reilly is what he left behind, a fitting memorial to a talented and tormented life. --Alix Wilber', 'a-confederacy-of-dunces.jpeg', 2, 4),
('A Wrinkle In Time', 'Madeleine L\'Engle', 'Out of this wild night, a strange visitor comes to the Murry house and beckons Meg, her brother Charles Wallace, and their friend Calvin O\'Keefe on a most dangerous and extraordinary adventure—one that will threaten their lives and our universe.\r\n\r\nWinner of the 1963 Newbery Medal, A Wrinkle in Time is the first book in Madeleine L\'Engle\'s classic Time Quintet.', 'a-wrinkle-in-time.jpeg', 3, 5),
('Never Let Me Go', 'Kazuo Ishiguro', 'Hailsham seems like a pleasant English boarding school, far from the influences of the city. Its students are well tended and supported, trained in art and literature, and become just the sort of people the world wants them to be. But, curiously, they are taught nothing of the outside world and are allowed little contact with it.\r\n\r\nWithin the grounds of Hailsham, Kathy grows from schoolgirl to young woman, but it’s only when she and her friends Ruth and Tommy leave the safe grounds of the school (as they always knew they would) that they realize the full truth of what Hailsham is.\r\n\r\nNever Let Me Go breaks through the boundaries of the literary novel. It is a gripping mystery, a beautiful love story, and also a scathing critique of human arrogance and a moral examination of how we treat the vulnerable and different in our society. In exploring the themes of memory and the impact of the past, Ishiguro takes on the idea of a possible future to create his most moving and powerful book to date.', 'never-let-me-go.jpg', 4, 6),
('The Road', 'Cormac McCarthy', 'A searing, postapocalyptic novel destined to become Cormac McCarthy’s masterpiece.\r\n\r\nA father and his son walk alone through burned America. Nothing moves in the ravaged landscape save the ash on the wind. It is cold enough to crack stones, and when the snow falls it is gray. The sky is dark. Their destination is the coast, although they don’t know what, if anything, awaits them there. They have nothing; just a pistol to defend themselves against the lawless bands that stalk the road, the clothes they are wearing, a cart of scavenged food—and each other.\r\n\r\nThe Road is the profoundly moving story of a journey. It boldly imagines a future in which no hope remains, but in which the father and his son, “each the other’s world entire,” are sustained by love. Awesome in the totality of its vision, it is an unflinching meditation on the worst and the best that we are capable of: ultimate destructiveness, desperate tenacity, and the tenderness that keeps two people alive in the face of total devastation.', 'the-road.jpeg', 2, 7),
('To Kill a Mockingbird', 'Harper Lee', 'The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it. \"To Kill A Mockingbird\" became both an instant bestseller and a critical success when it was first published in 1960. It went on to win the Pulitzer Prize in 1961 and was later made into an Academy Award-winning film, also a classic.\r\n\r\nCompassionate, dramatic, and deeply moving, \"To Kill A Mockingbird\" takes readers to the roots of human behavior - to innocence and experience, kindness and cruelty, love and hatred, humor and pathos. Now with over 18 million copies in print and translated into forty languages, this regional story by a young Alabama woman claims universal appeal. Harper Lee always considered her book to be a simple love story. Today it is regarded as a masterpiece of American literature.', 'to-kill-a-mockingbird.jpeg', 3, 8),
('Anna Karenina', 'Leo Tolstoy', 'Acclaimed by many as the world\'s greatest novel, Anna Karenina provides a vast panorama of contemporary life in Russia and of humanity in general. In it Tolstoy uses his intense imaginative insight to create some of the most memorable characters in all of literature. Anna is a sophisticated woman who abandons her empty existence as the wife of Karenin and turns to Count Vronsky to fulfil her passionate nature - with tragic consequences. Levin is a reflection of Tolstoy himself, often expressing the author\'s own views and convictions.\r\n\r\nThroughout, Tolstoy points no moral, merely inviting us not to judge but to watch. As Rosemary Edmonds comments, \'He leaves the shifting patterns of the kaleidoscope to bring home the meaning of the brooding words following the title, \'Vengeance is mine, and I will repay.', 'anna-karenina.jpeg', 2, 11),
('White Teeth', 'Zadie Smith', 'At the center of this invigorating novel are two unlikely friends, Archie Jones and Samad Iqbal. Hapless veterans of World War II, Archie and Samad and their families become agents of England’s irrevocable transformation. A second marriage to Clara Bowden, a beautiful, albeit tooth-challenged, Jamaican half his age, quite literally gives Archie a second lease on life, and produces Irie, a knowing child whose personality doesn’t quite match her name (Jamaican for “no problem”). Samad’s late-in-life arranged marriage (he had to wait for his bride to be born), produces twin sons whose separate paths confound Iqbal’s every effort to direct them, and a renewed, if selective, submission to his Islamic faith. Set against London’s racial and cultural tapestry, venturing across the former empire and into the past as it barrels toward the future, White Teeth revels in the ecstatic hodgepodge of modern life, flirting with disaster, confounding expectations, and embracing the comedy of daily existence.', 'white-teeth.jpeg', 2, 12),
('The Brief Wondrous Life of Oscar Wao', 'Junot Diaz', 'Things have never been easy for Oscar, a sweet but disastrously overweight, lovesick Dominican ghetto nerd. From his home in New Jersey, where he lives with his old-world mother and rebellious sister, Oscar dreams of becoming the Dominican J. R. R. Tolkien and, most of all, of finding love. But he may never get what he wants, thanks to the Fukœ—the curse that has haunted the Oscar\'s family for generations, dooming them to prison, torture, tragic accidents, and, above all, ill-starred love. Oscar, still waiting for his first kiss, is just its most recent victim.\r\n\r\nDiaz immerses us in the tumultuous life of Oscar and the history of the family at large, rendering with genuine warmth and dazzling energy, humor, and insight the Dominican-American experience, and, ultimately, the endless human capacity to persevere in the face of heartbreak and loss. A true literary triumph, The Brief Wondrous Life of Oscar Wao confirms Junot Diaz as one of the best and most exciting voices of our time.', 'the-brief-wondrous-life-of-oscar-wao.jpeg', 2, 14),
('Where the Sidewalk Ends', 'Shel Silverstein', 'Come in... for where the sidewalk ends, Shel Silverstein\'s world begins.\r\n\r\nShel Silverstein, the New York Times bestselling author of The Giving Tree, A Light in the Attic, Falling Up, and Every Thing On It, has created a poetry collection that is outrageously funny and deeply profound.\r\n\r\nYou\'ll meet a boy who turns into a TV set, and a girl who eats a whale. The Unicorn and the Bloath live there, and so does Sarah Cynthia Sylvia Stout who will not take the garbage out. It is a place where you wash your shadow and plant diamond gardens, a place where shoes fly, sisters are auctioned off, and crocodiles go to the dentist.\r\n\r\nShel Silverstein\'s masterful collection of poems and drawings stretches the bounds of imagination and will be cherished by readers of all ages.', 'where-the-sidewalk-ends.jpeg', 2, 15),
('The Giver', 'Lois Lowry', 'At the age of twelve, Jonas, a young boy from a seemingly utopian, futuristic world, is singled out to receive special training from The Giver, who alone holds the memories of the true joys and pain of life.', 'the-giver.jpeg', 2, 16),
('Valley of the Dolls', 'Jacqueline Susann', 'Dolls: red or black; capsules or tablets; washed down with vodka or swallowed straight-for Anne, Neely, and Jennifer, it doesn\'t matter, as long as the pill bottle is within easy reach. These three women become best friends when they are young and struggling in New York City and then climb to the top of the entertainment industry -- only to find that there is no place left to go but down -- into the Valley of the Dolls.', 'valley-of-the-dolls.jpeg', 4, 17),
('1984', 'George Orwell', 'The new novel by George Orwell is the major work towards which all his previous writing has pointed. Critics have hailed it as his \"most solid, most brilliant\" work. Though the story of Nineteen Eighty-Four takes place thirty-five years hence, it is in every sense timely. The scene is London, where there has been no new housing since 1950 and where the city-wide slums are called Victory Mansions. Science has abandoned Man for the State. As every citizen knows only too well, war is peace.\r\n\r\nTo Winston Smith, a young man who works in the Ministry of Truth (Minitru for short), come two people who transform this life completely. One is Julia, whom he meets after she hands him a slip reading, \"I love you.\" The other is O\'Brien, who tells him, \"We shall meet in the place where there is no darkness.\" The way in which Winston is betrayed by the one and, against his own desires and instincts, ultimately betrays the other, makes a story of mounting drama and suspense.', '1984.jpeg', 4, 18),
('Lolita', 'Vladimir Nabokov', 'Humbert Humbert - scholar, aesthete and romantic - has fallen completely and utterly in love with Dolores Haze, his landlady\'s gum-snapping, silky skinned twelve-year-old daughter. Reluctantly agreeing to marry Mrs Haze just to be close to Lolita, Humbert suffers greatly in the pursuit of romance; but when Lo herself starts looking for attention elsewhere, he will carry her off on a desperate cross-country misadventure, all in the name of Love. Hilarious, flamboyant, heart-breaking and full of ingenious word play, Lolita is an immaculate, unforgettable masterpiece of obsession, delusion and lust.', 'lolita.jpeg', 2, 21),
('The Amazing Adventures of Kavalier & Clay', 'Michael Chabon', 'Joe Kavalier, a young Jewish artist who has also been trained in the art of Houdini-esque escape, has just smuggled himself out of Nazi-invaded Prague and landed in New York City. His Brooklyn cousin Sammy Clay is looking for a partner to create heroes, stories, and art for the latest novelty to hit America - the comic book. Drawing on their own fears and dreams, Kavalier and Clay create the Escapist, the Monitor, and Luna Moth, inspired by the beautiful Rosa Saks, who will become linked by powerful ties to both men. With exhilarating style and grace, Michael Chabon tells an unforgettable story about American romance and possibility.', 'the-amazing-adventures-of-kavalier-clay.jpeg', 2, 22),
('Normal People', 'Sally Rooney', 'At school Connell and Marianne pretend not to know each other. He’s popular and well-adjusted, star of the school soccer team while she is lonely, proud, and intensely private. But when Connell comes to pick his mother up from her housekeeping job at Marianne’s house, a strange and indelible connection grows between the two teenagers - one they are determined to conceal.\r\n\r\nA year later, they’re both studying at Trinity College in Dublin. Marianne has found her feet in a new social world while Connell hangs at the sidelines, shy and uncertain. Throughout their years in college, Marianne and Connell circle one another, straying toward other people and possibilities but always magnetically, irresistibly drawn back together. Then, as she veers into self-destruction and he begins to search for meaning elsewhere, each must confront how far they are willing to go to save the other.\r\n\r\nSally Rooney brings her brilliant psychological acuity and perfectly spare prose to a story that explores the subtleties of class, the electricity of first love, and the complex entanglements of family and friendship.', 'normal-people.jpeg', 2, 23),
('The Known World', 'Edward P. Jones', 'One of the most acclaimed novels in recent memory, The Known World is a daring and ambitious work by Pulitzer Prize winner Edward P. Jones.\r\n\r\nThe Known World tells the story of Henry Townsend, a black farmer and former slave who falls under the tutelage of William Robbins, the most powerful man in Manchester County, Virginia. Making certain he never circumvents the law, Townsend runs his affairs with unusual discipline. But when death takes him unexpectedly, his widow, Caldonia, can\'t uphold the estate\'s order, and chaos ensues. Jones has woven a footnote of history into an epic that takes an unflinching look at slavery in all its moral complexities.', 'the-known-world.jpeg', 4, 24),
('And Then There Were None', 'Agatha Christie', 'First, there were ten—a curious assortment of strangers summoned as weekend guests to a little private island off the coast of Devon. Their host, an eccentric millionaire unknown to all of them, is nowhere to be found. All that the guests have in common is a wicked past they\'re unwilling to reveal—and a secret that will seal their fate. For each has been marked for murder. A famous nursery rhyme is framed and hung in every room of the mansion:\r\n\r\n\"Ten little boys went out to dine; One choked his little self and then there were nine. Nine little boys sat up very late; One overslept himself and then there were eight. Eight little boys traveling in Devon; One said he\'d stay there then there were seven. Seven little boys chopping up sticks; One chopped himself in half and then there were six. Six little boys playing with a hive; A bumblebee stung one and then there were five. Five little boys going in for law; One got in Chancery and then there were four. Four little boys going out to sea; A red herring swallowed one and then there were three. Three little boys walking in the zoo; A big bear hugged one and then there were two. Two little boys sitting in the sun; One got frizzled up and then there was one. One little boy left all alone; He went out and hanged himself and then there were none.\"\r\n\r\nWhen they realize that murders are occurring as described in the rhyme, terror mounts. One by one they fall prey. Before the weekend is out, there will be none. Who has choreographed this dastardly scheme? And who will be left to tell the tale? Only the dead are above suspicion.', 'and-then-there-were-none.jpeg', 3, 25);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$08$200Z6ZZbp3RAEXoaWcMA6uJOFicwNZaqk4oDhqTUiFXFe63MG.Daa', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1268889823, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '23.17.83.81', 'clurr', '$2y$10$mqK3gNg/2bEdJscrY1RoyOErDstJMuXP4rUXbyBXP/lCou.dM5FVK', 'claire.lee@hotmail.ca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1681184106, 1682629891, 1, 'Claire', 'Lee', NULL, NULL),
(3, '23.17.83.81', 'philr', '$2y$10$XUBTayAxbTkJTNfpuOfdq.jdRbcbwWhdEUqFn9tXwjSYKEOe8s.MS', 'philr@nait.ca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1681280031, 1682631668, 1, 'Phil', 'Redmond', NULL, NULL),
(4, '23.17.83.81', 'clurb404', '$2y$10$NTN7kcZyU8t0.nXv8yAKDObDvBUACpwislu2iX6IqVohlVswxdHCO', 'clee84@nait.ca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1681282777, 1682631043, 1, 'Clurb', 'Leeb', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 2),
(5, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_favourites`
--

CREATE TABLE `user_favourites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_favourites`
--

INSERT INTO `user_favourites` (`id`, `user_id`, `book_id`) VALUES
(1, 2, 4),
(3, 2, 12),
(4, 2, 14),
(5, 2, 22),
(6, 4, 17),
(7, 4, 18),
(8, 4, 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ac_messages`
--
ALTER TABLE `ac_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ac_profiles`
--
ALTER TABLE `ac_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ac_settings`
--
ALTER TABLE `ac_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ac_users_messages`
--
ALTER TABLE `ac_users_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id` (`users_id`,`buddy_id`);

--
-- Indexes for table `ci_books`
--
ALTER TABLE `ci_books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `user_favourites`
--
ALTER TABLE `user_favourites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ac_messages`
--
ALTER TABLE `ac_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ac_profiles`
--
ALTER TABLE `ac_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ac_settings`
--
ALTER TABLE `ac_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ac_users_messages`
--
ALTER TABLE `ac_users_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ci_books`
--
ALTER TABLE `ci_books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_favourites`
--
ALTER TABLE `user_favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
