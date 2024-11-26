<?php
$namahost = "localhost";
$username = "root";
$password = ""; // Sesuaikan password MySQL Anda
$database = "pt_bendi_car"; // Nama database Anda

// Membuat koneksi
$conn = mysqli_connect($namahost, $username, $password, $database);

// Cek koneksi
if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
} else {
    echo "Koneksi berhasil ke database '$database'";
}
?>
