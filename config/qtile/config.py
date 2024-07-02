


# Qtile libraries
from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal, send_notification
from libqtile.config import Key, KeyChord

# Additional Python libraries
import os
import re
import sys
import subprocess
from getpass import getuser



mod = "mod4"
# terminal = guess_terminal()
# terminal = "kitty"
terminal = "alacritty"
browser = "firefox"
launcher = "rofi -show drun"
screenshot = f"flameshot gui --clipboard --path /home/{getuser()}/Pictures/Screenshots"
zoom = "boomer"
lock = "betterlockscreen --lock"

draw_toggle = "gromit-mpx --toggle"
draw_clear = "gromit-mpx --clear"
draw_visibility = "gromit-mpx --visibility"
draw_undo = "gromit-mpx --undo"
draw_redo = "gromit-mpx --redo"





### Custom functions ###

@lazy.function # Move window to next group
def window_to_next_group(qtile):
    i = qtile.groups.index(qtile.current_group)
    if qtile.current_window is not None and i != 8: #6
        qtile.current_window.togroup(qtile.groups[i + 1].name, switch_group=True)

@lazy.function # Move window to previous group
def window_to_prev_group(qtile):
    i = qtile.groups.index(qtile.current_group)
    if qtile.current_window is not None and i != 0:
        qtile.current_window.togroup(qtile.groups[i - 1].name, switch_group=True)


# Startup script
# @hook.subscribe.startup_once
# def autostart_once():
#     subprocess.run('/home/lukas/.config/qtile/autostart.sh')





@hook.subscribe.client_new # Move specific windows to groups when they are launched
def new_client(client):
    match client.name:
        case "Steam":
            client.togroup("4")
        case "Spotify":
            client.togroup("3")



games = [
    "ULTRAKILL",
    "Wizard of Legend",
    "God of War",
    "ELDEN RING",
]


# Gaming

# @hook.subscribe.client_new
# def game_launched(client):
#     if client.name in games:
#         client.togroup("5", switch_group=True)
        # qtile.spawn("pkill picom")


# @hook.subscribe.client_killed
# def game_closed(client):
#     if client.name in games:
#         qtile.current_screen.set_group(qtile.current_screen.toggle_group("4"))
        # qtile.spawn("picom -b")





keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.next(), desc="Move focus to the next window"),
    Key([mod], "k", lazy.layout.previous(), desc="Move focus to the previous window"),

    # Moving to Next / Prev group
    Key([mod], "Period", lazy.screen.next_group(skip_empty=False), desc="Move to the group on the right"),
    Key([mod], "Comma", lazy.screen.prev_group(skip_empty=False),  desc="Move to the group on the left"),
    Key([mod, "shift"], "Period", window_to_next_group(),          desc="Move window to the group on the left"),
    Key([mod, "shift"], "Comma", window_to_prev_group(),           desc="Move window to the group on the left"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),





    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "r", lazy.spawn(launcher), desc="Launch app launcher"),
    Key([mod], "s", lazy.spawn(screenshot), desc="Take screenshot"),
    Key([mod], "q", lazy.spawn(browser), desc="Launch browser"),
    Key([mod], "a", lazy.spawn(zoom), desc="Launch zoom"),

    Key([mod, "shift", "control"], "l", lazy.spawn(lock), desc="lock the screen"),

    KeyChord([mod], "g", [
        Key([], "t", lazy.spawn(draw_toggle), desc="Toggle drawing mode"),
        Key([], "c", lazy.spawn(draw_clear), desc="Clear screen of drawings"),
        Key([], "v", lazy.spawn(draw_visibility), desc="Toggle drawing visibility"),
        Key([], "u", lazy.spawn(draw_undo), desc="undo"),
        Key([], "r", lazy.spawn(draw_redo), desc="redo"),
    ]),






    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Toggle between layouts"),



    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),

    Key([mod], "w", lazy.group['scratchpad'].dropdown_toggle('term'), desc="toggle scratchpad (terminal)"),




    Key([mod], "b", lazy.hide_show_bar("top"), desc="Toggle bar"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),

    Key([mod], "Space", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),




]



### Groups ###


# Old method
# groups = [Group(i) for i in "123456789"]



groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
# group_labels = ["󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃",]
group_labels = ["" for i in range(9)]  #  
group_layouts = ["columns", "columns", "columns", "columns", "columns", "columns", "columns", "columns", "columns"]


for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))
















for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )













# Scratchpads
groups.append(ScratchPad('scratchpad', [
        DropDown(
            "term",
            terminal,
            x                  = 0.05,
            y                  = 0.02,
            opacity            = 1,
            width              = 0.90,
            height             = 0.6,
            on_focus_lost_hide = False,
            ),
    ]))


















layouts = [

    layout.Columns(
        # border_focus_stack=["#d75f5f", "#8f3d3d"],
        border_focus="#9aa5ce",
        border_normal="#1a1b26",
        border_width=2,
        margin=0,  # Gaps
        margin_on_single=0,
        grow_amount=10,
        border_on_single=False,
        insert_position=1,
        split=True,
    ),

    layout.Max(
        border_width=0,
        margin=0,
        # only_focused=True,
    ),



    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    # font="JetBrains Mono Nerd Font",
    font="Roboto",
    # background="#000000",
    background="#1a1b26",
    foreground="#ffffff",
    # foreground="#c0caf5",
    fontsize=16,  # 12
    fmt="{}",
    padding=5,  # 3
)
extension_defaults = widget_defaults.copy()



screens = [
    Screen(
        top=bar.Bar(
            [


                # RAM
                widget.Memory(
                    format          = '   {MemUsed:.0f}{mm}',
                    measure_mem     = 'G',
                    measure_swap    = 'G',
                    ),


                # GPU
                widget.NvidiaSensors(
                    format           = '   {temp}°C',
                    threshold        = 70,
                    update_interval  = 2,
                        ),

                # CPU
                widget.ThermalSensor(
                    format           = ' {temp:.1f}{unit}',
                    tag_sensor       = "Package id 0",
                    threshold        = 70,
                    update_interval  = 2,
                    ),

                widget.CPU(
                    format = '   {load_percent}% @{freq_current}GHz', # 
                    ),


                # Spacer
                widget.Spacer(),

                # Run Prompt
                widget.Prompt(),



                # Layout
                widget.CurrentLayoutIcon(
                    scale = 0.6,
                ),

                # Group Box
                widget.GroupBox(
                    # active = '#ffffff',  # Active Group Font
                    active = '#c0caf5',
                    # background = '#000000',
                    borderwidth = 3,
                    center_aligned = True,
                    disable_drag = True,
                    # fmt = '<i>{}</i>',
                    fmt = '{}',
                    fontshadow = None,
                    fontsize = 30,
                    # foreground = '#ffffff',
                    hide_unused = False,
                    margin = 3,
                    markup = True,
                    rounded = True,
                    urgent_alert_method = 'text',
                    urgent_text = '#f7768e',
                    highlight_method = 'text',  # border, block, text, line
                    highlight_color = ['#000000', '#414868'],  # Only on line highlighting
                    this_current_screen_border = '#7aa2f7',
                ),


                # Window Count
                widget.WindowCount(
                    fmt = '{}',
                    foreground = '#cfc9c2',
                    markup = True,
                    text_format = '{num}  🗗',  # 🗗🗖
                    show_zero = True,
                ),

                # Spacer
                widget.Spacer(),

                # Task List
                # widget.TaskList(
                #     markup_focused = "",
                #     border = "#000000",
                #     stretch = True,
                # ),

                # Systray
                widget.Systray(),

                # Date
                widget.Clock(format = "%d.%m.%Y  "),

                # Time
                widget.Clock(format = '%H:%M  '),

            ],
            32,  # 24
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
        x11_drag_polling_rate = 180,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],

    border_normal           = "#1a1b26",
    border_focus            = "#e0af68",
    border_width            = 2,
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"
