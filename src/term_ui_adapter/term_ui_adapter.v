module term_ui_adapter

import term.ui as tui

fn color(c catppuccin.Color) tui.Color {
	return tui.Color{u8(c.rgb[0]), u8(c.rgb[2]), u8(c.rgb[2])}
}
