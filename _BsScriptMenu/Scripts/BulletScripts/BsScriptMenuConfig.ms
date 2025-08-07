rollout rolBsScriptMenuConfig "BsScriptMenuConfig"
(
	group ""
	(
		Label Label3 "D:\Program Files\Autodesk\BulletS" align:#center
		button btn_folder "自定列表" pos:[23,50] height:40 width:65  tooltip:"拷贝脚本到目录后点击右边或重启软件更新"
		button btn_update "更新列表" pos:[93,50] height:40 width:65  tooltip:"点击更新目录脚本列表"
		button btn_readme "不看后悔" pos:[163,50] height:40 width:65  tooltip:"必看说明"
	)

	on rolBsScriptMenuConfig open do 
	(
		makeDir  ("D:\\Program Files\\Autodesk\\BulletS\\")
	)
	
	on btn_folder pressed do 
	(
		shellLaunch "explorer.exe" "D:\Program Files\Autodesk\BulletS"
	)
	on btn_update pressed do
	(
		filein ((GetDir #scripts) + "\\Startup\\updateList.ms")
	)
	on btn_readme pressed do 
	(
		messagebox "注意事项：\n\n1 关于更新列表：\n支持重启MAX更新列表，并保留手动更新！\n\n2 关于作者：\n脚本启发 Igorznag & Jwtoon 和吇鱼，Bullet.S 完全重构~"
	)
	group ""
	(
		HyperLink lnk1 "开发者：Bullet.S ---" align:#center color:(color 0 150 100) hovercolor:(color 0 150 150) visitedcolor:(color 0 150 100) address:"https://space.bilibili.com/2031113"
		HyperLink lnk2 "开源免费，请勿商用" align:#center color:(color 0 150 100) hovercolor:(color 0 150 150) visitedcolor:(color 0 150 100) address:"https://space.bilibili.com/2031113/lists/560782" 
		Label Label0 "- 版本：Aptx 1.0 -" align:#center 
	)
)
createDialog rolBsScriptMenuConfig 250 190