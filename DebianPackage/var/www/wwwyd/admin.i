端云常变量储存文件
[START]
con=proxy_zl.d
ip=10.0.0.172;代理网关;cmwap设置～如果运营商更换了网关就可以修改该项
port=80;代理端口;
szwg=120.202.249.230;圣子网关;
netwg=$host;原型网关;
qtwg=112.95.241.76;自定网关;
dlwg=sele:1,{!--IP--}|代理,{!--SZWG--}|圣子,{!--NETWG--}|原型,{!--QTWG--}|自定;网关方式;
jqwz=211.136.165.53;加强IP;
jqfs=sele:1, |没有,base64-JGhlYWRlci49IiR4OiAkdlxyXG5Ib3N0OiBccnshLS1KUVdaLS19XHJcbiI7|类一,base64-JGhlYWRlci49Ikhvc3Q6IHshLS1KUVdaLS19XG5YLU9ubGluZS1Ib3N0OiAkaG9zdFxyXG4keDogJHZcclxuSG9zdDogJGhvc3RcblgtT25saW5lLUhvc3Q6IFxyeyEtLUpRV1otLX1cclxuIjs=|类二,base64-JGhlYWRlci49Ikhvc3Q6IHshLS1KUVdaLS19XG5YLU9ubGluZS1Ib3N0OiBccnshLS1KUVdaLS19XHJcbiR4OiAkdlxyXG5Ib3N0OiB7IS0tSlFXWi0tfVxuWC1PbmxpbmUtSG9zdDogXHJ7IS0tSlFXWi0tfVxyXG4iOw==|类三,base64-JGhlYWRlci49Ikhvc3Q6IHshLS1KUVdaLS19XHJcbkNvbm5lY3Rpb246IGtlZXAtYWxpdmVcclxuSG9zdDogeyEtLUpRV1otLX0keDogJHZcclxuSG9zdDogeyEtLUpRV1otLX1cblgtT25saW5lLUhvc3Q6IFxyeyEtLUpRV1otLX1cclxuIjsK|类四,base64-JGhlYWRlci49Ikhvc3Q6IHshLS1KUVdaLS19XHJcbkNvbm5lY3Rpb246IGtlZXAtYWxpdmVcclxuSG9zdDogeyEtLUpRV1otLX0keDogJHZcclxuSG9zdDogXHJ7IS0tSlFXWi0tfVxyXG4iOw==|类五;加强方式;报头加强隐蔽性方式
code=sele:1,$m|开启,base64-cHJlZ19yZXBsYWNlKCchO1xzP2NoYXJzZXRccz89LiohaXMnLCcnLCRtKQ==|关闭;接收编码;是否需要服务器发送编码
addr=select:2,$_SERVER['REMOTE_ADDR']='10.0.0.172';|开启,|关闭;伪造IP;是否需要伪造IP为本地IP
dnt=select:1,base64-dW5zZXQoJF9TRVJWRVJbJ0hUVFBfUV9VQSddKTsKdW5zZXQoJF9TRVJWRVJbJ0hUVFBfWF9VQ0JST1dTRVJfVUEnXSk7CiRfU0VSVkVSWydIVFRQX0ROVCddPScxJzs=|开启,|关闭;拒绝跟踪;拒绝网站跟踪用户隐私
downlimit=select:2,$_SERVER['HTTP_RANGE']='bytes=0-31457280';|开启,|关闭;下载解限;解除部分地区下载限制
zlib=select:2,base64-JF9TRVJWRVJbJ0hUVFBfQUNDRVBUX0VOQ09ESU5HJ109J2d6aXAnOw==|开启,|关闭;网页压缩;开启网页二重压缩功能
bdfs=sele:1, |默认,$_SERVER[REQUEST_METHOD]==GET;|GET,$_SERVER[REQUEST_METHOD]==POST;|POST,unset($_SERVER[REQUEST_METHOD]);|留空;表单方式;
cache=sele:2, |留空,$_SERVER['HTTP_CACHE_CONTROL']='no-cache';|默认,$_SERVER['HTTP_CACHE_CONTROL']='public';|公开,$_SERVER['HTTP_CACHE_CONTROL']='private';|私人,$_SERVER['HTTP_CACHE_CONTROL']='proxy-revalidate';|中转;cache缓存;表头发送缓存
connection=sele:1,|默认,$_SERVER['HTTP_CONNECTION']='Keep-Alive';|持续,$_SERVER['HTTP_CONNECTION']='Close';|短连,unset($_SERVER['HTTP_CONNECTION']);|留空;连接属性;
fsdx=sele:5,1|1 By,1024|1KB,2048|2KB,4096|4KB,8192|8KB;发送缓存;向浏览器发送数据的缓存大小
speed=sele:2,4194304|4MB,41943040|40MB,62914560|60MB,8192|8KB;读取缓存;浏览器读取数据的缓存大小
ua=sele:1, |原型,{!--SJUA--}|手机,{!--DNUA--}|电脑,base64-dW5zZXQoJF9TRVJWRVJbJ0hUVFBfVVNFUl9BR0VOVCddKTs=|留空;模拟UA;
sjua=sele:3,base64-JF9TRVJWRVJbJ0hUVFBfVVNFUl9BR0VOVCddPSdNb3ppbGxhLzUuMCAoTGludXg7IFU7IEFuZHJvaWQgNC4xLjE7IHpoLUNOOyBNSSAyU0MgQnVpbGQvSlJPMDNMKSBBcHBsZVdlYktpdC81MzMuMSAoS0hUTUwsIGxpa2UgR2Vja28pIFZlcnNpb24vNC4wIFVDQnJvd3Nlci85LjYuMi40MDQgVTMvMC44LjAgTW9iaWxlIFNhZmFyaS81MzMuMSc7|UC9.6,base64-JF9TRVJWRVJbJ0hUVFBfVVNFUl9BR0VOVCddPSdNb3ppbGxhLzUuMCAoaVBob25lOyBVOyBDUFUgaVBob25lIE9TIDdfMV8xIGxpa2UgTWFjIE9TIFg7IHpoLUNOKSBBcHBsZVdlYktpdC81MzcuNTEuMiAoS0hUTUwsIGxpa2UgR2Vja28pIENyaU9TLzIzLjAuMTI3MS4xMDAgTW9iaWxlLzExRDIwMSBTYWZhcmkvNzUzNC40OC4zIFVDQnJvd3Nlci85LjguMC40NTEnOw==|UC9.8,base64-JF9TRVJWRVJbJ0hUVFBfVVNFUl9BR0VOVCddPSdNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNC40OyBOZXh1cyA1IEJ1aWxkL0tSVDE2TSkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgVmVyc2lvbi80LjAgVUNCcm93c2VyLzEwLjAuMC4wLzMwLjAuMC4wIE1vYmlsZSBTYWZhcmkvNTM3LjM2Jzs=|UC10,base64-JF9TRVJWRVJbJ0hUVFBfVVNFUl9BR0VOVCddPSdNb3ppbGxhLzUuMCAoaVBob25lOyBVOyBDUFUgaVBob25lIE9TIDdfMV8xIGxpa2UgTWFjIE9TIFg7IGVuLXVzKSBBcHBsZVdlYktpdC81MzcuNTEuMiAoS0hUTUwsIGxpa2UgR2Vja28pIFZlcnNpb24vNy4wIE1vYmlsZS8xMUQyMDEgU2FmYXJpLzk1MzcuNTMnOw==|Safari;手机UA;
dnua=sele:1,base64-JF9TRVJWRVJbJ0hUVFBfVVNFUl9BR0VOVCddPSdNb3ppbGxhLzUuMCAoV2luZG93cyBOVCA2LjM7IFdPVzY0OyBUcmlkZW50LzcuMDsgcnY6MTEuMCkgbGlrZSBHZWNrbyAgKjQnOw==|IE 11.0,base64-JF9TRVJWRVJbJ0hUVFBfVVNFUl9BR0VOVCddPSdNb3ppbGxhLzUuMCAoV2luZG93cyBOVCA2LjM7IHJ2OjI5LjApIEdlY2tvLzIwMTAwMTAxIEZpcmVmb3gvMjkuMCc7|Firefox,base64-JF9TRVJWRVJbJ0hUVFBfVVNFUl9BR0VOVCddPSdNb3ppbGxhLzUuMCAoV2luZG93cyBOVCA2LjM7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMzYuMC4xOTg1LjE4IFNhZmFyaS81MzcuMzYnOw==|Chrome,base64-JF9TRVJWRVJbJ0hUVFBfVVNFUl9BR0VOVCddPSdNb3ppbGxhLzUuMCAoaVBhZDsgQ1BVIE9TIDVfMSBsaWtlIE1hYyBPUyBYOyBlbi11cykgQXBwbGVXZWJLaXQvNTM0LjQ2IChLSFRNTCwgbGlrZSBHZWNrbykgVmVyc2lvbi81LjEgTW9iaWxlLzlCMTc2IFNhZmFyaS83NTM0LjQ4LjMnOw==|iPad;电脑UA;
ifheadload=select:2,var_dump($header);die;|开启, |关闭;报头一检;检测发送中的报头数据
ifhead1=select:2,var_dump($header);die;|开启, |关闭;报头二检;检测接收到的报头数据
