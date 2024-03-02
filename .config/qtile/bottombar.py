
        bottom=bar.Bar(
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
                #widget.TextBox(" ", padding = 0, background = colors["transparent"]),
                widget.WindowName(
                        fontsize           = 15,
                        format             = '   {name}',
                        foreground         = colors["white"],
                        padding            = 5,
                        background         = colors["grey"],
                        empty_group_string = "   Desktop",
                        width              = bar.CALCULATED,
                        max_chars          = 30, # 130
                        parse_text         = txtparse,
                        ),
                widget.TextBox(
                    #**endofbar,
                    padding    =  0,
                    fontsize   = 32, # 50 for slash, 28 for rounded edge
                    foreground =   colors["grey"],
                    background = colors["transparent"],
                    text = "", #   
                    ),
                    widget.TextBox(" ", padding = 0, background = colors["transparent"]),
                    widget.WindowCount(
                        fontsize   = 15,
                        padding    = 5,
                        #background = colors["grey"],
                        background = colors["transparent"],
                        ),
                    widget.TextBox(" ", padding = 0, background = colors["transparent"]),
                    widget.TaskList(
                        #**deco,
                        foreground           = colors["skin_light"], #f4dbd6
                        border               = colors["grey_light"], #464d64
                        #border               = colors["transparent"], #464d64
                        background           = colors["transparent"], #464d64
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

                ##########
                # Center #
                ##########

                    widget.Spacer(background = "#00000000"),




                #########
                # Right #
                #########

                widget.TextBox(
                    #**endofbar,
                    padding    =  0,
                    fontsize   = 32, # 50 for slash, 28 for rounded edge
                    foreground =   colors["grey"],
                    text       = "", #   
                    background = colors["transparent"],
                    ),
                widget.Systray(),
                widget.Bluetooth(
                    adapter_format       = '{name}',
                    default_text         = ' {connected_devices}',
                    symbol_connected     = '*',
                    symbol_paired        = '-',
                    symbol_powered       = ('*', '-'),
                    symbol_unknown       = '?',
                    separator            = ', ',
                    show_menu_icons      = True,
                    hide_unnamed_devices = False,
                        ),
                widget.TextBox(
                    #**endofbar,
                    text       = "", #     
                    padding    =  0,
                    fontsize   = 32, # 50 for slash, 28 for rounded edge -- 32
                    foreground = colors["grey"],
                    background = colors["transparent"],
                    ),






                 ],
                36, # 20
                #margin       = [5, 5, 0, 5],
                #margin     = 5,
                #background = colors["transparent"], #00000000
                margin       = [0, 5, 5, 5],
                background   = colors["transparent"], #00000000
                reserve      = True,
                ),
