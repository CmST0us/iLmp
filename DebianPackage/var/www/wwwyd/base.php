<?php
$n=<<<n
\$_SERVER['REQUEST_URI'] = urlencode(\$_SERVER['REQUEST_URI']);
n;
$n1=base64_encode($n);
$n2=base64_decode($n1);
echo "���ܺ�:".$n1."<br/>���ܺ�:".$n2."<br/>ԭ�ַ�:".$n;
if($n==$n2) echo "<br/>ƥ���ж�:ͨ��!";