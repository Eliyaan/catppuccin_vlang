module main

import catppuccin
import catppuccin.term_ui_adapter as cat_tui
import term.ui as tui

struct App {
mut:
	tui  &tui.Context       = unsafe { nil }
	flav catppuccin.Flavour = catppuccin.new_mocha()
}

fn event(e &tui.Event, x voidptr) {
	if e.typ == .key_down && e.code == .escape {
		exit(0)
	}
}

fn frame(x voidptr) {
	mut app := unsafe { &App(x) }

	app.tui.clear()
	app.tui.set_bg_color(cat_tui.color(app.flav.peach()))
	app.tui.set_color(cat_tui.color(app.flav.lavender()))
	app.tui.draw_text(0, 0, 'Peach')

	app.tui.reset()
	app.tui.flush()
}

fn main() {
	mut app := &App{}
	app.tui = tui.init(
		user_data: app
		event_fn: event
		frame_fn: frame
		hide_cursor: true
	)
	app.tui.run()!
}
