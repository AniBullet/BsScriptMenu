fn_macro_Path = (GetDir #scripts) + "\BulletScripts\BsScriptsMenu\macro.ms"
filein  fn_macro_Path

-----------------------------------------------------
global ii = 0 
-----------------------------------------------------

fn recursive_menu subMenu subPath = 
( 
    files=getFiles (subPath + ("/" + "*.m*")); sort files  
    dirArr = GetDirectories (subPath + "/*"); sort dirArr 
    -------------------- creating run-maroscripts and populating menu 
    for i in files do 
    ( 
        ii = ii + 1 

        str = "macroscript BS_Scripts_menu" + (ii as string) + " category:\"BS_Scripts_menu\" buttontext:\"" + (getFilenameFile i) + "\" (FileIn @\"" + i + "\")" 
        execute str  

        testItem = menuMan.createActionItem ("BS_Scripts_menu" + (ii as string)) "BS_Scripts_menu" 
        subMenu.addItem testItem -1 
    ) 
    --get dirs 
    if(dirArr.count>0)then 
    ( 
        if(files.count>0)then 
        ( 
            separator = menuMan.createSeparatorItem() 
            subMenu.addItem separator -1 
        )--if(files.count>0)then 
        --creating subMenu 
        for i in dirArr do 
        ( 
            subSubPath = substring i 1 (i.count-1) 
            subSubMenu = menuMan.createMenu (getFilenameFile subSubPath) 
            subSubItem = menuMan.createSubMenuItem "name" subSubMenu 
            subMenu.addItem subSubItem -1 
            recursive_menu subSubMenu subSubPath 
        )--for i in dirArr do 
    )--if(dirArr.count>0)then 
)--fn recursive_menu my_menu 

fn about_Menu subMenu =
(
    separator = menuMan.createSeparatorItem() 
    subMenu.addItem separator -1 

    --stt = aboutme_macroScript ()----------------aboutme ����λ��
    bbs = menuMan.createActionItem ("macro_aboutme" ) "BS_Scripts_menu_aboutme" 
    subMenu.addItem bbs -1  

    separator = menuMan.createSeparatorItem() 
    subMenu.addItem separator -1 
)

----------------------------------------------------- 
fn deleting_previousMenu =
(
    subPath = "D:\\Program Files\\Autodesk\\BulletS" 
    dirArr2 = GetDirectories (subPath + "/*"); sort dirArr2
    if (dirArr2.count>0) then 
    ( 
        for m in dirArr2 do 
        (
            subSubPath2 = substring m 1 (m.count-1) 
            subSubMenuName = getFilenameFile subSubPath2
            if ((menuMan.findMenu subSubMenuName) != undefined) then 
            (
                menuMan.unRegisterMenu (menuMan.findMenu subSubMenuName) 
                menuMan.updateMenuBar() 
            )
        )
    )

    if ((menuMan.findMenu "BulletS") != undefined) then 
    (  
        menuMan.unRegisterMenu (menuMan.findMenu "BulletS")
        menuMan.updateMenuBar()
    ) 
)
deleting_previousMenu ()

--------------------creating menu
subMenu = menuMan.createMenu "BulletS" 
subPath = "D:\\Program Files\\Autodesk\\BulletS" 
--subPath=(GetDir #scripts)+"/BulleS" 
recursive_menu subMenu subPath
about_Menu subMenu
-----------------------updating menu 
mainMenuBar = menuMan.getMainMenuBar() 
subMenuItem = menuMan.createSubMenuItem "Test Menu" subMenu 
subMenuIndex = mainMenuBar.numItems() - 1 
mainMenuBar.addItem subMenuItem subMenuIndex 
menuMan.updateMenuBar() 