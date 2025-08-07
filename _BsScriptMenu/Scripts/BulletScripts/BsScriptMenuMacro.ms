macroScript BsScriptMenuConfig
category:"_[BsScriptMenu]"
buttonText:"BsScriptMenuConfig设置"
toolTip:"设置Config"
(
    try(fileIn ((getDir #Scripts)+ @"\\BulletScripts\\BsScriptMenuConfig.ms"))
    catch(try(massagebox (getCurrentException()));catch();messagebox "打开 BsScriptMenuConfig 失败，可能脚本错误或安装不完全，\r\n\r\n建议查看帮助或重新安装，还有问题烦请联系我...                            " beep:false title:"BsScriptMenu")
)