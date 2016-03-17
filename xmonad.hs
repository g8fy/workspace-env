import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Layout.ResizableTile
import System.IO
import XMonad.Layout.Spacing
import XMonad.Actions.GridSelect

myLayout = smartSpacing 8 $ ResizableTall 1 (3/100) (1/2) [] ||| tiled ||| Mirror tiled ||| Full
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

gsconfig2 colorizer = (buildDefaultGSConfig colorizer) { gs_cellheight = 90, gs_cellwidth = 160  }
greenColorizer = colorRangeFromClassName
                      black            -- lowest inactive bg
                      (0x70,0xFF,0x70) -- highest inactive bg
                      (0x44,0xAA,0xCC) -- active bg
                      white            -- inactive fg
                      white            -- active fg
   where black = minBound
         white = maxBound


main = do
    xmonad $ defaultConfig
        { 
        terminal           	 = "urxvtc"
				, borderWidth        = 1
        , normalBorderColor  = "black"
--        , normalBorderColor  = "#3780be"
        , focusedBorderColor = "grey" 
--        , focusedBorderColor = "#91c7f5" 

				, manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = myLayout
         } `additionalKeys` myKeys
      
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]
 
myKeys =
  		[ ((mod1Mask .|. shiftMask, xK_x), spawn "xscreensaver-command -lock")
				, ((mod1Mask, xK_a), sendMessage MirrorShrink)
 				, ((mod1Mask, xK_z), sendMessage MirrorExpand)
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
				,((mod1Mask, xK_g), goToSelected  $ gsconfig2 greenColorizer)
      ]
			++
      [((m .|. mod1Mask, k), windows $ f i) -- Replace 'mod1Mask' with your mod key of choice.
         | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
          , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
			]           
      ++
    	[((m .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust (windows . f)) -- Replace 'mod1Mask' with your mod key of choice.
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [1,0,2] -- was [0..] *** change to match your screen order ***
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
			] 
