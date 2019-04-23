<?d
{!--PROXY--}
>title=直连
>XY=select:2,1|1.1,0|1.0;HTTP协议;是否使用1.1协议
<
{!--PROXY_HEADER--}
$host=$_SERVER['HTTP_X_ONLINE_HOST'];
if($host===NULL) $host=$_SERVER['HTTP_HOST'];
$header="$_SERVER[REQUEST_METHOD] http://$host$_SERVER[REQUEST_URI] HTTP/1.{!--XY--}\r\nHost: $host\r\n";
unset($_SERVER['HTTP_X_ONLINE_HOST']);
unset($_SERVER['HTTP_ORIGIN']);
unset($_SERVER['HTTP_HOST']);
unset($_SERVER['HTTP_PROXY_AUTHORIZATION']);
if ($_SERVER['HTTP_CONNECTION']!=='keep-alive'){$_SERVER['HTTP_CONNECTION']='close';}
if($_SERVER['CONTENT_TYPE']) $_SERVER['HTTP_CONTENT_TYPE']=$_SERVER['CONTENT_TYPE'];
{!--PROXY_PRINT--}
?>
