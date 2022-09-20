$clash_dir = "$env:USERPROFILE"+"\.config\clash"
# echo $clash_dir
$dir_isExist = test-Path -Path $clash_dir
if($dir_isExist){
    cd $clash_dir 
    powershell mkdir -p .\myprovider\proxies,.\myprovider\ruleset
    powershell cd .\myprovider\proxies
    powershell New-Item -Path .\myprovider\proxies -ItemType file -Name provider-airport.yml
    powershell New-Item -Path .\myprovider\proxies -ItemType file -Name provider-paoche.yml
    powershell start $clash_dir 
}
