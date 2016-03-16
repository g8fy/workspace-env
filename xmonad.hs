import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.ResizableTile
import System.IO
import XMonad.Layout.Spacing

myLayout = smartSpacing 8 $ ResizableTall 1 (3/100) (1/2) [] ||| tiled ||| Mirror tiled ||| Full
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

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
         } `additionalKeys`
        [ ((mod1Mask .|. shiftMask, xK_x), spawn "xscreensaver-command -lock")
				, ((mod1Mask, xK_a), sendMessage MirrorShrink)
 				, ((mod1Mask, xK_z), sendMessage MirrorExpand)
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
         ] 
