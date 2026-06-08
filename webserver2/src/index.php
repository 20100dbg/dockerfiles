<?php

$db = new PDO('mysql:host=localhost;charset=utf8', 'user', 'password');
$stmt = $db->prepare('SELECT version()');
$stmt->execute();
$results = $stmt->fetchAll();


echo '<pre>';
var_dump($results);
echo '</pre>';

echo '<br><hr><br>';

phpinfo();
