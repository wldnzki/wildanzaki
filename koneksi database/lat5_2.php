<?php
include "koneksi.php";

// Check if editing or adding a user
$e = isset($_GET['e']) ? $_GET['e'] : '';
if (empty($e)) {
    $title = "Tambah User";
    $data = ['username' => '', 'password' => '', 'level' => '']; // Default empty data for new user
} else {
    $title = "Edit User";
    $username = $_GET['username'];

    // Run query with proper error handling
    $q = mysqli_query($conn, "SELECT * FROM user WHERE username='$username'");
    if (!$q) {
        die("Query failed: " . mysqli_error($conn));
    }

    $data = mysqli_fetch_array($q);
    if (!$data) {
        die("User not found.");
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($title); ?></title>
</head>
<body>
    <h1><?php echo htmlspecialchars($title); ?></h1>
    <form method="post" action="Lat5_3.php">
        <input type="hidden" name="e" value="<?php echo htmlspecialchars($data['username']); ?>" />
        <table border="1">
            <tr>
                <td>Username</td>
                <td><input name="username" type="text" value="<?php echo htmlspecialchars($data['username']); ?>" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input name="password" type="text" value="<?php echo htmlspecialchars($data['password']); ?>" /></td>
            </tr>
            <tr>
                <td>Level</td>
                <td><input name="level" type="text" value="<?php echo htmlspecialchars($data['level']); ?>" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Submit" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
