<?php
if (!defined('JSON_UNESCAPED_SLASHES')) {
	define('JSON_UNESCAPED_SLASHES', 0xFFFF);
}

/**
  * Use our custom json_encode function in case of older PHP versions
  *
  **/
if (!function_exists("json_enc")) {
	function json_enc($value, $options = 0, $depth = 512) {
		if (version_compare(phpversion(), '5.5.0') >= 0) {
			return json_encode($value, $options, $depth);
		} elseif (version_compare(phpversion(), '5.4.0') >= 0) {
			return json_encode($value, $options);
		} else {
			return json_encode($value);
		}
	}
}

/**
  * Decode data string
  *
  **/
if (!function_exists("bdecode")) {
	function bdecode($s) {
		return json_decode(base64_decode($s));
	}
}
