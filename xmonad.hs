import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Layout.ResizableTile
import System.IO
import Data.List
import XMonad.Layout.Spacing
import XMonad.Actions.GridSelect
import XMonad.Layout.ShowWName
import XMonad.Layout.IndependentScreens
import XMonad.Layout.NoBorders
import XMonad.Util.WorkspaceCompare

main = do 
--	wsBar <- spawnPipe myWsBar
	xmonad $ myConf{
        workspaces = myWorkspaces
        , modMask = mod1Mask
        , terminal = "urxvt"
				, borderWidth        = 0
        , normalBorderColor  = "grey"
        , focusedBorderColor = "orange" 
        , layoutHook  = avoidStruts $ showWName myLayout
--				, logHook     = myLogHook wsBar
				 } `additionalKeys` myKeys

myConf = defaultConfig {
	manageHook = manageDocks <+> manageHook defaultConfig
  , workspaces = myWorkspaces
}

myLayout = smartSpacing 8 $ ResizableTall 1 (3/100) (1/2) [] ||| tiled ||| Mirror tiled ||| noBorders Full
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

myLogHook h    = dynamicLogWithPP $ wsPP{ ppOutput = hPutStrLn h }
myWsBar        = "xmobar -x 1"
wsPP = xmobarPP { ppOrder               = \(ws:l:t:_)   -> [ws]
							 , ppCurrent = xmobarColor "#f8f8f8" "DodgerBlue4" . wrap " " " "
               , ppVisible = xmobarColor "#f8f8f8" "LightSkyBlue4" . wrap " " " "
               , ppUrgent  = xmobarColor "#f8f8f8" "red4" . wrap " " " " . xmobarStrip
               , ppLayout  = wrap "" "" . xmobarColor "DarkOrange" "" . wrap " [" "] "
               , ppTitle   = xmobarColor "#61ce3c" "" . shorten 50
               , ppWsSep               = " "
               , ppSep                 = " "
							 , ppSort =  getSortByTag
                 }
        where
                currentWsIndex w        = case (elemIndex w myWorkspaces) of
                        Nothing         -> "1"
                        Just n          -> show (n+1)

gsconfig2 colorizer = (buildDefaultGSConfig colorizer) { gs_cellheight = 90, gs_cellwidth = 160  }
greenColorizer = colorRangeFromClassName
                      black            -- lowest inactive bg
                      (0x70,0xFF,0x70) -- highest inactive bg
                      (0x44,0xAA,0xCC) -- active bg
                      white            -- inactive fg
                      white            -- active fg
   where black = minBound
         white = maxBound

myWorkspaces = withScreens 2 ["1[code]","2[web]","3[vm]","4[terminal]","5[tools]","6[graphic]","7[social]","8[video]","9[audio]"]
 
myKeys =
  		[ ((mod1Mask .|. shiftMask, xK_x), spawn "xscreensaver-command -lock")
				, ((mod1Mask, xK_a), sendMessage MirrorShrink)
 				, ((mod1Mask, xK_z), sendMessage MirrorExpand)
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
				,((mod1Mask, xK_g), goToSelected  $ gsconfig2 greenColorizer)
      ]
			++
			[
         -- workspaces are distinct by screen
        ((m .|. mod1Mask, k), windows $ onCurrentScreen f i)
          | (i, k) <- zip (workspaces' myConf) [xK_1 .. xK_9]
          , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
			]
      ++
			[
         -- swap screen order
        ((m .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust
        (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0,1,2]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
			]
