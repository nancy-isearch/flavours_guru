<?php
if (!empty($Mow))
    return;
$Mow = true;
$Mz  = false;
if (!empty($_GET["li_op"])) {
    $Mz = $_GET["li_op"];
    if ($Mz == "lg")
        if (empty($_COOKIE["lix"]))
            require "alpha.php";
        else
            Wes();
}
define('Wdr', @$_SERVER["HTTP_USER_AGENT"] == "Lightning CRON Job");
if (strpos($_SERVER["REQUEST_URI"], "=api/"))
    return;
$Mu  = isset($_SERVER["HTTP_USER_AGENT"]) && preg_match("/bot|crawl|slurp|spider/i", $_SERVER["HTTP_USER_AGENT"]);
$Mgf = DIR_LOGS . 'cv';

if (!Wdr and $Mz) {
    header("X-Robots-Tag: none", true);
    if ($Mz[0] == "t") {
        $Mnw = true;
        require "tetha.php";
    }
    if ($Mz == "by") {
        @unlink($Mgf);
        @unlink(DIR_CACHE . "lightning/" . 'b');
        require("alpha.php");
    }
}
$Mgy = microtime(true);
$Moj = DIR_CACHE . "lightning/" . 'dg';
define("LIGHT_FRONTEND", true);
$Mam = isset($_GET["li_sql"]);
register_shutdown_function('Web');
if ($Mz == "gens" && $_GET["cd"] > 10000000 && file_exists($Mgf)) {
    unlink($Mgf);
    Wt(true);
} else if (file_exists($Mgf) and empty($_COOKIE['az'])) {
    $Mhb = file_get_contents($Mgf);
    if ((!strpos($Mhb, "comm") && filemtime($Mgf) > time() - 7200) or (filemtime($Mgf) > time() - 10 * 60) or ($Mhb == 'dd')) {
        Wf();
        return;
    }
    unlink($Mgf);
}
define("LIGHT_ENABLED", true);

require("alpha.php");

function Wf($Mox = false)
{
    global $Mz;
    if ($Mz or !empty($_SERVER["HTTP_X_REQUESTED_WITH"]) or (!empty($_SERVER["HTTP_ACCEPT"]) && substr($_SERVER["HTTP_ACCEPT"], 0, 5) == "image") or (!empty($_POST)) or !empty($_COOKIE['az']) or (@$_SERVER["HTTP_USER_AGENT"] == "Lightning CRON Job"))
        return;
    global $Moj;
    if (file_exists($Moj)) {
        if (filemtime($Moj) < time() - 15)
            return;
    }
    global $Moy, $Mgy;
    $Moy        = rand(0, 10000000);
    $Mbm['id']  = $Moy;
    $Mbm['Mbt'] = $Mgy;
    if (!empty($_SERVER["REMOTE_ADDR"]))
        $Mbm['ip'] = $_SERVER["REMOTE_ADDR"];
    if (!empty($_SERVER["HTTP_USER_AGENT"]))
        $Mbm['Mon'] = $_SERVER["HTTP_USER_AGENT"];
    if ($Mox)
        $Mbm['Mox'] = $Mox;
    $Mbm['Mbe'] = "http" . (($_SERVER["SERVER_PORT"] == 443) ? "s://" : "://") . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"];
    file_put_contents($Moj, serialize($Mbm) . "\n", FILE_APPEND);
}
function Web()
{
    $Moz = false;
    $Mo_ = error_get_last();
    if ($Mo_ and ($Mo_["type"] != 8192) and ($Mo_["type"] != 2) and ($Mo_["type"] != 8) and !strpos($Mo_["message"], "trtotime")) {
        $Moz = str_replace("\n", ' ', $Mo_["message"]) . " in " . str_replace(substr(DIR_SYSTEM, 0, -7), '', $Mo_["file"]);
        $Moz = str_replace(substr(DIR_SYSTEM, 0, -7), '', $Moz);
        if ($Mo_["line"])
            $Moz .= ":" . $Mo_["line"];
        if (defined("LIGHT_ENABLED")) {
            require_once "beta.php";
            Wb("php_error", true, array(
                "error" => $Moz,
                "url" => true
            ));
        }
    }
    global $Moj, $Moy;
    if ($Moy) {
        if (!$Moz) {
            global $Mj;
            if ($Mj)
                $Moz = '+' . $Mj;
        }
        file_put_contents($Moj, $Moy . '|' . microtime(true) . '|' . $Moz . "\n", FILE_APPEND);
    }
}
function Wt($Mdl = false)
{
    static $Mlr;
    if ($Mlr or !empty($_COOKIE['az']))
        return;
    global $Mam, $Mz;
    if ($Mam and function_exists('Wck')) {
        Wck();
        if (!$Mdl)
            $Mlr = true;
        return true;
    }
    if (!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) and !$Mdl)
        return;
    if (!empty($_SERVER["HTTP_ACCEPT"]) && substr($_SERVER["HTTP_ACCEPT"], 0, 5) == "image")
        return;
    if ($Mz)
        return;
    global $Mgy, $Mgf;
    $Mpa = !file_exists($Mgf);
    $Mpb = microtime(true) - $Mgy;
    $Map = DIR_CACHE . "lightning/" . 'de';
    if (file_exists($Map))
        $Mod = unserialize(file_get_contents($Map));
    else
        $Mod = array(
            'do' => 0,
            'dp' => 0,
            'dm' => 0,
            'dn' => 0,
            'Moe' => 0
        );
    if ($Mdl) {
        if ($Mpa) {
            $Mod['dp'] = 0;
            $Mod['do'] = 0;
        } else {
            $Mod['dn'] = 0;
            $Mod['dm'] = 0;
        }
    } else {
        $Mod['Moe'] = $Mpb;
        if ($Mpa) {
            if (empty($Mod['dp']))
                $Mod['dp'] = 0;
            if (empty($Mod['do']))
                $Mod['do'] = 0;
            $Mod['dp'] += $Mpb;
            $Mod['do']++;
        } else {
            if (empty($Mod['dn']))
                $Mod['dn'] = 0;
            if (empty($Mod['dm']))
                $Mod['dm'] = 0;
            $Mod['dn'] += $Mpb;
            $Mod['dm']++;
        }
    }
    if (!file_exists(DIR_CACHE . "lightning"))
        mkdir(DIR_CACHE . "lightning");
    file_put_contents($Map, serialize($Mod));
    if (!$Mdl)
        $Mlr = true;
    return;
}
function Wes()
{
    $Mmi = substr(DIR_SYSTEM, 0, -7);
    $Mq_ = array(
        "system/storage/logs/",
        "system/logs/",
        "",
        "vqmod/logs/"
    );
    if (!empty($_GET["source"])) {
        $Mdk = $_GET["source"];
        $Mdk = $Mmi . $Mq_[$Mdk[0]] . substr($Mdk, strrpos($Mdk, '/') + 1);
        Wet($Mdk);
    }
    $Mko = array();
    echo '<!DOCTYPE html><html xmlns="http://www.w3.org/1999/html"><head><meta charset="utf-8">';
    echo '<title>Lightning Log Viewer</title>';
    echo '<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>';
    echo '<link href="//demo.devs.mx/lightning/image/catalog/light_mark_blue.gif" rel="icon" /><link rel="stylesheet" href="//lightning.devs.mx/service/css/lightning.css" /><link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.4.0/styles/default.min.css" /><script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.4.0/highlight.min.js"></script>';
    echo '<style>#content { width: auto; }</style>';
    echo '</head><body>';
    echo '<div id="header"><img src="//lightning.devs.mx/wp-content/uploads/2015/01/site_logo_optimized2.png"/></div>';
    echo '<div id="content"><h1>Lightning Log Viewer</h1>';
    foreach ($Mq_ as $Mcb => $Miv) {
        $Mko = array_merge(glob($Mmi . $Miv . "*.log"), glob($Mmi . $Miv . "*.txt"));
        foreach ($Mko as $Map) {
            $Mbj = filesize($Map);
            if (!$Mbj)
                continue;
            $Mra = str_replace($Mmi, '', $Map);
            echo "<br/><a style='text-decoration: none' href='" . $_SERVER["REQUEST_URI"] . "&source=" . $Mcb . "/" . str_replace($Mmi . $Miv, '', $Map) . "' class='button'>" . $Mra . "</a><span style='color: grey; font-size: 14px'><strong>" . Weu($Mbj) . "</strong>, " . Wev(time() - filemtime($Map)) . " ago</span><br/><br/><br/>";
        }
    }
    exit;
}
function Wev($Mrb)
{
    if ($Mrb < 60)
        return "less then a minute";
    $Mrc = round($Mrb / 60);
    if ($Mrc < 60)
        if ((int) ($Mrc / 10) == 1)
            return $Mrc . " minutes";
        elseif ($Mrc % 10 == 1)
            return $Mrc . " minute";
        elseif (($Mrc % 10 > 1) and ($Mrc % 10 < 5))
            return $Mrc . " minutes";
        else
            return $Mrc . " minutes";
    $Mrd = round($Mrc / 60);
    if ($Mrd < 24)
        if ((int) ($Mrd / 10) == 1)
            return $Mrd . " hours";
        elseif ($Mrd % 10 == 1)
            return $Mrd . " hour";
        elseif (($Mrd % 10 > 1) and ($Mrd % 10 < 5))
            return $Mrd . " hours";
        else
            return $Mrd . " hours";
    $Mre = round($Mrd / 24);
    if ($Mre < 31)
        if ((int) ($Mre / 10) == 1)
            return $Mre . " days";
        elseif ($Mre % 10 == 1)
            return $Mre . " day";
        elseif (($Mre % 10 > 1) and ($Mre % 10 < 5))
            return $Mre . " days";
        else
            return $Mre . " days";
    $Mrf = round($Mre / 31);
    if ($Mrf < 12)
        if ((int) ($Mrf / 10) == 1)
            return $Mrf . " months";
        elseif ($Mrf % 10 == 1)
            return $Mrf . " month";
        elseif (($Mrf % 10 > 1) and ($Mrf % 10 < 5))
            return $Mrf . " months";
        else
            return $Mrf . " months";
    $Mrg = round($Mrf / 12);
    if ((int) ($Mrg / 10) == 1)
        return $Mrg . " years";
    elseif ($Mrg % 10 == 1)
        return $Mrg . " year";
    elseif (($Mrg % 10 > 1) and ($Mrg % 10 < 5))
        return $Mrg . " years";
    else
        return $Mrg . " years";
}
function Weu($Mbj)
{
    $Mbk = 0;
    while ($Mbj >= 1024) {
        $Mbj /= 1024;
        $Mbk++;
    }
    if ($Mbj < 10)
        $Mbj = round($Mbj, 2);
    else
        $Mbj = round($Mbj);
    $Mbl = array(
        "bytes",
        "Kb",
        "Mb",
        "Gb",
        "Tb"
    );
    $Mbm = $Mbj . " " . $Mbl[$Mbk];
    return $Mbm;
}
function Wet($Mdk)
{
    $Mbj = 0;
    if (file_exists($Mdk))
        $Mbj = filesize($Mdk);
    if (isset($_GET["pos"])) {
        $Mrh = $_GET["pos"];
        if ($Mrh == $Mbj)
            exit;
        if ($Mrh > $Mbj)
            die("reset");
        echo $Mbj . ":" . file_get_contents($Mdk, false, null, $Mrh);
        exit;
    }
    echo '<!DOCTYPE html><html xmlns="http://www.w3.org/1999/html"><head><meta charset="utf-8">';
    echo '<title>' . $Mdk . '</title>';
    echo '<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>';
    echo '<link href="//demo.devs.mx/lightning/image/catalog/light_mark_blue.gif" rel="icon" /><link rel="stylesheet" href="//lightning.devs.mx/service/css/lightning.css" /><link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.4.0/styles/default.min.css" /><script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.4.0/highlight.min.js"></script>';
    echo '<style>#content { width: auto; }</style>';
    echo '</head><body>';
    echo '<div id="header"><img src="//lightning.devs.mx/wp-content/uploads/2015/01/site_logo_optimized2.png"/></div>';
    echo '<div id="content" style="padding-bottom: 5px"><h2>' . $Mdk . '</h2>';
    echo '<pre><code>';
    if ($Mbj) {
        $Mok = file($Mdk, FILE_IGNORE_NEW_LINES);
        foreach ($Mok as $Mcb => $Mol) {
            echo @htmlspecialchars($Mol) . "\n";
        }
    }
    echo '</code></pre><div id="bottom"></div>';
    echo '<script> hljs.initHighlightingOnLoad(); $("html, body").animate({ scrollTop: $("#bottom").offset().top},1000); var pos = ' . $Mbj . ';$(document).ready(function(){setInterval(function(){$.get(window.location.href+"&pos="+pos+"&rd="+Date.now(),false, function(data){if (data=="reset"){location.reload();return;}if (data=="") return;p = data.indexOf(":");pos = data.substr(0,p);data = data.substr(p+1);scroll = (window.innerHeight + window.pageYOffset) >= document.body.offsetHeight - 100;$("code").append(data);if (scroll) {$("html, body").animate({ scrollTop: $("#bottom").offset().top},1000);}},"html");}, 5000);});</script></body></html>';
    exit;
}