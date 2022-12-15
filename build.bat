@echo off

@REM 参考权威的的h2.dll，重新编译新版本
@REM https://github.com/orudge/h2net/blob/master/build.bat

set H2ZIP=https://github.com/h2database/h2database/releases/download/version-2.1.214/h2-2022-06-13.zip
set H2Version=2.1.214

set IKVMZIP=https://github.com/ikvm-revived/ikvm/releases/download/8.1.5717.0/ikvmbin-8.1.5717.0.zip
set IKVMVersion=8.1.5717.0


mkdir dl

if exist h2.zip goto got_h2
powershell -Command "(New-Object Net.WebClient).DownloadFile('%H2ZIP%', 'h2.zip')"
powershell -Command "Expand-Archive h2.zip -DestinationPath dl"

:got_h2

if exist ikvm.zip goto got_ikvm
powershell -Command "(New-Object Net.WebClient).DownloadFile('%IKVMZIP%', 'ikvm.zip')"
powershell -Command "Expand-Archive ikvm.zip -DestinationPath dl"

:got_ikvm
dl\ikvm-%IKVMVersion%\bin\ikvmc -target:library dl\h2\bin\h2-%H2Version%.jar -version:%H2Version%.0 -out:h2.dll -assembly:h2

