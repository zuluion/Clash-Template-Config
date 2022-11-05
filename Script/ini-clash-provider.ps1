$clash_dir = "$env:USERPROFILE"+"\.config\clash"
# echo $clash_dir
$dir_isExist = test-Path -Path $clash_dir
if($dir_isExist){
    cd $clash_dir 
    if(!".\myprovider"){
        powershell mkdir -p .\myprovider\proxies,.\myprovider\ruleset
    } else {
        $folder_time_str = ".\myprovider-backup-"+(Get-Date).tostring("yyyy-MM-dd-HH-mm-ss")
        powershell Rename-Item .\myprovider $folder_time_str
        powershell mkdir -p .\myprovider\proxies,.\myprovider\ruleset
    }   
    powershell cd .\myprovider\proxies
    # powershell New-Item -Path .\myprovider\proxies -ItemType file -Name provider-airport.yml
    # powershell New-Item -Path .\myprovider\proxies -ItemType file -Name provider-paoche.yml
    powershell iwr -Uri "https://cdn.jsdelivr.net/gh/zuluion/Clash-Template-Config@master/Ini-Files/provider-airport.yml" -OutFile ".\myprovider\proxies\provider-airport.yml"
    # powershell iwr -Uri "https://cdn.jsdelivr.net/gh/zuluion/Clash-Template-Config@master/Ini-Files/provider-paoche.yml" -OutFile ".\myprovider\proxies\provider-paoche.yml"
    start "clash://install-config?url=https://cdn.jsdelivr.net/gh/zuluion/Clash-Template-Config@master/Clash-Template-Config.yml"
    # powershell start $clash_dir 
    echo "初始化完成"
}
