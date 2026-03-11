return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#101417',
				base01 = '#101417',
				base02 = '#959ca1',
				base03 = '#959ca1',
				base04 = '#eff8ff',
				base05 = '#f8fcff',
				base06 = '#f8fcff',
				base07 = '#f8fcff',
				base08 = '#ff9fbc',
				base09 = '#ff9fbc',
				base0A = '#a8d9ff',
				base0B = '#a5ffb0',
				base0C = '#d1ebff',
				base0D = '#a8d9ff',
				base0E = '#b7e0ff',
				base0F = '#b7e0ff',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#959ca1',
				fg = '#f8fcff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#a8d9ff',
				fg = '#101417',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#959ca1' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#d1ebff', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#b7e0ff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#a8d9ff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#a8d9ff',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#d1ebff',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#a5ffb0',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#eff8ff' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#eff8ff' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#959ca1',
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
