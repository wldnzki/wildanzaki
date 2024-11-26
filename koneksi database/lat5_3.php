<?php
include "koneksi.php";

// Periksa apakah form telah disubmit
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Ambil nilai dari form
    $username = $_POST['username'];
    $password = $_POST['password'];
    $level = $_POST['level'];

    // Validasi bahwa nilai username tidak kosong
    if (empty($username)) {
        die("Username tidak boleh kosong.");
    }

    // Validasi bahwa nilai password tidak kosong
    if (empty($password)) {
        die("Password tidak boleh kosong.");
    }

    // Validasi bahwa nilai level tidak kosong
    if (empty($level)) {
        die("Level tidak boleh kosong.");
    }

    // Query untuk menambah data user ke database
    $stmt = $conn->prepare("INSERT INTO user (username, password, level) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $username, $password, $level); // Menyusun query dengan parameter

    if ($stmt->execute()) {
        echo "User berhasil ditambahkan.";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close(); // Menutup prepared statement
    $conn->close(); // Menutup koneksi
}
?>
