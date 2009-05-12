<?php
$f = fopen('update.json', 'w');
fwrite($f, $_POST['payload']);
fclose($f);
?>
