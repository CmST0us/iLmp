<?d
{!--PROXY--}
>title=自由
>Path=!;免流路径;域名之后的部分
>Domain=!;免流域名;免流域名
>XY=select:2,1|1.1,0|1.0;HTTP协议;是否使用1.1协议
>more=select:2,$jq=true;|开启,|关闭;加强模式;是否需要加强包头伪装性
<
{!--PROXY_HEADER--}
$_SERVER['HTTP_ACCEPT'] = str_replace(array('text/vnd.wap.wml', 'application/vnd.wap.wmlc'), '', $_SERVER['HTTP_ACCEPT']);
if(($host=$_SERVER['HTTP_X_ONLINE_HOST'])==NULL) $host=$_SERVER['HTTP_HOST'];
$_SERVER['REQUEST_URI']='http://'.$host.$_SERVER['REQUEST_URI'];
$header="$_SERVER[REQUEST_METHOD] $_SERVER[REQUEST_URI] HTTP/1.{!--XY--}\r{!--PATH--}\nHost: {!--DOMAIN--}$_SERVER[REQUEST_METHOD] HTTP/1.{!--XY--}\r\nHost: $host\r\n";
unset($_SERVER['HTTP_X_ONLINE_HOST']);
unset($_SERVER['HTTP_ORIGIN']);
unset($_SERVER['HTTP_HOST']);
unset($_SERVER['HTTP_PROXY_AUTHORIZATION']);
unset($_SERVER['HTTP_ACCEPT_ENCODING']);
unset($_SERVER['HTTP_X_REQUESTED_WITH']);
unset($_SERVER['HTTP_ACCEPT_CHARSET']);
unset($_SERVER['HTTP_REFERER']);
if ($_SERVER['HTTP_CONNECTION']!=='keep-alive'){$_SERVER['HTTP_CONNECTION']='close';}
if($_SERVER[REQUEST_METHOD]==GET)
{$_SERVER['HTTP_ACCEPT']="*/*,application/vnd.wap.mms-message,application/vnd.wap.sic";
$_SERVER['HTTP_CONTENT_TYPE']='application/vnd.wap.mms-message';}
else
{$_SERVER['HTTP_ACCEPT']="*/*,application/vnd.wap.mms-message,application/vnd.wap.sic";
if($_SERVER['CONTENT_TYPE']) $_SERVER['HTTP_CONTENT_TYPE']=$_SERVER['CONTENT_TYPE'];}
{!--MORE--}
if ($jq) {
$header.="Host: {!--PATH--}\nX-Online-Host: $host\r\n$x: $v\r\nHost: $host\nX-Online-Host: \r{!--PATH--}\r\n";
}
else{
    $header.="$x: $v\r\n";
}
{!--PROXY_PRINT--}
?>
