<?php
$f = fopen('update.json', 'w');
fwrite($f, $POST['payload']);
fclose($f);
?>
