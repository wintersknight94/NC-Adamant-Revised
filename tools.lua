-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------

local modname = minetest.get_current_modname()

-- ================================================================== --

local function tooltip(name, group)
	local tool = modname .. ":tool_" .. name:lower()
	local wood = "nc_woodwork:tool_" .. name:lower()
	minetest.register_tool(tool, {
			description = "Adamantine-Tipped " .. name,
			inventory_image = "nc_woodwork_tool_" .. name:lower() .. ".png^"
			.. modname .. "_tip_" .. name:lower() .. ".png",
			tool_wears_to = wood,
			groups = {
				flammable = 2,
				crystalline = 1
			},
			tool_capabilities = nodecore.toolcaps({
					uses = 0.5,
					[group] = 7
				}),
			on_ignite = modname .. ":ore",
			sounds = nodecore.sounds("nc_optics_glassy")
		})
	nodecore.register_craft({
			label = "assemble " .. tool,
			action = "stackapply",
			wield = {name = modname .. ":ore"},
			consumewield = 1,
			indexkeys = {wood},
			nodes = {{match = wood, replace = "air"}},
			items = {tool}
		})
end

tooltip("Mallet", "thumpy")
tooltip("Spade", "crumbly")
tooltip("Hatchet", "choppy")
tooltip("Pick", "cracky")

-- ================================================================== --

local adzedef
adzedef = {
	description = "Adamantine-Tipped Adze",
	inventory_image = "nc_woodwork_adze.png^" .. modname .. "_tip_adze.png",
	groups = {
		flammable = 2,
		crystalline = 1,
	},
	tool_capabilities = nodecore.toolcaps({
			uses = 0.5,
			choppy = 6,
			crumbly = 6,
			cracky = 2,
		}),
	on_ignite = modname .. ":ore",
	sounds = nodecore.sounds("nc_optics_glassy"),
	tool_wears_to = "nc_woodwork:adze"
}
minetest.register_tool(modname .. ":adze", adzedef)

nodecore.register_craft({
		label = "assemble adamant adze",
		action = "stackapply",
		wield = {name = modname .. ":ore"},
		consumewield = 1,
		indexkeys = {"nc_woodwork:adze"},
		nodes = {
			{
				match = {
					name = "nc_woodwork:adze",
					wear = 0.05
				},
				replace = "air"
			},
		},
		items = {
			{name = modname .. ":adze"}
		},
	})
-- ================================================================== --
minetest.override_item("wc_crystals:adze_adamant",{
	light_source = 1, glow = 1
})
------------------------------------------------------------------------
minetest.override_item("wc_crystals:mace_adamant",{
	light_source = 1, glow = 1
})
------------------------------------------------------------------------
minetest.override_item("wc_crystals:tool_pick_adamant",{
	light_source = 1, glow = 1
})
------------------------------------------------------------------------
minetest.override_item("wc_crystals:tool_spade_adamant",{
	light_source = 1, glow = 1
})
------------------------------------------------------------------------
minetest.override_item("wc_crystals:tool_hatchet_adamant",{
	light_source = 1, glow = 1
})
------------------------------------------------------------------------
minetest.override_item("wc_crystals:tool_mallet_adamant",{
	light_source = 1, glow = 1
})
------------------------------------------------------------------------
