return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#17130b',
				base01 = '#17130b',
				base02 = '#96928a',
				base03 = '#96928a',
				base04 = '#f2ede3',
				base05 = '#fffcf8',
				base06 = '#fffcf8',
				base07 = '#fffcf8',
				base08 = '#ffa199',
				base09 = '#ffa199',
				base0A = '#fedb8b',
				base0B = '#aeff9f',
				base0C = '#ffecc1',
				base0D = '#fedb8b',
				base0E = '#ffe29f',
				base0F = '#ffe29f',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#96928a',
				fg = '#fffcf8',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#fedb8b',
				fg = '#17130b',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#96928a' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffecc1', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#ffe29f',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#fedb8b',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#fedb8b',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#ffecc1',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#aeff9f',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#f2ede3' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#f2ede3' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#96928a',
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
