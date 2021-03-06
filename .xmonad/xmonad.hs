import XMonad
import System.Exit
import XMonad.Hooks.SetWMName --to make matlab work
import XMonad.Actions.UpdatePointer --mouse follows focum
import XMonad.Hooks.ManageDocks --struts (xmobar)
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog --xmobar
import XMonad.Util.Run --safespawn
import XMonad.Layout.Grid
import qualified Data.Map as M --for keys konfig
import qualified XMonad.StackSet as W -- various window manipulations
data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)

myLayout = avoidStruts $ tiled ||| Full ||| Grid
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 6/100
--myManageHook :: ManageHook
-- myManageHook=composeAll [className=?"com-mathworks-util-PostVMInit" --> doFloat]
modm=mod4Mask
toggleStrutsKey arg = (modm,xK_b)

mykeys conf@arg =M.fromList $ [ 
       ((modm, xK_p)                  , spawn "exe=`dmenu_path_c | /home/john/.cabal/bin/yeganesh` && eval \"exec $exe\"")
    , ((modm .|. shiftMask, xK_Return), spawn "terminology" )
    , ((modm .|. controlMask, xK_Return), spawn "xterm -bg gray -e ssh -Y  node00" )
    , ((modm , xK_Menu), spawn "terminology --theme=mysolarized -e ssh -Y  headnode" )
    , ((modm .|. mod1Mask, xK_Return), spawn "xterm -bg NavajoWhite1 -e fsharpi" )

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
     , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm .|. shiftMask, xK_p     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
 --   , ((modMask .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    ++
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_r, xK_e, xK_q, xK_w] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
myManageHook = composeAll 
    [className =? "MPlayer" --> doShift "2:mplayer",
    className =? "Viewer0" --> doFloat]
myNormalBorderColor  = "#000000" --black
myFocusedBorderColor = "#ff0000" --red
myconfig =  defaultConfig {
      modMask           = mod4Mask           --winkey is magic
     , workspaces = ["1:dev","2:mplayer","3:web","4:comm","5:ham","6:tmp","7:dvi","8","9","0","-","="]
     , borderWidth      = 1                  --border size
     , startupHook      = setWMName "LG3D"   --magic hack for matlab
     , logHook          = updatePointer (Relative 0.5 0.5) --pointer follows focur
     , layoutHook       = myLayout
     , manageHook       = myManageHook
     , keys             = mykeys   
     , mouseBindings    = myMouseBindings
     , normalBorderColor= myNormalBorderColor
     , focusedBorderColor= myFocusedBorderColor}
  --   `additionalKeys` --use yeganesh instead of dmenu - automatically sorts entries based on usage which is quite nice
     
main =do
    safeSpawnProg "/home/john/dotfiles/dzlocal.sh"
    xmonad  $  myconfig
  --  xmonad =<< statusBar "" xmobarPP{ppOutput= \s->return()} toggleStrutsKey  myconfig
