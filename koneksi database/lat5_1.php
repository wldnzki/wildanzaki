<?php
include "koneksi.php";

// Run the query and handle errors
$q = mysqli_query($conn, "SELECT * FROM user");
if (!$q) {
    die("Query failed: " . mysqli_error($conn));
}

// Form for adding a user
echo "
<form action=\"Lat5_2.php\" method=\"POST\">
    <input type=\"submit\" value=\"Tambah User\" />
</form>";

// Table headers
echo "
<table border=\"1\">
    <tr>
        <th>Username</th>
        <th>Password</th>
        <th>Level</th>
        <th>Aksi</th>
    </tr>";

// Table rows
while ($hasil = mysqli_fetch_array($q)) {
    echo "
    <tr>
        <td>{$hasil['username']}</td>
        <td>{$hasil['password']}</td>
        <td>{$hasil['level']}</td>
        <td><a href=\"Lat5_2.php?username={$hasil['username']}&e=1\">Edit</a></td>
    </tr>";
}

// Close table
echo "</table>";
?>
