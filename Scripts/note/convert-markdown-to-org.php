#!/usr/bin/php
<?php
// Author: David Spreekmeester @aapit

$mCmd = 'find . -name \*.md -type f';
$oCmd = 'find . -name \*.org -type f';
exec($mCmd, $mResult, $mStatus);
exec($oCmd, $oResult, $oStatus);
echo count($mResult) . " Markdown files found.\n";
echo count($oResult) . " Org files found.\n";

sleep(2);

foreach ($mResult as $f) {
    echo "Handle: $f\n";
    $target = substr($f, 0, -3) . '.org';
    if (file_exists($target)) {
        echo "Target already exists.\n";
        continue;
    }

    $pdocCmd = "pandoc -f markdown -t org -o \"${target}\" \"$f\"";
    exec($pdocCmd, $pResult, $pStatus);
    if ($pStatus === 0) {
        echo "OK: ${target}";
    } else {
        var_dump($pResult);
    }
    echo "\n";
}
