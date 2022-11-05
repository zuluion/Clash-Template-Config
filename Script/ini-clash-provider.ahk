EnvGet, userprofile, $env:USERPROFILE
clash_dir = %userprofile%\.config\clash

IfExist, %clash_dir%
    ; 创建clash配置文件目录下的myprovider目录
    FileCreateDir, %clash_dir%\myprovider\proxies
    FileCreateDir, %clash_dir%\myprovider\ruleset
    ; 从Github拉下来初始化的Provider文件
    UrlDownloadToFile, https://cdn.jsdelivr.net/gh/zuluion/Clash-Template-Config@master/Ini-Files/provider-airport.yml, %clash_dir%\myprovider\proxies\provider-airport.yml
    ; UrlDownloadToFile, https://cdn.jsdelivr.net/gh/zuluion/Clash-Template-Config@master/Ini-Files/provider-paoche.yml, %clash_dir%\myprovider\proxies\provider-paoche.yml
    ; 调用clash for windows，从当前项目下载配置文件模板
    Run, clash://install-config?url=https://cdn.jsdelivr.net/gh/zuluion/Clash-Template-Config@master/Clash-Template-Config.yml
    MsgBox, 初始化完成
    
