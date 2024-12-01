    return {
        "goolord/alpha-nvim",
        enabled = true,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            --require("alpha").setup(require("alpha.themes.startify").config)
            --require'alpha'.setup(require'alpha.themes.dashboard'.config)

            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")



            local theme = {}


            -- https://patorjk.com/software/taag/#p=display&v=0&f=ANSI%20Shadow&t=NEOVIM
            theme.neovim_based = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
                -- "                                                     ",
            }



            theme.hydra = {
                "                                   ",
                "                                   ",
                "                                   ",
                "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
                "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
                "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
                "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
                "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
                "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
                "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
                " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
                " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
                "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
                "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
                "                                   ",
                "                                   ",
            }
                -- "            n e o v i m            ",

            theme.planet = {
                [[                                                ]],
                [[                                          _.oo. ]],
                [[                  _.u[[/;:,.         .odMMMMMM' ]],
                [[               .o888UU[[[/;:-.  .o@P^    MMM^   ]],
                [[              oN88888UU[[[/;::-.        dP^     ]],
                [[             dNMMNN888UU[[[/;:--.   .o@P^       ]],
                [[            ,MMMMMMN888UU[[/;::-. o@^           ]],
                [[            NNMMMNN888UU[[[/~.o@P^              ]],
                [[            888888888UU[[[/o@^-..               ]],
                [[           oI8888UU[[[/o@P^:--..                ]],
                [[        .@^  YUU[[[/o@^;::---..                 ]],
                [[      oMP     ^/o@P^;:::---..                   ]],
                [[   .dMMM    .o@^ ^;::---...                     ]],
                [[  dMMMMMMM@^`       `^^^^                       ]],
                [[ YMMMUP^                                        ]],
                [[  ^^                                            ]],
                [[                                                ]],
            }









            theme.doom = {
                [[                                                                                ]],
                [[ =================     ===============     ===============   ========  ======== ]],
                [[ \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . // ]],
                [[ ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .|| ]],
                [[ || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || ]],
                [[ ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| ]],
                [[ || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ]],
                [[ ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .|| ]],
                [[ || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ]],
                [[ ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.|| ]],
                [[ ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `|| ]],
                [[ ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   || ]],
                [[ ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   || ]],
                [[ ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   || ]],
                [[ ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   || ]],
                [[ ||   .=='    _-'          `-__\._-'         `-_./__-'         `' |. /|  |   || ]],
                [[ ||.=='    _-'                                                     `' |  /==.|| ]],
                [[ =='    _-'                                                            \/   `== ]],
                [[ \   _-'                                                                `-_   / ]],
                [[  `''                                                                      ``'  ]],
                [[                                                                                ]],
            }








            theme.morse = {
                [[                     ]],
                [[ -. . --- ...- .. -- ]],
                [[                     ]],
            }


            -- dashboard.section.header.val = theme.neovim
            -- dashboard.section.header.val = theme.neovim_based
            dashboard.section.header.val = theme.hydra






            -- Keyword, Identifier, String, Number, Constant, Comment
            dashboard.section.header.opts.hl = "Number" -- Number, Comment


            -- local function footer()
            --     --local total_plugins = #vim.tbl_keys(packer_plugins)
            --     --return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
            --     return datetime .. nvim_version_info
            -- end


         footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            -- local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
            local datetime = os.date(" %d-%m-%Y  |   %H:%M:%S")
            local version = vim.version()
            local nvim_version_info = " v" .. version.major .. "." .. version.minor .. "." .. version.patch

            -- return { datetime .. "  |  " .. nvim_version_info ..  "  |  " .. " " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
            return { nvim_version_info ..  "  |  " .. " " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }



          end



            dashboard.section.footer.val = footer
            dashboard.section.footer.opts.hl = "Identifier"



      --[[ { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },



            { ale",       icon = " ", key = "f" },
            { a        icon = " ", key = "n" },
            { aes",    icon = " ", key = "r" },
            { a,       icon = " ", key = "g" },
            { a ", key = "c" },
            { assion", icon = " ", key = "s" }, restore session


      ]]






            dashboard.section.buttons.val = {
                -- dashboard.button( "<leader>ff", "󰈞 [ ] Find File", "<cmd>Telescope find_files<CR>"),
                -- dashboard.button( "<leader>fo", " [ ] Recent Files"   , "<cmd>Telescope oldfiles<CR>"),
                -- dashboard.button( "<leader>fg", "󰈭 [ ] Find Word"   , "<cmd>Telescope live_grep<CR>"),
                -- dashboard.button( "<leader>ft", " [ ] Theme", "<cmd>Telescope colorscheme<CR>"),
                --dashboard.button( "k", " [ ] Mappings", "<cmd>Telescope keymaps<CR>"),
                -- dashboard.button( "b", " [ ] Bookmarks", "<cmd>Telescope marks<CR>"),
                -- dashboard.button( "p", "󰒲 [ ] Lazy", "<cmd>Lazy<CR>"),
                -- dashboard.button( "m", " [ ] Mason", "<cmd>Mason<CR>"),
                dashboard.button( "e", "  New Buffer" , "<cmd>ene<CR>"),
                dashboard.button( "c", "  Config" , "<cmd>cd ~/.config/nvim<CR>"),
                dashboard.button( "q", "  Quit", "<cmd>qa<CR>"), -- 󰅚
            }




            alpha.setup(dashboard.opts)
            vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])



        end,
    }
