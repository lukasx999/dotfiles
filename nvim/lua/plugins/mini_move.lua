return {
    'echasnovski/mini.move',
    version = '*',
    config = function()
        require('mini.move').setup {

            mappings = {
                -- Move visual selection in Visual mode
                left  = 'H',
                right = 'L',
                down  = 'J',
                up    = 'K',

                -- Move current line in Normal mode
                line_left  = '',
                line_right = '',
                line_down  = '',
                line_up    = '',

            }

        }

    end
}
