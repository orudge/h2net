@echo off

set H2ZIP=http://www.h2database.com/h2-2019-03-13.zip
set H2Version=1.4.199

set IKVMZIP=http://www.frijters.net/ikvmbin-8.1.5717.0.zip
set IKVMVersion=8.1.5717.0

set NUGETURL=https://dist.nuget.org/win-x86-commandline/latest/nuget.exe

mkdir dl

if exist h2.zip goto got_h2
powershell -Command "(New-Object Net.WebClient).DownloadFile('%H2ZIP%', 'h2.zip')"
powershell -Command "Expand-Archive h2.zip -DestinationPath dl"

:got_h2

if exist ikvm.zip goto got_ikvm
powershell -Command "(New-Object Net.WebClient).DownloadFile('%IKVMZIP%', 'ikvm.zip')"
powershell -Command "Expand-Archive ikvm.zip -DestinationPath dl"

:got_ikvm
dl\ikvm-%IKVMVersion%\bin\ikvmc -target:library dl\h2\bin\h2-%H2Version%.jar -keyfile:h2.snk -version:%H2Version%.0 -out:h2.dll -assembly:h2

powershell -Command "(New-Object Net.WebClient).DownloadFile('%NUGETURL%', 'nuget.exe')"
nuget pack h2.nuspec
