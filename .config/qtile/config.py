# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

#adding qtile extra repo (install from AUR/PIP)
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.widget.decorations import BorderDecoration
from qtile_extras.widget.decorations import PowerLineDecoration


#setting default programs

mod = "mod4"
#terminal = guess_terminal()
terminal = "kitty"
browser = "google-chrome-stable"
togglecomp = "/home/lukas/scripts/togglecomp"
chwallpaper = "/home/lukas/scripts/selwallpaper"
run = "rofi -show drun"
lock = "slock"
screenshot = "flameshot gui"



#custom functions

@lazy.function #minimize all windows
def minimize_all(qtile):
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()


@lazy.function #toggle between 2 layouts
def toggle_max(qtile):
    current_layout_name = qtile.current_group.layout.name
    if current_layout_name == 'tile':
        qtile.current_group.layout = 'max'
    elif current_layout_name == 'max':
        qtile.current_group.layout = 'tile'

@lazy.function
def window_to_prev_group(qtile):
    i = qtile.groups.index(qtile.current_group)
    if qtile.current_window is not None and i != 0:
        qtile.current_window.togroup(qtile.groups[i - 1].name, switch_group=True)
        #qtile.current_screen.toggle_group(qtile.groups[i - 1])


@lazy.function
def window_to_next_group(qtile):
    i = qtile.groups.index(qtile.current_group)
    if qtile.current_window is not None and i != 8: #6
        qtile.current_window.togroup(qtile.groups[i + 1].name, switch_group=True)
        #qtile.current_screen.toggle_group(qtile.groups[i + 1])



keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    #Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    #Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    #Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    #Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    #Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    #cycling through windows like in dwm
    Key([mod], "j", lazy.layout.next(), desc="Move window focus to next window"),
    Key([mod], "k", lazy.layout.previous(), desc="Move window focus to previous window"),
    #Key([mod], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    #Key([mod], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod], "Period", lazy.screen.next_group(skip_empty=False), desc="Move to the group on the right"),
    Key([mod], "Comma", lazy.screen.prev_group(skip_empty=False), desc="Move to the group on the left"),
    Key([mod, "shift"], "Period", window_to_next_group(), desc="Move window to the group on the left"),
    Key([mod, "shift"], "Comma", window_to_prev_group(), desc="Move window to the group on the left"),
    Key([mod], "l", lazy.layout.increase_ratio(), desc="Increase master window space"),
    Key([mod], "h", lazy.layout.decrease_ratio(), desc="Decrease master window space"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.

    #Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    #Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    #Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    #Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    #Key([mod, "control"], "l", lazy.window.move_floating(25, 0), desc="toggle max layout"),
    #Key([mod, "control"], "h", lazy.window.move_floating(-25, 0), desc="toggle max layout"),
    #Key([mod, "control"], "k", lazy.window.move_floating(0, -25), desc="toggle max layout"),
    #Key([mod, "control"], "j", lazy.window.move_floating(0, 25), desc="toggle max layout"),

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
    Key([mod], "y", lazy.spawn(run), desc="Launch run prompt"),
    Key([mod], "e", lazy.spawn(screenshot), desc="Take screenshot"),
    Key([mod, "shift"], "e", lazy.spawn(togglecomp), desc="Toggle compositor"),
    Key([mod, "shift"], "w", lazy.spawn(chwallpaper), desc="Change wallpaper"),
    Key([mod], "q", lazy.spawn(browser), desc="Launch browser"),
    Key([mod, "shift", "control"], "l", lazy.spawn(lock), desc="Lock the screen"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "a",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "Space", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "b", lazy.hide_show_bar("top"), desc="Toggle bar"),

    #custom functions
    Key([mod], "m", minimize_all(), desc="Minimize all windows"),
    Key([mod], "n", toggle_max(), desc="toggle max layout"),
    #scratchpads
    Key([mod], "w", lazy.group['scratchpad'].dropdown_toggle('term'), desc="toggle scratchpad"),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )






groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
group_labels = ["󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃", "󰏃",]
#group_labels = ["", "", "", "", "", "", "", "", "",]





#group_layouts = ["monadtall", "monadtall", "tile", "tile", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall"]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            #layout=group_layouts[i].lower(),
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
            "kitty",
            x=0.05,
            y=0.02,
            opacity=1,
            width=0.90,
            height=0.6,
            on_focus_lost_hide=False,),
    ]))




layouts = [
     #layout.Stack(num_stacks=2),
     #layout.Bsp(),
     #layout.Matrix(),
     #layout.MonadWide(),
     #layout.RatioTile(),
     layout.Tile(
        add_after_last = True,
        border_normal = '#363a4f',
        border_focus = '#8aadf4',
        border_width=2,
        margin = 10,
        margin_on_single = True,
        border_on_single = False,
        ratio = 0.5,
        ratio_increment = 0.05, #0.05
        master_lenght = 1,
        expand = True,
        shift_windows = False,
         ),
    layout.Max(
        border_normal = "#363a4f",
        border_focus = "#8aadf4",
        border_width = 0,
        margin = 10,
        only_focused = True,
        ),
    layout.Floating(
        border_normal = "#363a4f",
        border_focus = "#8aadf4",
        border_width = 2,
        fullscreen_border_width = 0,
        max_border_width = 0,
        ),
    #layout.Columns(),
    #layout.MonadTall(),
     #layout.TreeTab(),
     #layout.VerticalTile(),
     #layout.Zoomy(),
]


deco = {
    "decorations": [
        RectDecoration(
            colour="#464d64",
            radius=13,
            clip=True, ###
            filled=True,
            padding_y=5,
            padding_x=0,
            line_colour = '#5b6078',
            line_width = 1,
            )
            ],
        }


widget_defaults = dict(
    font="JetBrainsMono Nerd Font Mono",
    fontsize=18,
    background = '#363a4f',
    opacity = 0,
    foreground = '#cad3f5',
    #padding=3,
    padding=15,
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
                widget.TextBox(" ", padding = 0),
                widget.TextBox(
                    fontsize = 45,
                    padding = 5,
                    text = "󰣇",
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(run)},
                    ),
                widget.TextBox(" ", padding = 0),
                widget.GroupBox(
                    **deco,
                    hide_unused = False,
                    center_aligned = True,
                    disable_drag = True,
                    fontsize = 20,
                    #spacing = 0,
                    padding = 5,
                    rounded = True,
                    active = '#cad3f5',
                    inactive = '#363a4f',
                    #block_highlight_text_color =
                    highlight_method = 'text', #block, line, text
                    highlight_color = '#494d64',
                    this_current_screen_border = '#8aadf4',
                    this_screen_border = '#494d64',
                    use_mouse_wheel = True,
                    ),
                widget.TextBox(" ", padding = 0),
                widget.CurrentLayoutIcon(
                    decorations = [
                        RectDecoration(
                            colour="#464d64",
                            radius=5,
                            filled=True,
                            padding_y=5,
                            padding_x=0)
                            ],
                    scale = 0.5,
                    padding = 5,
                    ),
                widget.Prompt(),
                widget.TextBox(" ", padding = 0),
                widget.WindowName(
                    **deco,
                    format = ' {name}',
                    foreground = '#f4dbd6',
                    empty_group_string=" Desktop",
                    width = bar.CALCULATED,
                    max_chars = 130,
                    parse_text = txtparse,
                    ),
                widget.Spacer(),
                widget.Systray(),
                widget.TextBox(" ", padding = 0),
                widget.CPU(
                    **deco,
                    foreground = '#7dc4e4',
                    format = ' {freq_current}GHz {load_percent}%',
                    ),
                widget.TextBox(" ", padding = 0),
                widget.ThermalSensor(
                    **deco,
                    foreground = '#c6a0f6',
                    format = ' {temp:.1f}{unit}',
                    tag_sensor = "Package id 0",
                    ),
                widget.TextBox(" ", padding = 0),
                widget.Memory(
                    **deco,
                    foreground = '#91d7e3',
                    format = ' {MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}',
                    measure_mem = 'G',
                    measure_swap = 'G',
                    ),
                widget.TextBox(" ", padding = 0),
                widget.Net(
                    **deco,
                    foreground = '#eed49f',
                    #format = '{down:6.2f}{down_suffix:<2}↓↑{up:6.2f}{up_suffix:<2}',
                    format = '{down:3.0f}{down_suffix:<2}↓↑{up:3.0f}{up_suffix:<2}',
                    prefix = 'M',
                    update_intervall = 1,
                    #interface = 'None',
                    ),
                widget.TextBox(" ", padding = 0),
                widget.Clock(
                    **deco,
                    foreground = '#ed8796',
                    format=" %d.%m.%Y",
                    ),
                widget.TextBox(" ", padding = 0),
                widget.Clock(
                    **deco,
                    foreground = '#f5a97f',
                    format = ' %H:%M',
                    ),
                widget.TextBox(" ", padding = 0),
            ],
            36, #36 -- bar height
            #opacity = 0.5,
            #margin = 10,
            margin = [10, 10, 0, 10],
            #border_width=[0, 0, 1, 0],
            border_width=[0, 0, 3, 0],
            border_color="#494d64",
            #border_color="#b7bdf8",
            #border_width = 10,
            #border_color= '#494d64',
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
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

        #custom rules
        Match(wm_class="pavucontrol"),  # ssh-askpass
        Match(wm_class="pcmanfm"),  # ssh-askpass
        Match(wm_class="thunar"),  # ssh-askpass
        Match(wm_class="lxappearance"),  # ssh-askpass
        Match(title="Steam Settings"),  # GPG key password entry
        #Match(title="Friends List"),  # GPG key password entry
    ],
    border_normal = "#363a4f",
    border_focus = "#8aadf4",
    border_width = 2,
    fullscreen_border_width = 0,
    max_border_width = 0,
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

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
