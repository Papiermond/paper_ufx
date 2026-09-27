package paper_ufx

import gfx "./../paper_gfx"

Button_Style :: struct {
	bg_color:     gfx.Color,
	hover_color:  gfx.Color,
	text_color:   gfx.Color,
	border_color: gfx.Color,
	border_width: f32,
}

DEFAULT_BUTTON_STYLE :: Button_Style {
	bg_color     = gfx.Color{45, 55, 70, 255},
	hover_color  = gfx.Color{65, 80, 105, 255},
	text_color   = gfx.WHITE,
	border_color = gfx.WHITE,
	border_width = 1.5,
}

UI_State :: struct {
	mouse_captured: bool,
}
