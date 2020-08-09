#!/usr/bin/php
<?php

const TARGET_DIR = '/home/david/Nextcloud/org-mode-merged/';

if (!array_key_exists(1, $argv)) {
    pr("Provide a search term to base Org-mode file merge on.");
    exit;
}
if (!is_writable(TARGET_DIR)) {
    pr("Target dir should be writable: " . TARGET_DIR);
    exit;
}

$search = $argv[1];
//$find = "find " . getcwd() . " -ipath \*" . $search . "\*.org -type f";
$find = "find " . getcwd() . " -iname \*" . $search . "\*.org -type f";
exec($find, $paths, $status);

pr(count($paths) . " notes", true);


$merged = '';
foreach ($paths as $p) {
    $fields = parseNote($p, fetchNote($p));
    $fields['body'] = demoteHeadings($fields['body']);
    $merged .= layout($p, $fields);
//    echo "\n\t- " . basename($p);
}

//pr($merged);
file_put_contents(
    TARGET_DIR . $search . '.org',
    "#+title: " . $search . "\n" . $merged
);

foreach ($paths as $p) {
    $target = $p . '.merged';
    exec("rm \"$p\"");
//        pr("mv \"$p\" \"$target\"");
}


function pr($s, $color = false, $heading = false) {
    echo ($color ? ($heading ? color($s, true) : color($s)) : $s) . "\n";
}

function color($string, $heading = false) {
    return ($heading ? "\e[0;36m" : "\e[0;35m")
        . $string
        . "\e[0m";
}

function fetchNote($path) {
    return file_get_contents($path, FILE_USE_INCLUDE_PATH);
}

function parseNote($path, $content) {
    $fields = array();
    $lines = explode("\n", $content);
    $fields['title'] = $lines[1] == ''
        ? $lines[0]
        : basename($path)
    ;
    $fields['body'] = implode("\n", array_slice($lines, 2));

    return $fields;
}

function demoteHeadings($body) {
    $lines = explode("\n", $body);
    foreach ($lines as $l => $line) {
        if (substr($line, 0, 1) === '*') {
            $lines[$l] = '*' . $line;
        }
    }
    return implode("\n", $lines);
}

function layout($path, $fields) {
    $out = '* ' . $fields['title'];
    $out .= "\n";
    $out .= $fields['body'];
    $out .= "\n";

    return $out;
}
