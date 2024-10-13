<?php
// Version

/*if(strstr(strtolower($_SERVER['HTTP_USER_AGENT']), "googlebot"))
{
    header('HTTP/1.1 503 Service Temporarily Unavailable');
    die();
}*/

error_reporting(1);
ini_set("display_errors", 1);


define('VERSION', '2.3.0.2');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// Install
if (!defined('DIR_APPLICATION')) {
	header('Location: install/index.php');
	exit;
}

// VirtualQMOD
require_once('./vqmod/vqmod.php');
VQMod::bootup();

// VQMODDED Startup
require_once(VQMod::modCheck(DIR_SYSTEM . 'startup.php'));

start('catalog');