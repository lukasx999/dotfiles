

#############################
#                           #
#      ____  __  _ __       #
#     / __ \/ /_(_) /__     #
#    / / / / __/ / / _ \    #
#   / /_/ / /_/ / /  __/    #
#   \___\_\__/_/_/\___/     #
#                           #
#############################
#                           #
#        config by          #
#        lukasx999          #
#                           #
#############################



#    _                            _       
#   (_)_ __ ___  _ __   ___  _ __| |_ ___ 
#   | | '_ ` _ \| '_ \ / _ \| '__| __/ __|
#   | | | | | | | |_) | (_) | |  | |_\__ \
#   |_|_| |_| |_| .__/ \___/|_|   \__|___/
#               |_|                       


from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal, send_notification

#adding qtile extra repo (install from AUR/PIP)
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
#from qtile_extras.widget.decorations import BorderDecoration
from qtile_extras.widget.decorations import PowerLineDecoration

from colorschemes import colors # colorschemes.py







#        _       __             _ _                           
#     __| | ___ / _| __ _ _   _| | |_    __ _ _ __  _ __  ___ 
#    / _` |/ _ \ |_ / _` | | | | | __|  / _` | '_ \| '_ \/ __|
#   | (_| |  __/  _| (_| | |_| | | |_  | (_| | |_) | |_) \__ \
#    \__,_|\___|_|  \__,_|\__,_|_|\__|  \__,_| .__/| .__/|___/
#                                            |_|   |_|        



#terminal   = guess_terminal()
mod         = "mod4" # SUPER
terminal    = "kitty"
#terminal    = "alacritty"
#browser     = "google-chrome-stable"
browser     = "firefox"
browser_alt = "librewolf"
togglecomp  = "/home/lukas/scripts/togglecomp"
chwallpaper = "/home/lukas/scripts/selwallpaper"
run         = "rofi -show drun"
#lock        = "slock"
lock        = "betterlockscreen -l blur"
screenshot  = "flameshot gui"

#comp_on     = "picom -b"
#comp_off    = "pkill picom"

comp_on     = ""
comp_off    = ""


"""
if qtile.core.name == "x11":
    term = "urxvt"
elif qtile.core.name == "wayland":
    term = "foot"
"""

from libqtile.backend.wayland import InputConfig

wl_input_rules = {
    "1267:12377:ELAN1300:00 04F3:3059 Touchpad": InputConfig(left_handed=True),
    "*": InputConfig(left_handed=True, pointer_accel=True),
    "type:keyboard": InputConfig(kb_options="ctrl:nocaps,compose:ralt", kb_layout="de"),
}





#     __                  _   _                 
#    / _|_   _ _ __   ___| |_(_) ___  _ __  ___ 
#   | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
#   |  _| |_| | | | | (__| |_| | (_) | | | \__ \
#   |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/




@lazy.function # Minimize all windows
def minimize_all(qtile):
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()


@lazy.function # Toggle between 2 layouts
def toggle_max(qtile):
    current_layout_name = qtile.current_group.layout.name
    if current_layout_name == 'columns':
        qtile.current_group.layout = 'max'
    elif current_layout_name == 'max':
        qtile.current_group.layout = 'columns'


@lazy.function # Move window to next group
def window_to_next_group(qtile):
    i = qtile.groups.index(qtile.current_group)
    if qtile.current_window is not None and i != 8: #6
        qtile.current_window.togroup(qtile.groups[i + 1].name, switch_group=True)
        #qtile.current_screen.toggle_group(qtile.groups[i + 1])

@lazy.function # Move window to previous group
def window_to_prev_group(qtile):
    i = qtile.groups.index(qtile.current_group)
    if qtile.current_window is not None and i != 0:
        qtile.current_window.togroup(qtile.groups[i - 1].name, switch_group=True)
        #qtile.current_screen.toggle_group(qtile.groups[i - 1])





@hook.subscribe.focus_change #Bring all floating windows of the group to front
def float_to_front(qtile):
    for window in qtile.currentGroup.windows:
        if window.floating:
            window.cmd_bring_to_front()





@hook.subscribe.client_new # Move specific windows to groups when they are launched
def new_client(client):
    if client.name == "Steam":
        client.togroup("4")
    if client.name == "Friends - Discord":
        client.togroup("6")



# Gaming

# when a game launches, move to to WS5 and disable compositor
# when the games gets closed, switch back to Steam on WS4 and turn on comp again





@hook.subscribe.client_new
def game_launched(client):
    if client.name == "ULTRAKILL" or client.name == "Wizard of Legend" or client.name == "God of War" or client.name == "ELDEN RING":
        client.togroup("5", switch_group=True)
        qtile.spawn(comp_off)

@hook.subscribe.client_killed
def game_closed(client):
    if client.name == "ULTRAKILL" or client.name == "Wizard of Legend" or client.name == "God of War" or client.name == "ELDEN RING":
        #qtile.current_screen.set_group(qtile.current_screen.previous_group)
        qtile.current_screen.set_group(qtile.current_screen.toggle_group("4"))
        qtile.spawn(comp_on)

@hook.subscribe.client_focus # DOES NOT WORK ON DESKTOP
def client_focus(client):
    if client.name == "ULTRAKILL" or client.name == "Wizard of Legend" or client.name == "God of War" or client.name == "ELDEN RING":
        qtile.spawn(comp_off)
    else:
        qtile.spawn(comp_on)

@hook.subscribe.layout_change
def layout_change(layout, group):
    qtile.spawn(comp_on)











#@hook.subscribe.startup_once # Autostart script
#def autostart_once():
    #subprocess.run('/home/lukas/.config/qtile/autostart.sh')



#    _              _     _           _     
#   | | _____ _   _| |__ (_)_ __   __| |___ 
#   | |/ / _ \ | | | '_ \| | '_ \ / _` / __|
#   |   <  __/ |_| | |_) | | | | | (_| \__ \
#   |_|\_\___|\__, |_.__/|_|_| |_|\__,_|___/
#             |___/                         


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html



    # Switching between windows

    Key([mod], "j", lazy.layout.next(),                            desc="Move window focus to next window"),
    Key([mod], "k", lazy.layout.previous(),                        desc="Move window focus to previous window"),

    #Key([mod], "j", lazy.group.next_window(),                      desc="Move window focus to next window"),
    #Key([mod], "k", lazy.group.prev_window(),                      desc="Move window focus to previous window"),

    Key([mod], "h", lazy.layout.left(),                            desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(),                           desc="Move focus to right"),
    #Key([mod], "j", lazy.layout.down(),                           desc="Move focus down"),
    #Key([mod], "k", lazy.layout.up(),                             desc="Move focus up"),

    # Moving to next/prev group

    Key([mod], "Period", lazy.screen.next_group(skip_empty=False), desc="Move to the group on the right"),
    Key([mod], "Comma", lazy.screen.prev_group(skip_empty=False),  desc="Move to the group on the left"),
    Key([mod, "shift"], "Period", window_to_next_group(),          desc="Move window to the group on the left"),
    Key([mod, "shift"], "Comma", window_to_prev_group(),           desc="Move window to the group on the left"),


    # Moving windows

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),           desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),          desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),           desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(),             desc="Move window up"),

    # Resizing windows

    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.decrease_ratio(),
        desc="Grow window to the left"
        ),

    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.increase_ratio(),
        desc="Grow window to the right"
        ),

    Key([mod, "control"], "j", lazy.layout.grow_down(),            desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(),              desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(),                       desc="Reset all window sizes"),

    # For Tile layout
    #Key([mod], "l", lazy.layout.increase_ratio(),                  desc="Increase master window space"),
    #Key([mod], "h", lazy.layout.decrease_ratio(),                  desc="Decrease master window space"),



    # Toggle between split and unsplit sides of stack.
    #Key([mod, "shift"], "Return", lazy.layout.toggle_split(),      desc="Toggle between split and unsplit sides of stack"),



    # Launching Programs

    Key([mod], "Return", lazy.spawn(terminal),                     desc="Launch terminal"),
    Key([mod], "y", lazy.spawn(run),                               desc="Launch run prompt"),
    Key([mod], "e", lazy.spawn(screenshot),                        desc="Take screenshot"),
    Key([mod, "shift"], "e", lazy.spawn(togglecomp),               desc="Toggle compositor"),
    Key([mod, "shift"], "w", lazy.spawn(chwallpaper),              desc="Change wallpaper"),
    Key([mod], "q", lazy.spawn(browser),                           desc="Launch browser"),
    Key([mod, "shift", "control"], "l", lazy.spawn(lock),          desc="Lock the screen"),

    # Closing windows

    Key([mod, "shift"], "c", lazy.window.kill(),                   desc="Kill focused window"),

    # Toggling between layouts

    Key([mod], "Tab", lazy.next_layout(),                          desc="Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(),                 desc="Toggle between layouts"),

    # Toggling layouts

    Key([mod], "a", lazy.window.toggle_fullscreen(),               desc="Toggle fullscreen on the focused window"),
    Key([mod], "Space", lazy.window.toggle_floating(),             desc="Toggle floating on the focused window"),
    Key([mod], "s", toggle_max(),                                  desc="toggle max layout"),
    Key([mod], "m", minimize_all(),                                desc="Minimize all windows"),

    # Qtile Management

    Key([mod, "control"], "r", lazy.reload_config(),               desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.shutdown(),                      desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),                               desc="Spawn a command using a prompt widget"),

    Key([mod], "b",
        lazy.hide_show_bar("top"),
        lazy.hide_show_bar("bottom"),
        desc="Toggle all bars"
        ),
    Key([mod], "v", lazy.hide_show_bar("bottom"),                  desc="Spawn a command using a prompt widget"),

    # Scratchpads

    Key([mod], "w", lazy.group['scratchpad'].dropdown_toggle('term'), desc="toggle scratchpad (terminal)"),
    Key([mod], "t", lazy.group['scratchpad'].dropdown_toggle('web'),  desc="toggle scratchpad (web)"),
]





#     __ _ _ __ ___  _   _ _ __  ___ 
#    / _` | '__/ _ \| | | | '_ \/ __|
#   | (_| | | | (_) | |_| | |_) \__ \
#    \__, |_|  \___/ \__,_| .__/|___/
#    |___/                |_|        


groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
#group_labels = ["󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃",]
group_labels = ["", "", "", "󰓓", "󰊗", "󰙯", "", "", "",] #      󰖟 󰏃
#group_labels = ["", "", "", "", "", "", "", "", "",]
#group_labels = ["", "", "", "", "", "", "", "", "",]
#group_layouts = ["tile", "tile", "tile", "tile", "tile", "tile", "tile", "tile", "tile"]
group_layouts = ["columns", "columns", "columns", "columns", "columns", "columns", "columns", "columns", "columns"]





for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))


#groups = [Group(i) for i in "123456789"]
for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )


#Scratchpads

groups.append(ScratchPad('scratchpad', [
        DropDown(
            "term",
            terminal, # "kitty"
            x                  = 0.05,
            y                  = 0.02,
            opacity            = 1,
            width              = 0.90,
            height             = 0.6,
            on_focus_lost_hide = False,
            ),
        DropDown(
            "web",
            browser_alt, # "librewolf"
            x                  = 0.05,
            y                  = 0.02,
            opacity            = 1,
            width              = 0.90,
            height             = 0.6,
            on_focus_lost_hide = False,
            ),
    ]))


#    _                         _       
#   | | __ _ _   _  ___  _   _| |_ ___ 
#   | |/ _` | | | |/ _ \| | | | __/ __|
#   | | (_| | |_| | (_) | |_| | |_\__ \
#   |_|\__,_|\__, |\___/ \__,_|\__|___/
#            |___/                     


layout_default = {
    "border_normal": colors["grey"], #363a4f
    "border_focus":  colors["purple_light"], #8aadf4
    }


layouts = [
     #layout.Stack(num_stacks=2),
     #layout.Bsp(),
     #layout.Matrix(),
     #layout.MonadWide(),
     layout.Columns(
         **layout_default,
        #margin                  = [10, 10, 0, 10],
        margin                  = 10,
        border_width            = 2, #2
        margin_on_single        = 10,
        #margin_on_single        = [10, 10, 0, 10],
        grow_amount             = 10,
        border_on_single        = False,
        insert_position         = 1,
        num_columns             = 2,
        split                   = True,
        fair                    = False,
        wrap_focus_columns      = True,
        wrap_focus_rows         = True,
        wrap_focus_stacks       = True,
         ),
     layout.Tile(
         **layout_default,
        #margin                 = 10,
        margin                  = [5, 5, 5, 5],
        border_width            = 2,
        add_after_last          = True,
        margin_on_single        = True,
        border_on_single        = False,
        ratio                   = 0.5,
        ratio_increment         = 0.05, #0.05
        master_lenght           = 1, # Number of master clients
        expand                  = True,
        shift_windows           = False,
         ),
    layout.Max(
        **layout_default,
        border_width            = 0,
        margin                  = 10,
        only_focused            = True,
        ),
    layout.Floating(
        border_normal           = colors["grey"],       #363a4f
        border_focus            = colors["blue_light"], #7dc4e4
        border_width            = 2,
        fullscreen_border_width = 0,
        max_border_width        = 0,
        ),
     #layout.MonadTall(),
     #layout.RatioTile(),
     #layout.TreeTab(),
     #layout.VerticalTile(),
     #layout.Zoomy(),
]




#    _                
#   | |__   __ _ _ __ 
#   | '_ \ / _` | '__|
#   | |_) | (_| | |   
#   |_.__/ \__,_|_|   


endofbar = {
    "padding":     0,
    "fontsize":    32, # 50 for slash, 28 for rounded edge
    "background":  colors["semi_transparent"],
    "foreground":  colors["grey"],
    }


deco = {
    "decorations": [
        RectDecoration(
            colour      = colors["grey_light"],   #464d64
            line_colour = colors["grey_lighter"], #5b6078
            #radius      = 10, # 13 -- 12 for 40 bar height -- 12
            radius      = 8, # 13 -- 12 for 40 bar height -- 12
            clip        = False, # Line mode in groupbox wont work unless this is False
            filled      = True,
            padding_y   = 6, #5 -- 7 for 40 bar height
            padding_x   = 2, #0
            extrawidth  = 0,
            group       = False,
            line_width  = 1, # 1
            ),
            ],
        }


widget_defaults = dict(
    #fontshadow = '#363a4f',
    font       = "JetBrainsMono Nerd Font",
    fontsize   = 16, # 18 for 40 bar height
    foreground = colors["white"], #cad3f5
    background = colors["grey"],  #363a4f
    fmt="<b>{}</b>",
    #background = '#0000007f',
    #opacity   = 0,
    #padding   = 3,
    padding    = 15,
)

extension_defaults = widget_defaults.copy()

def txtparse(text):
    for string in [" - Google Chrome"]:
        text = text.replace(string, "")
        return text

screens = [
    Screen(
        top=bar.Bar(
            [




                ########
                # Left #
                ########

                widget.TextBox(
                    #**endofbar,
                    padding    =  0,
                    fontsize   = 32, # 50 for slash, 28 for rounded edge
                    foreground =   colors["grey"],
                    text       = "", #   
                    background = colors["transparent"],
                    ),
                widget.TextBox(" ", padding = 0),
                widget.CPU(
                    **deco,
                    foreground      = colors["blue"], #7dc4e4
                    format          = '  {freq_current}GHz {load_percent}%', # 
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("kitty -e gotop")},
                    ),

                widget.TextBox(" ", padding = 0),
                widget.ThermalSensor(
                    **deco,
                    foreground       = colors["blue_light"],   #c6a0f6
                    foreground_alert = colors["red"],    #ed8796
                    format           = ' {temp:.1f}{unit}',
                    tag_sensor       = "Package id 0",
                    threshold        = 70,
                    update_interval  = 2,
                    mouse_callbacks  = {'Button1': lambda: qtile.cmd_spawn("kitty -e watch sensors")},
                    ),

                widget.TextBox(" ", padding = 0),
                widget.NvidiaSensors(
                    **deco,
                    format           = '  {temp}°C', #  󰾲
                    foreground       = colors["blue_lighter"], #7dc4e4
                    foreground_alert = colors["red"],    #ed8796
                    threshold        = 70,
                    update_interval  = 2,
                    mouse_callbacks  = {'Button1': lambda: qtile.cmd_spawn("kitty -e watch nvidia-smi")},
                        ),
                widget.TextBox(" ", padding = 0),
                widget.Memory(
                    **deco,
                    foreground      = colors["cyan"], #91d7e3
                    #format          = '  {MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}',
                    format          = '  {MemUsed:.0f}{mm}', # 
                    measure_mem     = 'G',
                    measure_swap    = 'G',
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("kitty -e htop")},
                    ),
                widget.Prompt(),
                widget.TextBox(" ", padding = 0),
                widget.TextBox(
                    #**endofbar,
                    text = "", #   
                    foreground = colors["grey"],
                    background = colors["grey_light"],
                    #background = "#0000000f",
                    padding    = 0,
                    fontsize   = 32,
                    ),
                widget.TextBox(
                    text       = "", #   
                    foreground = colors["grey_light"],
                    #foreground = "#0000000f",
                    background = colors["semi_transparent"],
                    padding    = 0,
                    fontsize   = 32,
                    ),
                widget.TextBox(" ", padding = 0, background = colors["semi_transparent"]),
                widget.TaskList(
                    #**deco,
                    foreground           = colors["skin_light"], #f4dbd6
                    border               = colors["grey_light"], #464d64
                    #border               = colors["transparent"], #464d64
                    background           = colors["semi_transparent"], #464d64
                    #background           = colors["grey"], #464d64
                    unfocused_border     = colors["grey"],       #363a4f
                    urgent_border        = colors["red"],        #ed8796
                    theme_mode           = "preferred",
                    theme_path           = "/usr/share/icons/Papirus/64x64/apps/",
                    fontsize             = 20,
                    icon_size            = 20, #25
                    padding_y            = 2,
                    padding_x            = 0,
                    spacing              = 10,
                    rounded              = True,
                    txt_floating         = '🗗',
                    txt_maximized        = '🗖',
                    txt_minimized        = '🗕',
                    markup_focused       = "", # "{}"
                    markup_normal        = "",
                    markup_floating      = "🗗",
                    markup_minimized     = "🗕",
                    markup_maximized     = "🗖",
                    urgent_alert_method  = 'border',
                    #title_width_method  = 'uniform',
                    window_name_location = False,
                    highlight_method     = "block", #border, block
                    #icon_size           = 3,
                    mouse_callbacks      = {'Button2': lazy.window.kill()},
                    ),
                widget.Spacer(background = colors["semi_transparent"]),



                ##########
                # Center #
                ##########

                widget.TextBox(
                    text       = "", #   
                    foreground = colors["grey_light"],
                    background = colors["semi_transparent"],
                    padding    = 0,
                    fontsize   = 32,
                    ),
                widget.TextBox(
                    #**endofbar,
                    text = "", #   
                    foreground = colors["grey"],
                    background = colors["grey_light"],
                    padding    = 0,
                    fontsize   = 32,
                    ),
                widget.TextBox(" ", padding = 0),
                widget.TextBox(
                    fontsize        = 20,
                    padding         = 10,
                    text            = "󰣇", #  󰣇
                    mouse_callbacks = {
                        'Button1': lambda: qtile.cmd_spawn(run),
                        'Button2': lambda: qtile.cmd_spawn(terminal),
                        },
                    ),

                widget.TextBox(" ", padding = 0),
                widget.TextBox(
                    text       = "", #   
                    foreground = colors["grey_light"],
                    padding    = 0,
                    fontsize   = 20,
                    ),
                widget.GroupBox( # GroupBox2
                    #**deco,
                    decorations = [
                        RectDecoration(
                            colour      = colors["grey_light"],   #464d64
                            line_colour = colors["grey_lighter"], #5b6078
                            radius      = 0, # 13 -- 12 for 40 bar height
                            clip        = False, # Line mode in groupbox wont work unless this is False
                            filled      = True,
                            padding_y   = 5, #5 -- 7 for 40 bar height
                            padding_x   = 0,
                            extrawidth  = 0,
                            group       = False,
                            line_width  = 0, # 1
                            ),
                            ],
                    fmt                        = '{}',
                    toggle                     = True,
                    borderwidth                = 3, # 3 width of line
                    hide_unused                = False,
                    center_aligned             = True,
                    disable_drag               = True,
                    fontsize                   = 17, # 20 -- 15
                    spacing                    = 0, # 5
                    padding                    = 10, # 5
                    margin                     = 5, # only for line mode
                    rounded                    = True,
                    highlight_method           = 'line', #block, line, text
                    urgent_alert_method        = 'text',
                    #highlight_color           = '#494d647f',
                    highlight_color            = '#00000000',
                    use_mouse_wheel            = True,
                    fontshadow                 = colors["grey_lighter"], #5b6078
                    active                     = colors["white"],        #cad3f5
                    inactive                   = colors["grey"],         #363a4f
                    block_highlight_text_color = colors["blue_light"],         #8aadf4
                    urgent_text                = colors["red"],          #ed8796
                    this_current_screen_border = colors["blue"],         #8aadf4
                    this_screen_border         = colors["grey_light"],   #494d64
                    ),
                widget.TextBox(
                    text       = "", #   
                    foreground = colors["grey_light"],
                    padding    = 0,
                    fontsize   = 20,
                    ),
                widget.TextBox(" ", padding = 0),
                widget.CurrentLayoutIcon(
                    decorations = [
                        RectDecoration(
                            colour    = colors["grey_light"], #464d64
                            radius    = 5,
                            filled    = True,
                            padding_y = 5,
                            padding_x = 0)
                            ],
                    scale   = 0.5,
                    padding = 5,
                    ),
                widget.TextBox(" ", padding = 0),
                widget.TextBox(
                    #**endofbar,
                    text = "", #   
                    foreground = colors["grey"],
                    background = colors["grey_light"],
                    padding    = 0,
                    fontsize   = 32,
                    ),
                widget.TextBox(
                    text       = "", #   
                    foreground = colors["grey_light"],
                    background = colors["semi_transparent"],
                    padding    = 0,
                    fontsize   = 32,
                    ),
                widget.Spacer(background = colors["semi_transparent"]),




                #########
                # Right #
                #########

                widget.TextBox(
                    text       = "", #   
                    foreground = colors["grey_light"],
                    background = colors["semi_transparent"],
                    padding    = 0,
                    fontsize   = 32,
                    ),
                widget.TextBox(
                    #**endofbar,
                    text = "", #   
                    foreground = colors["grey"],
                    background = colors["grey_light"],
                    padding    = 0,
                    fontsize   = 32,
                        ),
                #widget.Systray(),
                widget.StatusNotifier(
                    # NM APPLET DOESNT WORK
                    background = colors["grey"],
                    menu_offset_y = 15,
                    opacity = 0.9,
                    hide_after = 0.5,
                    icon_theme = "Papirus",
                    ),
                widget.TextBox(" ", padding = 0),
                widget.CheckUpdates(
                    **deco,
                    #foreground = '#91d7e3',
                    colour_have_updates = colors["yellow"], #91d7e3
                    colour_no_updates   = colors["white"],  #cad3f5
                    display_format      = '  {updates}',
                    distro              = 'Arch_yay', #'Arch'
                    no_update_string    = '  0', #comment out to disappear
                    execute             = 'kitty -e watch pacman --version',
                    update_interval     = 60,
                ),
                widget.TextBox(" ", padding = 0),
                widget.Wttr(
                    **deco,
                    foreground      = colors["orange"],
                    format          = '  %f', # 1
                    lang            = 'en',
                    units           = 'm',
                    update_interval = 600,
                    user_agent      = 'Qtile',
                    ),
                widget.TextBox(" ", padding = 0),
                widget.Clock(
                    **deco,
                    foreground = colors["red_light"], #ed8796
                    format     = "  %d.%m.%Y",
                    ),
                widget.TextBox(" ", padding = 0),
                widget.Clock(
                    **deco,
                    foreground = colors["red"], #f5a97f
                    format     = '  %H:%M',
                    #fmt="  <u><b>{}</b></u>",
                    ),
                widget.TextBox(" ", padding = 0),
                widget.TextBox(
                    #**endofbar,
                    text       = "", #     
                    padding    =  0,
                    fontsize   = 32, # 50 for slash, 28 for rounded edge -- 32
                    foreground = colors["grey"],
                    background = colors["transparent"],
                    ),
            ],
            36, #36 -- bar height -- 40 for transparency
            margin       = [5, 5, 0, 5],
            background   = colors["transparent"], #00000000
            reserve      = True,
            #border_color = colors["grey_light"], #494d64
            #border_width = [0, 0, 3, 0],
        ),

        #bottom=bar.Gap(size = 0,)

        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
         x11_drag_polling_rate = 60,
    ),
]






#         _       
#     ___| |_ ___ 
#    / _ \ __/ __|
#   |  __/ || (__ 
#    \___|\__\___|




# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules  = []  # type: list
follow_mouse_focus = True
bring_front_click  = False # False "floating_only"
floats_kept_above  = True
cursor_warp        = False
floating_layout    = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class = "confirmreset"),  # gitk
        Match(wm_class = "makebranch"),  # gitk
        Match(wm_class = "maketag"),  # gitk
        Match(wm_class = "ssh-askpass"),  # ssh-askpass
        Match(title    = "branchdialog"),  # gitk
        Match(title    = "pinentry"),  # GPG key password entry

        #custom rules
        Match(wm_class = "pavucontrol"),  # ssh-askpass
        Match(wm_class = "pcmanfm"),  # ssh-askpass
        Match(wm_class = "openrgb"),  # ssh-askpass
        Match(wm_class = "thunar"),  # ssh-askpass
        Match(wm_class = "lxappearance"),  # ssh-askpass
        Match(wm_class = "nsxiv"),  # ssh-askpass
        Match(wm_class = "VirtualBox Manager"),  # ssh-askpass
        Match(title    = "Steam Settings"),  # GPG key password entry
        Match(wm_class = "xzoom x2"),  # ssh-askpass
        #Match(title   = "Friends List"),  # GPG key password entry
    ],
    border_normal           = colors["grey"],       #363a4f
    border_focus            = colors["blue_light"], #7dc4e4
    border_width            = 2,
    fullscreen_border_width = 0,
    max_border_width        = 0,
)
auto_fullscreen            = True
focus_on_window_activation = "smart"
reconfigure_screens        = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize  = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
#wmname = "LG3D"
wmname = "Qtile"
