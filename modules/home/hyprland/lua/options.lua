------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({
	output = "",
	mode = "1920x1080@180",
	position = "auto",
	scale = "1",
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		-- kb_variant = "colemak",
		kb_options = "grp:alt_shift_toggle",

		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		accel_profile = "flat",

		touchpad = {
			natural_scroll = true,
		},
	},
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/configuring/core/config-options/
hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 5,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.9,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			-- color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 5,
			passes = 3,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

hl.config({
	-- See https://wiki.hypr.land/configuring/layouts/dwindle-layout/ for more
	dwindle = {
		preserve_split = true, -- You probably want this
	},

	-- See https://wiki.hypr.land/configuring/layouts/master-layout/ for more
	master = {
		new_status = "master",
	},

	-- See https://wiki.hypr.land/configuring/layouts/scrolling-layout/ for more
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		vrr = 2,
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,

		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		disable_splash_rendering = true,
	},
})

-- Noctalia
local success, noctalia = pcall(require, "noctalia")
if success and noctalia.apply_theme then
	noctalia.apply_theme()
end
