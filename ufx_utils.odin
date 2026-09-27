package paper_ufx

import gfx "./../paper_gfx"
import input "./../paper_input"


global_ui_state: UI_State

begin :: proc() {
	global_ui_state.mouse_captured = false
}

point_in_rect :: proc(point: [2]f32, rect: gfx.Rect) -> bool {
	return point.x >= rect.x && point.x <= (rect.x + rect.width) && point.y >= rect.y && point.y <= (rect.y + rect.height)
}

is_mouse_over_ui :: proc() -> bool {
	return global_ui_state.mouse_captured
}
