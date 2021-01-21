import XMonad
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig

myTerminal = "st"
myModMask = mod4Mask -- Win key or Super_L
myBorderWidth = 0 -- Don't need 'em
myWebBrowser = "firefox"

main = do
    xmonad $ def
      { terminal = myTerminal
      , modMask = myModMask
      , borderWidth = myBorderWidth
      } `additionalKeys`
        [ ((0,  xF86XK_AudioLowerVolume), spawn "amixer set Master 2%-")
        , ((0,  xF86XK_AudioRaiseVolume), spawn "amixer set Master 2%+")
        , ((myModMask .|. shiftMask, xK_b), spawn myWebBrowser)
        , ((myModMask .|. shiftMask, xK_d), spawn "discord")
        , ((myModMask .|. shiftMask, xK_x), spawn "slock")
        ]
