-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
local adzedef
adzedef = {
	description = "Adamin Adze",
	inventory_image = "(nc_lode_tempered.png^[mask:nc_lode_adze.png)^" .. modname .. "_tip_adze.png",
	groups = {
		flammable = 1
	},
	tool_capabilities = nodecore.toolcaps({
			uses = 100.0,
			snappy = 12,
			choppy = 12,
			crumbly = 12,
			cracky = 12,
		}),
	sounds = nodecore.sounds("nc_optics_glassy"),
	tool_wears_to = "nc_woodwork:adze"
}
minetest.register_tool(modname .. ":adze_admin", adzedef)
-- ================================================================== --
nodecore.register_aism({
	label = "adaminze vanish",
	interval = 1,
	chance = 1,
	itemnames = {modname.. ":adze_admin"},
	action = function(stack, data)
		if not data.inv then -- Check if in inventory
			stack:set_name("")
			nodecore.sound_play("nc_api_craft_hiss", {gain = 0.2, pos = data.pos, fade = 0.5})
			return stack
		end
	end
})

