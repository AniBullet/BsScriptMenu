/**************************************************************************************************************************************************************************************
------------版权声明：最终版权归原作者：吇鱼 所有-------------
**************************************************************************************************************************************************************************************/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
rollout aboutme "BulletS"
(
	group ""
	(
		Label Label3 "D:\Program Files\Autodesk\BulletS" align:#center
		button btn_folder "自定列表" pos:[23,50] height:40 width:65  tooltip:"拷贝脚本到目录后点击右边或重启软件更新"
		button btn_update "更新列表" pos:[93,50] height:40 width:65  tooltip:"点击更新目录脚本列表"
		button btn_readme "不看后悔" pos:[163,50] height:40 width:65  tooltip:"必看说明"
	)

	on aboutme open do 
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
		messagebox "注意事项：\n\n1 关于更新列表：\n已支持重启MAX更新列表，并保留手动更新！请勿反复拖入安装mzp脚本~\n\n2 关于菜单作者：\n已知有 Igorznag & Jwtoon 和吇鱼，S.银色子弹魔改，优化部分代码并打包~ \n\n3 关于自定义目录名：\n请修改ms文件，位于（max安装目录）*\scripts\ScriptsMenu ，建议有一定脚本基础的胖友食用~ \n\n ** 最后：技术宅拯救世界~\n\nTips：卸载请手动删除：\n D:\Program Files\Autodesk\BulletS 文件夹，\n*:\Program Files\Autodesk\3ds Max 201*\scripts\ScriptsMenu 文件夹，\n*:\Program Files\Autodesk\3ds Max 201*\scripts\Startup\updateList.ms"
		)
	group ""
	(
	HyperLink lnk1 "开发者：@吇鱼  自用魔改：Bullet.S ---" align:#center color:(color 0 150 100) hovercolor:(color 0 150 150) visitedcolor:(color 0 150 100) address:"http://www.cgwayne.com/"
	HyperLink lnk2 "版权归原作者，请勿商用 ---- 子弹时间 ---" align:#center color:(color 0 150 100) hovercolor:(color 0 150 150) visitedcolor:(color 0 150 100) address:"https://acebullet.tk/" 
	Label Label0 "- 版本：Aptx 4869 -" align:#center 
	)
)
createDialog aboutme 250 190