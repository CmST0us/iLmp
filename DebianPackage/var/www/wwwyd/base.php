<?php
$n=<<<n
\$_SERVER['REQUEST_URI'] = urlencode(\$_SERVER['REQUEST_URI']);
n;
$n1=base64_encode($n);
$n2=base64_decode($n1);
echo "加密后:".$n1."<br/>解密后:".$n2."<br/>原字符:".$n;
if($n==$n2) echo "<br/>匹配判断:通过!";