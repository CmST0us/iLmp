<?php
set_time_limit(0);
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);
if($_SERVER[HTTP_HOST] == "dy.cc" || $_SERVER[HTTP_X_ONLINE_HOST] == "dy.cc") {require "./admin.php";}
function arrIndex($arr,&$index,$key) {
	if(is_array($arr)) {
		foreach($arr as $k=>$v) {
			arrIndex($v,$index,$key."/".urlencode($k));
		}
	} else {
		$index[]=$key;
	}
}
function arrGetInfo($set,$index=null) {
	if($index===null || !is_array($set)) return $set;
	$index=explode("/",$index);
	foreach($index as $key) {
		$set=$set[urldecode($key)];
	}
	return $set;
}
function arrKey($index) {
	$index=explode("/",$index);
	$key=urldecode(array_shift($index));
	foreach($index as $k) {
		$key.="[".urldecode($k)."]";
	}
	return $key;
}
if($_FILES) {
	$index=array();
	foreach($_FILES as $k=>$f) {
		arrIndex($f["name"],$index,urlencode($k));
	}
	$postIndex=array();
	foreach($_POST as $k=>$f) {
		arrIndex($f,$postIndex,urlencode($k));
	}
	$boundary = preg_replace("!^.*;\s*boundary=!isU", "", $_SERVER[CONTENT_TYPE]);
	$post = "";
	foreach ($postIndex as $k) {
		$post .= "--$boundary\r\n";
		$post .= "Content-Disposition: form-data; name=\"".arrKey($k)."\"\r\n\r\n";
		$post .= arrGetInfo($_POST,$k)."\r\n";
	}
	$conLen=strlen($post);
	$file = array();
	foreach ($index as $i=>$k) {
		$offset = strpos($k,"/");
		if($offset !== false) {
			$k1 = urldecode(substr($k, 0, $offset));
			$k2 = substr($k, $offset+1);
		} else {
			$k1 = urldecode($k);
			$k2 = null;
		}
		$v = $_FILES[$k1];
		$file[$i][0] .= "--$boundary\r\n";
		$file[$i][0] .= "Content-Disposition: form-data; name=\"".arrKey($k)."\"; filename=\"".arrGetInfo($v[name],$k2)."\"\r\n";
		$file[$i][0] .= "Content-Type: ".arrGetInfo($v[type],$k2)."\r\n\r\n";
		$file[$i][1] .= "\r\n";
		$file[$i][1] .= "--$boundary--\r\n";
		$file[$i][2] = arrGetInfo($v[size], $k2);
		$file[$i][3] = arrGetInfo($v[tmp_name], $k2);
		$conLen += strlen($file[$i][0]) + $file[$i][2] + strlen($file[$i][1]);
	}
	$_SERVER[HTTP_CONTENT_LENGTH] = $conLen;
}
$host=$_SERVER['HTTP_X_ONLINE_HOST'];
if($host===NULL) $host=$_SERVER['HTTP_HOST'];
$header="$_SERVER[REQUEST_METHOD] http://$host$_SERVER[REQUEST_URI] HTTP/1.0\r\nHost: $host\r\n";
unset($_SERVER['HTTP_X_ONLINE_HOST']);
unset($_SERVER['HTTP_ORIGIN']);
unset($_SERVER['HTTP_HOST']);
unset($_SERVER['HTTP_PROXY_AUTHORIZATION']);
if ($_SERVER['HTTP_CONNECTION']!=='keep-alive'){$_SERVER['HTTP_CONNECTION']='close';}
if($_SERVER['CONTENT_TYPE']) $_SERVER['HTTP_CONTENT_TYPE']=$_SERVER['CONTENT_TYPE'];
unset($_SERVER['HTTP_Q_UA']);
unset($_SERVER['HTTP_X_UCBROWSER_UA']);
$_SERVER['HTTP_DNT']='1';
$_SERVER['HTTP_CACHE_CONTROL']='no-cache';
foreach($_SERVER as $x => $v) {
	if(substr($x,0,5) !== "HTTP_") continue;
	$x = strtr(ucwords(strtr(strtolower(substr($x,5)),"_"," "))," ","-");
    $header.="$x: $v\r\n";
}
$header .= "\r\n";
$p = stream_socket_client("tcp://10.0.0.172:80");
if(!$p) exit;
fwrite($p,$header);
if ($_FILES) {
	fwrite($p, $post);
	foreach($file as $f) {
		fwrite($p, $f[0]);
		$fp = fopen($f[3], "r");
		while($fp && !feof($fp)) {
			fwrite($p, fread($fp,8192));
		}
		fwrite($p, $f[1]);
	}
} else {
	$pp = fopen("php://input","r");
	while($pp && !feof($pp)) {
		fwrite($p,fread($pp,8192));
	}
	fclose($pp);
}
$header = "";
$x = 0; $len = false; $off = 0;
while(!feof($p)) {
	if($x==0) {
	$header .= fread($p,41943040);
	if(($i = strpos($header,"\r\n\r\n")) !== false) {
		$x=1;
		$n=substr($header,$i+4);
		$header = substr($header,0,$i);
		$header = explode("\r\n",$header);
		foreach($header as $m) {
			if(preg_match("!^\s*content-length\s*:!is",$m)) {
				$len = trim(substr($m,15));
			}
			header($m);
		}
	$off=strlen($n);
	echo $n;
	flush();
	}
	}else {
	if($len !== false && $off >= $len) {
		break;
	}
	$n = fread($p,41943040);
	$off += strlen($n);
	echo $n;
	flush();
	}
}
fclose($p);