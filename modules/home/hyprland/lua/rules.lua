--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/configuring/core/rules/

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "float-modal-dialogs",
	match = { modal = true },

	float = true,
	center = true,
})

hl.window_rule({
	name = "picture-in-picture",
	match = { title = "^Picture-in-Picture$" },

	float = true,
	pin = true,
})

-- Layer rules
hl.layer_rule({
	name = "vicinae",
	match = { namespace = "vicinae" },

	blur = true,
	ignore_alpha = 0,
	no_anim = true,
})

hl.layer_rule({
	name = "noctalia-window-switcher",
	match = { namespace = "^noctalia-window-switcher$" },

	no_anim = true,
})
