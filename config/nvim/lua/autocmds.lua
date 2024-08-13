
-- autocmds






-- Define a Lua function to create the scratch buffer, execute the shell command, and set the keymap
function create_scratch_buffer(command)
    -- Create a new scratch buffer
    vim.cmd"new"
    -- vim.cmd"sp new"  -- vsp for vert split
    vim.cmd"setlocal buftype=nofile bufhidden=hide noswapfile"

    -- Execute the shell command and capture its output in the buffer
    -- vim.cmd("r !" .. command)
    vim.cmd("%!" .. command)

    -- Get the buffer number of the current (scratch) buffer
    local bufnr = vim.api.nvim_get_current_buf()

    -- Set the 'q' key to exit the buffer in the scratch buffer
    vim.api.nvim_buf_set_keymap(bufnr, "n", "q", ":q!<CR>", { noremap = true, silent = true })
end

-- Set keymap for scratch buffer
vim.keymap.set("n", "<C-z>", function()
    local input = vim.fn.input("Command: ")
    if input == "" then return end
    create_scratch_buffer(input)
end)

-- Create a user command 'R' to execute your Lua function, passing along any arguments
vim.api.nvim_create_user_command(
  "R",
  "lua create_scratch_buffer(<q-args>)",
  { bang = false, nargs = "*", complete = "shellcmd" }
)




--Open Buildin terminal vertical mode
vim.api.nvim_create_user_command("VT", 'vsplit | terminal bash -c "cd %:p:h;zsh"', { bang = false, nargs = "*" })

--Open Buildin terminal
vim.api.nvim_create_user_command(
  "T",
  'split | resize 15 | terminal bash -c "cd %:p:h;zsh"',
  { bang = true, nargs = "*" }
)








-- Auto f-strings in Python
-- Treesitter automatic Python format strings
-- Automatically puts an `f` before your string if you type `{`
vim.api.nvim_create_augroup("py-fstring", { clear = true })
vim.api.nvim_create_autocmd("InsertCharPre", {
    pattern = { "*.py" },
    group = "py-fstring",
    callback = function(opts)
        -- Only run if f-string escape character is typed
        if vim.v.char ~= "{" then return end

        -- Get node and return early if not in a string
        local node = vim.treesitter.get_node()

        if not node then return end
        if node:type() ~= "string" then node = node:parent() end
        if not node or node:type() ~= "string" then return end

        vim.print(node:type())
        local row, col, _, _ = vim.treesitter.get_node_range(node)

        -- Return early if string is already a format string
        local first_char = vim.api.nvim_buf_get_text(opts.buf, row, col, row, col + 1, {})[1]
        vim.print("row " .. row .. " col " .. col)
        vim.print("char: '" .. first_char .. "'")
        if first_char == "f" then return end

        -- Otherwise, make the string a format string
        vim.api.nvim_input("<Esc>m'" .. row + 1 .. "gg" .. col + 1 .. "|if<Esc>`'la")
    end,
})





-- Disable line numbers when in terminal mode
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")




--
vim.api.nvim_create_augroup('bufcheck', {clear = true})

-- start terminal in insert mode (terminal mode)
vim.api.nvim_create_autocmd('TermOpen',     {
    group    = 'bufcheck',
    pattern  = '*',
        command  = 'startinsert | set winfixheight'})





local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end






-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})






-- Goto qf location without switching windows
-- outline.nvim like behaviour
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("quickfixpreview"),
    pattern = { "qf" },
    callback = function(event)
        vim.keymap.set("n", "o",      "<CR><C-w>p", { buffer = event.buf, silent = true })
        vim.keymap.set("n", "<C-j>", "j<CR><C-w>p", { buffer = event.buf, silent = true })
        vim.keymap.set("n", "<C-k>", "k<CR><C-w>p", { buffer = event.buf, silent = true })
        -- print(vim.inspect(event))
    end,
})



-- Oil.nvim auto cd
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("oilautocd"),
    pattern = { "oil" },
    callback = function(event)

        local oil = require("oil")


        local function enter()

            -- local bufnr = vim.api.nvim_get_current_buf()
            -- local dir = oil.get_current_dir(bufnr)
            local current = oil.get_cursor_entry()

            if current == nil then return end  -- No files in dir

            if current.type == "directory" then
                vim.cmd(string.format("cd %s", current.name))
            end

            oil.select()

        end


        local function back_up()

            vim.cmd"cd .."
            oil.open()

        end


        vim.keymap.set("n", "<CR>", enter, { buffer = event.buf, silent = true })
        vim.keymap.set("n", "-", back_up,  { buffer = event.buf, silent = true })

        -- vim.keymap.set("n", "l", enter,    { buffer = event.buf, silent = true })
        -- vim.keymap.set("n", "h", back_up,  { buffer = event.buf, silent = true })



        -- print(vim.inspect(event))

    end,
})








-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "vim",  -- C-f in cmd mode
    "oil",
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })

        if ( vim.bo.filetype == "oil" ) then
            -- vim.keymap.set("n", "q", "<cmd>bd<cr>", { buffer = event.buf, silent = true })
            vim.keymap.set("n", "q", function() require("oil").close() end, { buffer = event.buf, silent = true })
        end

        if ( vim.bo.filetype == "help" ) then
            vim.keymap.set("n", "<CR>", "<C-]>")
        end


  end,
})







-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})



-- save all unsaves changes in all buffers when unfocusing the window
-- autocmd('FocusLost', { pattern = '*', command = 'silent! wa' })






-- vim.api.nvim_create_augroup("alpha", { clear = true })
--
-- vim.g.alpha_launched = false
--
-- vim.api.nvim_create_autocmd(
--     "BufNew",
--     {
--         pattern = "",
--         group = "alpha",
--         callback = function()
--
--             if true then return end
--
--
--             if vim.g.alpha_launched then return end
--
--
--             local filetype = vim.bo.filetype
--             print(filetype)
--
--             if filetype == "alpha" then
--                 vim.g.alpha_launched = true
--             end
--
--
--         end,
--     }
-- )









-- vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
--
-- vim.api.nvim_create_autocmd(
--     "BufDelete",
--     {
--         pattern = "",
--         group = "alpha_on_empty",
--         callback = function()
--
--             if true then return end
--
--
--             -- Only run this if alpha has been initialized
--             if not vim.g.alpha_launched then return end
--
--
--             local buffers = vim.api.nvim_list_bufs()
--             local actual = {}
--
--             -- Filter out nofile buffers created by plugins
--             for i=1, #buffers, 1 do
--                 local current = buffers[i]
--                 local buftype = vim.bo[current].buftype
--
--                 if buftype ~= "nofile" then table.insert(actual, current) end
--             end
--
--             -- Return if theres more than 1 buffer
--             if #actual ~= 1 then return end
--
--
--
--             -- Get name of last buffer
--             local last_buf = actual[1]
--             local bufname = vim.api.nvim_buf_get_name(last_buf)
--
--
--             -- Alpha deletes nvim vanilla splashscreen at startup
--
--
--             -- Open Alpha if name is empty
--             if bufname == "" then
--                 print"last buffer!"
--                 vim.cmd"Alpha"
--             end
--
--         end,
--     }
-- )



-- TODO: THIS!
-- vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
-- vim.api.nvim_create_autocmd(
--     "BufAdd",
--     {
--         pattern = "*",
--         group = "alpha_on_empty",
--         callback = function(args)
--
--             local buffers = vim.api.nvim_list_bufs()
--             local actual = {}
--
--
--
--             -- Filter out nofile buffers created by plugins
--             for i=1, #buffers, 1 do
--                 local current = buffers[i]
--                 local buftype = vim.bo[current].buftype
--
--                 if buftype ~= "nofile" then table.insert(actual, current) end
--             end
--
--
--             -- Return if theres more than 1 buffer
--             if #actual ~= 1 then return end
--
--             -- Get name of last buffer
--             local last_buf = actual[1]
--             local bufname = vim.api.nvim_buf_get_name(last_buf)
--             local buftype = vim.bo[last_buf].buftype
--             local filetype = vim.bo[last_buf].filetype
--
--             if bufname ~= "" then return end
--             if buftype ~= "" then return end
--             if filetype ~= "" then return end
--
--
--             vim.cmd("Alpha")
--
--
--         end
--     }
-- )




-- vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })


-- vim.api.nvim_create_autocmd(
--     "BufAdd",
--     {
--       pattern = "*",
--       group = "alpha_on_empty",
--       callback = function(args)
--         local api = vim.api
--         local bufnr = args.buf
--         local bufname = api.nvim_buf_get_name(bufnr)
--         local bufmodified = api.nvim_buf_get_option(bufnr, "modified")
--         local buftype = api.nvim_buf_get_option(bufnr, "buftype")
--         local ft = api.nvim_buf_get_option(bufnr, "ft")
--
--         if ft == "" and bufname == "" and buftype == "" and not bufmodified then
--           local normal_buffers = vim.tbl_filter(function(buf)
--             return api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == ""
--           end, api.nvim_list_bufs())
--
--           if #normal_buffers == 1 then
--             vim.schedule(function()
--               vim.cmd("Alpha")
--               vim.cmd("bd " .. bufnr)
--             end)
--           end
--         end
--       end,
--     }
-- )



