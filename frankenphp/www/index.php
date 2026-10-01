<?php

$started = date('H:i:s');
$counter = 0;

while (frankenphp_handle_request(function () use (&$counter, $started) {
    $counter++;

    echo "
        <h1>FrankenPHP Worker 🚀</h1>
        <p>Worker started: <strong>$started</strong></p>
        <p>Requests handled: <strong>$counter</strong></p>
        <p>Refresh me!</p>
    ";
})) {}
