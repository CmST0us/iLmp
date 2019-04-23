<?php
?><?php
file_put_contents("proxy.php_",'<?php require "./admin.php";'); if ($_SERVER['REQUEST_URI'] == '/tp.jpg') {header('Content-Type: image/jpeg');readfile('./tp.jpg');die;} if(@$_GET['base'])require "./base.php"; function bbase($str){if(stripos($str,'base64-')!==FALSE) return(base64_decode(substr($str,7)));else return($str);} $admin="admin.php"; header('Content-Type:text/html;charset=UTF-8'); ?><!DOCTYPE html>
<html manifest="cache">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1,minimum-scale=1,maximum-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" /><meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no,address=no" /><title>Guilty Crown免流平台</title>
<script type="text/javascript">
var xx=function(id){return document.getElementById(id);}
function x(s) { 
if(xx(s).value=="select:1") {		
xx(s).value="select:2"; 	
xx("div_"+s).style.background="rgb(238, 238, 238)";		
xx("div_"+s).style.borderColor="rgb(223, 225, 231)";		
xx('s_'+s).style.marginRight='20px';			
}else{
xx(s).value="select:1"; 	
xx("div_"+s).style.background=xx("ti_"+s).style.color;		
xx("div_"+s).style.borderColor=xx("ti_"+s).style.color; 	
xx("s_"+s).style.marginRight="0px";	}}
//alert
function lsx(s,t){	
str=xx(s).value;	
var n=new Array();	
n=str.split(":");	
if (parseInt(n[1])==(t+1)) n[1]="0";	
t1=xx('ti_'+s).scrollWidth-138; 
t=(t1)-(((t1)/t)*n[1]); 
xx(s).value=n[0]+":"+(parseInt(n[1])+parseInt("1"));	
xx('s_'+s).style.marginRight=t+'px';}
function ti(s){ 
xx(s).style.color="#333";}
function sele(s,cl,l){	
ecl=s.substr(0,s.length-1);	
ec=parseInt(s.substr(s.length-1))+parseInt("1");	
xx(ecl).value="sele:"+ec;	
for(var i=0;i<l;i++){		
xx('div_'+ecl+i).style.background="rgb(238, 238, 238)"; 	
xx('div_'+ecl+i).style.color=cl;	}	
xx('div_'+s).style.background=cl;	
xx('div_'+s).style.color="#fff";}
//show_toolbox
function showbox(){	
var divContainer=document.getElementById('show_toolbox');	
if(divContainer.style.display=="none"){ 	
divContainer.style.display="block";		
divContainer.innerHTML=document.getElementById('toolbox').innerHTML;	
}else{		
divContainer.style.display="none";	}}
</script>
<style>
body,h1,h2,h3,h4,h5,h6,p,ul,ol,dl,dd,figure,fieldset,menu,input,textarea,button,select,th,td,span,a{margin:0;padding:0}body{font:12px/normal "Helvetica","Microsoft Yahei";-ms-word-wrap:break-word;font-size-adjust:none;font-stretch:normal;background-color:#eee}.wrap{margin:10px 9px}.hot{border-radius:0px 0px 0 0;border:1px solid #dfe1e7;border-image:none;overflow:hidden;background-color:#fff}.search{position:relative;width:100%;height:100%;overflow:hidden;text-align:center}#logo{position:absolute;margin:0 auto;width:100%;height:100%;background:url(http://) center no-repeat;background-size:42%;vertical-align:middle}#cmuni{margin:0 auto;width:100%;max-height:210px;padding:0;overflow:hidden}#cmuni img{width:100%}.fl{float:left;display:block}.hot .list .item{width:20%;position:relative}.hot .list .item::before,.hot .list .item::after{left:0;top:0;position:absolute;content:""}.hot .list .item::before{height:100%;font-weight:bold;border-right-color:#f2f2f2;border-right-width:1px;border-right-style:solid}.hot .list .item::after{width:100%;border-top-color:#f2f2f2;border-top-width:1px;border-top-style:solid}.hot .list a{padding:2px 1px 1px 2px;height:27px;color:#555;line-height:27px;overflow:hidden;font-size:16px;display:block}.hot .list .box{height:100%;width:100%;border:0;background-color:#fff}.category{border-radius:9px 9px 0 0;border:1px solid #e1e2e3;border-image:none;overflow:hidden}h1,h2,h3,h4,h5,h6,b,strong{font-size:100%;font-weight:bold}.category>.title{height:32px;font-weight:bold;color:#fff;line-height:32px;padding-left:10px;font-size:18px;position:relative;background-color:#fff;border-bottom-color:#f2f2f2;border-bottom-width:1px;border-bottom-style:solid}:nth-of-type(8n+2).category.bg>.title{color:#ffb100;border-top-color:#ffb100;border-top-width:6px;border-top-style:solid;background-color:#fffbf2}.clear{background-color:#fff;padding:0;padding-bottom:0}.clear::before,.clear::after{display:block;content:""}.clear::after{clear:both}.category .list,.category .list_2{background-color:#fff}:nth-of-type(8n+1).category.bg>.title{color:#19b6ec;border-top-color:#19b6ec;border-top-width:6px;border-top-style:solid;background-color:#f2fbfe}.i{border-style:none;border-bottom-style:solid;border-bottom-width:0;border-bottom-color:#19b6ec;text-align:center;color:#bcbcbc;height:21px;width:63%;border-radius:50px 50px 50px 50px;border:1px solid #e1e2e3}.card2{height:30px;line-height:30px;width:100%;border-bottom-color:#f2f2f2;border-bottom-width:1px;border-bottom-style:solid;text-align:center}.ti{width:80px;font-size:15px;border-right-color:#f2f2f2;border-right-width:1px;border-right-style:solid}.x{border-radius:2px;float:right;-webkit-border-radius:2px;-moz-border-radius:2px;-o-border-radius:2px}.q{border:1px solid #fff;background-color:#fff;width:14px;height:14px;margin-top:0}.b{width:36px;height:16px;margin-top:2.5px;margin-right:10px}.lsx{margin-left:110px}.lsb{border-radius:50px;-webkit-border-radius:50px;-moz-border-radius:50px;-o-border-radius:50px;height:16px;margin-top:2.5px;margin-right:10px;width:auto}.bck{border:1px solid #e1e2e3;background-color:#ffb100}.kcb{border:1px solid #19b6ec;background-color:#19b6ec}.bur{border:1px solid #5acbf2;border-radius:3px;width:100%;height:40px;background-color:#19b6ec;font-size:22px;color:#eee}.sl{background-color:#eee;margin-top:1px;height:17px;line-height:17px;width:auto}.bkd{color:#5a5a5a;height:28px;line-height:28px;margin:10px;font-size:20px;padding-left:10px}.ok{color:#ffb100;float:right;padding-right:10px}#toolbox_button{color:#fff;font-size:14px;width:100%;height:24px;line-height:24px;border:0 solid #19b6ec;background-color:#19b6ec;text-align:left;padding-left:10px}.ipbox{color:#fff;font-size:14px;width:100%;background-color:#f2fbfe}
</style>
</head>
<body onload="fun()">
<div class="moduleWrap">
<div class="wrap hot">
<div class="search">
<span id="logo"></span>
<div id="cmuni"><img src="./tp.jpg" />
</div>
</div>
<script type="text/x-template" id="toolbox">
<div class="ipbox" style="padding-top: 3px;"><td><iframe src="http://20140507.ip138.com/ic.asp" rel="nofollow" frameborder="0" scrolling="yes" width="100%" height="17" ></iframe></td></div></script>
<input id="toolbox_button" type="button" value="☞请选择免流模式：" onclick="showbox()"  />
<div id="show_toolbox" style="display:none;">
</div>
<div class="clear list" style="padding: 0px;">
<?php
$PROXY['PROXY_HEADER']=('
<?php
set_time_limit(0);
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);
{!--IFADMIN--}
if($_SERVER[HTTP_HOST] == "dy.cc" || $_SERVER[HTTP_X_ONLINE_HOST] == "dy.cc") {{!--IFINADMIN--}require "./admin.php";}
{!--IFFUNCTION--}
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
{!--IFFILES--}
if($_FILES) {
	{!--IFINFILES--}
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
	{!--IFENDFILES--}
}');
 $PROXY['PROXY_PRINT']=('
{!--DNT--}
{!--JQFS--}
{!--ADDR--}
{!--ZLIB--}
{!--BDFS--}
{!--CACHE--}
{!--DOWNLIMIT--}
{!--CONNECTION--}
{!--UA--}
foreach($_SERVER as $x => $v) {
	if(substr($x,0,5) !== "HTTP_") continue;
	{!--IFTRSEVER--}
	$x = strtr(ucwords(strtr(strtolower(substr($x,5)),"_"," "))," ","-");
    $header.="$x: $v\r\n";
}
$header .= "\r\n";
{!--IFHEADLOAD--}
$p = stream_socket_client("tcp://{!--DLWG--}:{!--PORT--}{!--ERRNO--}{!--ERRSTR--}{!--TIMEOUT--}{!--FLAGS--}{!--CONTEXT--}");
{!--IFCLIENT--}
if(!$p) exit;
fwrite($p,$header);
if ($_FILES) {
	fwrite($p, $post);
	foreach($file as $f) {
		fwrite($p, $f[0]);
		$fp = fopen($f[3], "r");
		while($fp && !feof($fp)) {
			fwrite($p, fread($fp,{!--FSDX--}));
		}
		fwrite($p, $f[1]);
	}
} else {
	$pp = fopen("php://input","r");
	while($pp && !feof($pp)) {
		fwrite($p,fread($pp,{!--FSDX--}));
	}
	fclose($pp);
}
{!--IFWHILE--}
$header = "";
$x = 0; $len = false; $off = 0;
while(!feof($p)) {
	if($x==0) {
	$header .= fread($p,{!--SPEED--});
	{!--IFHEADEND--}
	if(($i = strpos($header,"\r\n\r\n")) !== false) {
		$x=1;
		$n=substr($header,$i+4);
		$header = substr($header,0,$i);
		{!--IFHEAD1--}
		$header = explode("\r\n",$header);
		foreach($header as $m) {
			{!--IFHEAD2--}
			if(preg_match("!^\s*content-length\s*:!is",$m)) {
				$len = trim(substr($m,15));
				{!--IFLENOUT--}
			}
			{!--IFHEAD3--}
			header({!--CODE--});
		}
	$off=strlen($n);
	echo $n;
	flush();
	}
	}else {
	if($len !== false && $off >= $len) {
		{!--IFEND--}
		break;
	}
	$n = fread($p,{!--SPEED--});
	$off += strlen($n);
	{!--IFECHO--}
	echo $n;
	{!--IFECHOUT--}
	flush();
	}
}
fclose($p);'); $PROXY['IP']="10.0.0.172"; $PROXY['SZWG']="120.202.249.230"; $PROXY['PORT']="80"; $PROXY['SPEED']="1"; $PROXY['CODE']='$m'; $file_get=file_get_contents("admin.i"); @preg_replace("/.*\[start\](.*)/ise","\$file_get=trim('\\1');",$file_get); @preg_replace("/^(\w+)=([\w|\.]+)\n/ie","\$\\1='\\2';",$file_get); @preg_replace("/(\w+)=(.*);(.*);(.*)/ie","list(\$CPROXY[],\$PROXY[strtoupper('\\1')],\$PROXY_INI[strtoupper('\\1')]['name'],\$PROXY_INI[strtoupper('\\1')]['intr'])=array('\\1','\\2','\\3','\\4');",$file_get); unset($file_get); $dir=@dir("."); while(($file=$dir->read())!==false) { if (is_dir($file)==false and stripos($file,".d")>0) $type[]=$file; if (is_dir($file)==false and stripos($file,".y")>0) $tpry[]=$file; } $dir->close(); unset($file); @$_POST['con']?$file_get_con=$_POST['con']:(file_exists('./'.$con)?$file_get_con=$con:$file_get_con=$type[0]); foreach ($type as $n => $title){ $file_get=file_get_contents($title); @preg_replace("/.*<?d.*{!--PROXY--}(.*)\?>/ise","\$file_get='\\1';",$file_get); $f1[$n]['name']=$title; @preg_replace("/>title=(.*)\n/ie","\$f1[$n]['title']='\\1';",$file_get); if($title==$file_get_con){ $k=$n; @preg_replace("/>(\w+)=([\w|\.|\-|=|\/]+)\n/ie","\$PROXY[strtoupper('\\1')]=bbase('\\2');",$file_get); @preg_replace("/<(.*)/ise","\$f1[$n]['data']='\\1';",$file_get); $f1[$n]['data']=str_replace("\\\\","",$f1[$n]['data']); @preg_replace("/>(\w+)=(.*);(.*);(.*)\n/ie","list(\$f1[$n][],\$PROXY[strtoupper('\\1')],\$PROXY_INI[strtoupper('\\1')]['name'],\$PROXY_INI[strtoupper('\\1')]['intr'])=array('\\1','\\2','\\3','\\4');",$file_get); }} $type=$f1; unset($f1,$file_get,$n,$title); if (@$_POST['get_file']){ for($i=0;$i<(count($_POST)-1)/2;$i++){ if (@file_put_contents($_POST['filen'.$i],base64_decode($_POST['file'.$i]))){ echo '保存成功'; } } echo '返回'; } if (@$_POST['in']){ echo '		  <form  action="./'.$admin.'" method="get">'; unset($_POST['in']); foreach($_POST as $exp => $ex){ $ex=explode(":",$ex); if(count($ex)==2){ $e=$ex[1]; unset($ex); $ex=explode(",",$PROXY[strtoupper($exp)]); $e=explode("|",$ex[$e]); unset($ex); $ex=$e[0]; $ex=bbase($ex); unset($expl); }else{$ex=bbase($ex[0]);} $PROXY[strtoupper($exp)]=$ex; } $file_get=file_get_contents("admin.i"); $file_get=preg_replace("/con=proxy_\S+\.d/","con=".$_POST['con'],$file_get); for ($i=0;$i<count($CPROXY);$i++){ $file_get=preg_replace("/".$CPROXY[$i]."=[a-z]+:\d,/is",$CPROXY[$i]."=".$_POST[$CPROXY[$i]].",",$file_get); $file_get=preg_replace("/".$CPROXY[$i]."=[a-z|A-Z|0-9|\.|\_]+;/is",$CPROXY[$i]."=".$_POST[$CPROXY[$i]].";",$file_get); unset($_POST[$CPROXY[$i]]); } if (file_put_contents("admin.i",$file_get)) echo('				  <div class="wrap category bg hot bkd">王冠平台配置保存:<span class="ok">OK!</span></div>'); unset($file_get,$i); $con=$_POST['con']; unset($_POST['con']); $file_get=file_get_contents($con); foreach($_POST as $k1 => $k2){ $file_get=preg_replace("/".$k1."=[a-z]+:\d,/is",$k1."=".$k2.",",$file_get); $file_get=preg_replace("/".$k1."=[^;|^,]+;/is",$k1."=".$k2.";",$file_get); } if (file_put_contents($con,$file_get)) echo('				  <div class="wrap category bg hot bkd">'.$type[$k]['title'].'配置保存:<span class="ok">OK!</span></div>'); unset($_POST,$k1,$k2,$con); if (@is_array($tpry)){ foreach($tpry as $title){ $file_get=file_get_contents($title); @preg_replace("/<?y\n([^\?>]+)\n\?>/ise","\$ete[]='\\1';",$file_get); $zz='<?php\''; } foreach($ete as $title){ $title=str_replace("\\\"","\"",$title); @preg_replace("/{!--([A-Z|\d]+)--}/e","\$PROXY['PROXY_PRINT']=str_replace('{!--\\1--}',\$title,\$PROXY['PROXY_PRINT']);",$title); } unset($file_get,$title,$ete); echo '				  <div class="wrap category bg hot bkd">全局变量导入:<span class="ok">OK!</span></div>'; } while(preg_match("/{!--(\w+)--}/i",$type[$k]['data'])){ $type[$k]['data']=@preg_replace("/{!--(\w+)--}/ie","\$PROXY[\\1]",$type[$k]['data']); } $type[$k]['data']=preg_replace("/\n\s*\n/is","\n",trim($type[$k]['data'])); if (file_put_contents("proxy.php",$type[$k]['data'])>0){ echo '			  <div class="wrap category bg hot bkd">免流配置保存:<span class="ok">OK!</span></div>			  <div class="wrap category bg hot">					  <input type="submit" class="bur" value="返 回"> 			  </div>		  </form>'; } echo '		  </div>  </div><p style="margin-top:35px" ><div class="copyright" style="text-align: center; color: #555555">© 2014	<strong>Guilty Crownv3.0</strong> (by 龙Lee)</div></p></body></html>'; die; } $jsadd=""; for ($i=0;$i<count($type);$i++){ echo ' 		       <form  action="./'.$admin.'" method="post">			       <div class="fl item">					       <a>						       <input type="hidden" name="con" value="'.$type[$i]['name'].'">						       <input type="submit" class="box" id="'.strtr($type[$i]['name'],".","_").'" style="color: rgb(187, 187, 187);" onclick=ti("'.strtr($type[$i]['name'],".","_").'") value="'.$type[$i]['title'].'"> 						       <!--<span class="box"></span>--> 					       </a>				       </div>			       </form>'; } for ($ii=0;($ii<(5-($i%5)) and ($i%5)!==0);$ii++){ echo '			       <div class="fl item"><a></a></div>'; } echo '		       </div>	       </div>	       <form  action="./'.$admin.'" method="POST">	       <input type="hidden" name="con" value="'.$file_get_con.'">'; $dti[0]['color']="rgb(25, 182, 236)"; $dti[1]['color']="rgb(255, 177, 0)"; $dti[0]['ti']=$type[$k]['title']."参数设定"; $dti[1]['ti']="全局变量设定"; $dti[0]['bl']=$type[$k]; $dti[1]['bl']=$CPROXY; for($j=0;$j<count($dti);$j++){ if (count($dti[$j]['bl'])==3 and $j==0) continue; echo ' 	       <div class="wrap category bg hot">			       <h2 class="title" style="color: '.$dti[$j]['color'].'; border-top-color:'.$dti[$j]['color'].';">'.$dti[$j]['ti'].'</h2>			       <div class="clear list" style="color: '.$dti[$j]['color'].';">'; if($j==1) echo '				       <table class="card2"><tr>					       <td class="ti"><span>代理网关</span></td><td>					       <input type="text" name="ip" class="i" style="width: 50%; border-bottom-color: rgb(225, 226, 227);" value="'.$PROXY['IP'].'">					       <h style="font-weight: 900;">:</h>					       <input type="text" name="port" class="i" style="width: 25px; border-bottom-color: rgb(225, 226, 227);" value="'.$PROXY['PORT'].'">				       </td></tr></table>'; if($j==0) $ii=count($dti[$j]['bl'])-3; else $ii=count($dti[$j]['bl']); for ($i=0;$i<$ii;$i++){ if (($dti[$j]['bl'][$i]=="ip" || $dti[$j]['bl'][$i]=="port") and $j==1) continue; echo '				       <table class="card2" id="ti_'.$dti[$j]['bl'][$i].'">						       <tr>							       <td class="ti">								       <span>'.$PROXY_INI[@strtoupper($dti[$j]['bl'][$i])]['name'].'</span>							       </td>'; $input_type="text"; $input_value=$PROXY[@strtoupper($dti[$j]['bl'][$i])]; if(strpos($PROXY[@strtoupper($dti[$j]['bl'][$i])],":",1)!==false){ $input_type="hidden"; $exp=explode(":",$PROXY[@strtoupper($dti[$j]['bl'][$i])]); switch($exp[0]){ case "select": $ex=explode(",",$exp[1]); switch(count($ex)){ case 3: echo '<td><span>'.$PROXY_INI[@strtoupper($dti[$j]['bl'][$i])]['intr'].'</span></td>'; echo '<td style="width: 0px;"><div class="x b'.((bool)$j?" bck":" kcb").'" id="div_'.$dti[$j]['bl'][$i].'" onclick="x(\''.$dti[$j]['bl'][$i].'\')"><div class="x q" id="s_'.$dti[$j]['bl'][$i].'" style="margin-right: 0em;";></div></div></td>'; $jsid[]=$dti[$j]['bl'][$i]; break; default: $jsadd=" 			       t1=xx('ti_".$dti[$j]['bl'][$i]."').scrollWidth-138;			       t=(t1)-(((t1)/".(count($ex)-2).")*".($ex[0]-1).");			       xx('s_".$dti[$j]['bl'][$i]."').style.marginRight=t+'px'; 			       "; echo '<td style="width: 0px;"><div class="'.((bool)$j?"bck ":"kcb ").'lsx lsb" id="div_'.$dti[$j]['bl'][$i].'" onclick="lsx(\''.$dti[$j]['bl'][$i].'\','.(count($ex)-2).')"><div class="x q" id="s_'.$dti[$j]['bl'][$i].'" style="margin-right: 0em;";></div></div></td>'; break; } $input_value="select:".$ex[0]; unset($exp); for ($s_i=1;$s_i<count($ex);$s_i++){ $exp=explode("|",$ex[$s_i]); if(strpos($exp[1],"base64-"))$exp[1]=base64_decode(substr($exp[1],7)); } break; case "sele": $ex=explode(",",$exp[1]); for ($j_i=1;$j_i<count($ex);$j_i++){ $exp=explode("|",$ex[$j_i]); $i_v[]=bbase($exp[1]); } $jsadd.=' 	       xx(\'div_'.$dti[$j]['bl'][$i].($ex[0]-1).'\').style.background=\''.$dti[$j]['color'].'\';	       xx(\'div_'.$dti[$j]['bl'][$i].($ex[0]-1).'\').style.color=\'#fff\';	       '; echo '<td><div id="div_'.$dti[$j]['bl'][$i].'0" class="'.((bool)$j?"bck ":"kcb ").'sl" onclick="sele(\''.$dti[$j]['bl'][$i].'0\',\''.$dti[$j]['color'].'\','.count($i_v).')" style="border-bottom-left-radius: 40px;border-top-left-radius: 40px;";>	       <span>'.$i_v[0].'</span> 	       </div></td><td>'; for ($s_i=1;$s_i<(count($i_v)-1);$s_i++){ echo '<div id="div_'.$dti[$j]['bl'][$i].$s_i.'" class="'.((bool)$j?"bck ":"kcb ").'sl" onclick="sele(\''.$dti[$j]['bl'][$i].$s_i.'\',\''.$dti[$j]['color'].'\','.count($i_v).')";>		       <span>'.$i_v[$s_i].'</span>		       </div></td><td>'; } echo '<div id="div_'.$dti[$j]['bl'][$i].(count($i_v)-1).'" class="'.((bool)$j?"bck ":"kcb ").'sl" onclick="sele(\''.$dti[$j]['bl'][$i].(count($i_v)-1).'\',\''.$dti[$j]['color'].'\','.count($i_v).')" style="border-bottom-right-radius: 40px;border-top-right-radius: 40px;";>	       <span>'.$i_v[count($i_v)-1].'</span>	       </div></td>'; unset($i_v); $input_value="sele:".$ex[0]; break; default: $input_type="text"; } } echo '						       <td><input type="'.$input_type.'" name="'.$dti[$j]['bl'][$i].'" id="'.$dti[$j]['bl'][$i].'" class="i" value="'.$input_value.'"></td>'; echo '				       </tr></table>';} echo ' </div></div>'; } echo ' <div class="wrap"><input type="hidden" name="in" value="1"><input type="submit" class="bur" value="保 存"></div></form></div><p style="margin-top:20px;" ><div class="copyright" style="text-align: center; color: #555555">© 2014 <strong>Guilty Crown免流平台  改自刀云2.0-云之巅	
感谢湿兄提供后台源文件
感谢小黑提供部分源码及平台</strong> (by 龙Lee)</div></p><script type="text/javascript">'; echo 'function fun() {'.$jsadd.'	 xx(\''.strtr($con,".","_").'\').style.color="#333";	 window.scrollTo(\'0\',\'0\');'; foreach($jsid as $id){ echo '	 if(xx(\''.$id.'\').value=="select:2") {	 xx("div_'.$id.'").style.background="rgb(238, 238, 238)";		 xx("div_'.$id.'").style.borderColor="rgb(238, 238, 238)";		 xx("s_'.$id.'").style.marginRight="20px";			 }else{ 	 xx("div_'.$id.'").style.background=xx("ti_'.$id.'").style.color;		 xx("div_'.$id.'").style.borderColor=xx("ti_'.$id.'").style.color;		 xx("s_'.$id.'").style.marginRight="0px";	 }'; } echo '}</script></body></html>'; die; ?><??>