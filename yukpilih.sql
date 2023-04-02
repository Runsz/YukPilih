-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2023 at 08:54 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yukpilih`
--

-- --------------------------------------------------------

--
-- Table structure for table `choices`
--

CREATE TABLE `choices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `choice` varchar(255) NOT NULL,
  `poll_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vote` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `choices`
--

INSERT INTO `choices` (`id`, `choice`, `poll_id`, `created_at`, `updated_at`, `vote`) VALUES
(16, 'merah', 6, '2023-03-19 23:30:02', '2023-03-19 23:30:02', NULL),
(17, 'biru', 6, '2023-03-19 23:30:02', '2023-03-19 23:30:02', NULL),
(18, 'kuning', 6, '2023-03-19 23:30:02', '2023-03-19 23:30:02', NULL),
(23, 'php', 9, '2023-03-28 20:29:25', '2023-03-28 20:29:25', NULL),
(24, 'Js', 9, '2023-03-28 20:29:25', '2023-03-28 20:29:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'IT Divisions', NULL, NULL),
(3, 'Finance Divisions', NULL, NULL),
(4, 'General division', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_tokens`
--

CREATE TABLE `login_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_tokens`
--

INSERT INTO `login_tokens` (`id`, `user_id`, `token`, `created_at`, `updated_at`) VALUES
(3, 3, '$2y$10$FGI3y2NU68Ozx9ISjj78aeGobUXkH2SVI.Gju4YIdrBS/GSIOxrJO', '2023-03-19 23:00:59', '2023-03-19 23:00:59'),
(4, 4, '$2y$10$FYdApvhajkMIixQLsQ7rSut35py5djT2/kzFIsF9mmNTXRYWl96/m', '2023-03-20 22:37:58', '2023-03-20 22:37:58'),
(5, 5, '$2y$10$c5MzKRewYiAQaIKzI68YNeQ5uEL8bEsN6bE/kURs6Mpm5p7OkgjWK', '2023-03-20 22:39:12', '2023-03-20 22:39:12'),
(6, 6, '$2y$10$fQfI8GVokCL8oFPJQd8ZXeCxzLih2aaFL5l1uIemjGUiqeUjp5MZ2', '2023-03-20 23:27:31', '2023-03-20 23:27:31'),
(7, 7, '$2y$10$Hyq9NflzWYrGa.fJeLmVs.aEUMAaAkM3sCkPiN5QBeKYschWO5eZS', '2023-03-20 23:31:19', '2023-03-20 23:31:19'),
(8, 8, '$2y$10$cU79/SaP12TfPA9T0.caJeSAAuz/Dp8mPgTNpqp7nwMbtUcYfk12a', '2023-03-20 23:32:17', '2023-03-20 23:32:17'),
(9, 10, '$2y$10$0YtlGvuhG2ZcnKq1nMB/Tu3Bu58bXnp.eRWkPIlf.fLZlmnHlblly', '2023-03-28 07:09:17', '2023-03-28 07:09:17'),
(10, 9, '$2y$10$92/g5/J3YxxjTRhL3M3Ve.45XOAjTzSe7kOwQiFuVIoHK.GCuzFTe', '2023-03-28 18:09:17', '2023-03-28 18:09:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_03_16_063738_create_divisions_table', 1),
(5, '2014_10_12_000000_create_users_table', 2),
(6, '2023_03_17_063432_create_login_tokens_table', 2),
(7, '2023_03_20_024645_create_pollings_table', 2),
(8, '2023_03_20_025828_create_choices_table', 2),
(9, '2023_03_20_070453_create_votes_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pollings`
--

CREATE TABLE `pollings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `deadline` datetime NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pollings`
--

INSERT INTO `pollings` (`id`, `title`, `description`, `deadline`, `created_by`, `created_at`, `updated_at`) VALUES
(6, 'warna favorit', 'pilihlah salah satu warna favoritmu', '2023-03-21 05:59:59', 9, '2023-03-19 23:30:02', '2023-03-19 23:30:02'),
(9, 'bahasa pemrograman', 'Php atau Js', '2023-03-30 05:59:59', 9, '2023-03-28 20:29:25', '2023-03-28 20:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`, `updated_at`, `division_id`) VALUES
(3, 'Runz', '$2y$10$2ex99GjZ5yT2VLQxgQNQdeaopHqQ53N1JbwF.ogOQihP.TUmDGwOu', 'user', NULL, NULL, 2),
(4, 'arun', '$2y$10$6eVVMJ2V6x6EfL0JtQbz4uviWXd5H/3vCzne9hEzxZ7ReIFf20Ssi', 'user', NULL, NULL, 3),
(5, 'dela', '$2y$10$PUCGSdrO0PgzVtSYFvps3e7fHsN8xiiWUp1Jq768QlR2IY9pI3hg.', 'user', NULL, NULL, 2),
(6, 'atul', '$2y$10$kogelUoS7Z2mUQDh1oJKJ.Q3f4J4tnjvViRQIW36K7ic6uV5GRHfG', 'user', NULL, NULL, 2),
(7, 'elma', '$2y$10$jYib4qBt2vt8Q7NmjEMjDult7ODjkHGoIrjj8uMPBdpPjs11sCElm', 'user', NULL, NULL, 3),
(8, 'dinda', '$2y$10$nmdLJRWkT5K9ihgvPk6tnuN1U.4owdTUqFWT1rTHgd2KXbai/61wy', 'user', NULL, NULL, 3),
(9, 'admin2', '$2y$10$G1GeZf1mdpRC2ltzqdqxquZONLpIRPM8UBTWjMdSvPoVTpZx3pobO', 'admin', NULL, NULL, NULL),
(10, 'heri', '$2y$10$okLEZl6rvUABsPSDIdep4OkVsEGVt442T7ZyhNL9H8zfPg4wcNVlq', 'user', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `choice_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `poll_id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `choice_id`, `user_id`, `poll_id`, `division_id`, `created_at`, `updated_at`) VALUES
(2, 17, 4, 6, 3, '2023-03-20 22:38:36', '2023-03-20 22:38:36'),
(15, 18, 6, 6, 2, '2023-03-20 23:27:51', '2023-03-20 23:27:51'),
(16, 18, 7, 6, 3, '2023-03-20 23:31:39', '2023-03-20 23:31:39'),
(30, 18, 3, 6, 2, '2023-03-27 21:55:46', '2023-03-27 21:55:46'),
(31, 18, 5, 6, 2, '2023-03-27 21:56:17', '2023-03-27 21:56:17'),
(35, 23, 10, 9, 4, '2023-03-28 20:30:31', '2023-03-28 20:30:31'),
(36, 24, 3, 9, 2, '2023-03-28 20:31:28', '2023-03-28 20:31:28'),
(37, 24, 4, 9, 3, '2023-03-28 20:32:00', '2023-03-28 20:32:00'),
(38, 24, 5, 9, 2, '2023-03-28 20:32:19', '2023-03-28 20:32:19'),
(39, 23, 6, 9, 2, '2023-03-28 20:32:41', '2023-03-28 20:32:41'),
(40, 23, 7, 9, 3, '2023-03-28 20:33:07', '2023-03-28 20:33:07'),
(41, 24, 8, 9, 3, '2023-03-28 20:33:30', '2023-03-28 20:33:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `choices_poll_id_foreign` (`poll_id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `login_tokens`
--
ALTER TABLE `login_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pollings`
--
ALTER TABLE `pollings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollings_created_by_foreign` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_division_id_foreign` (`division_id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `votes_poll_id_foreign` (`poll_id`),
  ADD KEY `votes_choice_id_foreign` (`choice_id`),
  ADD KEY `votes_division_id_foreign` (`division_id`),
  ADD KEY `votes_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `choices`
--
ALTER TABLE `choices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_tokens`
--
ALTER TABLE `login_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pollings`
--
ALTER TABLE `pollings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `choices`
--
ALTER TABLE `choices`
  ADD CONSTRAINT `choices_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `pollings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `login_tokens`
--
ALTER TABLE `login_tokens`
  ADD CONSTRAINT `login_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pollings`
--
ALTER TABLE `pollings`
  ADD CONSTRAINT `pollings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`);

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_choice_id_foreign` FOREIGN KEY (`choice_id`) REFERENCES `choices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `pollings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
