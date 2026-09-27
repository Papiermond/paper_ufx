package paper_ufx

import gfx "./../paper_gfx"
import input "./../paper_input"

panel :: proc(rect: gfx.Rect, background_color: gfx.Color, border_color: gfx.Color = {0, 0, 0, 0}, border_width: f32 = 0.0) {
	mouse_pos := input.get_mouse_position()
	if point_in_rect(mouse_pos, rect) {
		global_ui_state.mouse_captured = true
	}

	gfx.draw_rect(rect, background_color)
	if border_width > 0.0 && border_color.a > 0 {
		gfx.draw_rect_lines(rect, border_width, border_color)
	}
}

button :: proc(rect: gfx.Rect, text: string, text_scale: f32 = 2.0, style: Button_Style = DEFAULT_BUTTON_STYLE) -> bool {
	mouse_pos := input.get_mouse_position()
	is_hovered := point_in_rect(mouse_pos, rect)

	bg_color := style.bg_color
	if is_hovered {
		global_ui_state.mouse_captured = true
		bg_color = style.hover_color
	}

	gfx.draw_rect(rect, bg_color)
	if style.border_width > 0.0 {
		gfx.draw_rect_lines(rect, style.border_width, style.border_color)
	}

	if len(text) > 0 {
		text_size := gfx.measure_text(text, text_scale)
		text_x := rect.x + (rect.width - text_size.x) / 2.0
		text_y := rect.y + (rect.height - text_size.y) / 2.0
		gfx.draw_text(text, text_x, text_y, text_scale, style.text_color)
	}
	return is_hovered && input.is_mouse_button_pressed(.LEFT)
}

label :: proc(pos: [2]f32, text: string, scale: f32 = 2.0, color: gfx.Color = gfx.WHITE) {
	gfx.draw_text(text, pos.x, pos.y, scale, color)
}
