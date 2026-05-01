return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#13140d',
				base01 = '#13140d',
				base02 = '#84867c',
				base03 = '#84867c',
				base04 = '#d6d9cc',
				base05 = '#fdfff8',
				base06 = '#fdfff8',
				base07 = '#fdfff8',
				base08 = '#ffad9f',
				base09 = '#ffad9f',
				base0A = '#d1e39a',
				base0B = '#a9f8a1',
				base0C = '#f4ffd3',
				base0D = '#d1e39a',
				base0E = '#eeffbb',
				base0F = '#eeffbb',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#84867c',
				fg = '#fdfff8',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#d1e39a',
				fg = '#13140d',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#84867c' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#f4ffd3', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#eeffbb',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#d1e39a',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#d1e39a',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#f4ffd3',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#a9f8a1',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#d6d9cc' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#d6d9cc' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#84867c',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
