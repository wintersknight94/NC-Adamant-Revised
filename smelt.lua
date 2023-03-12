-- LUALOCALS < ---------------------------------------------------------
local ItemStack, minetest, nodecore
    = ItemStack, minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
local crystal = "wc_crystals:adamant"
nodecore.register_craft({
		label = "heat adamant cobble",
		action = "cook",
		touchgroups = {lava = 3},
		neargroups = {coolant = 0},
		duration = 30,
		cookfx = true,
		indexkeys = {"group:adamant_cobble"},
		nodes = {
			{
				match = {groups = {adamant_cobble = true}},
				replace = crystal
			}
		}
	})
------------------------------------------------------------------------
nodecore.register_cook_abm({nodenames = {"group:adamant_cobble"}, neighbors = {"group:lava"}})
nodecore.register_cook_abm({nodenames = {"wc_crystals:adamant"}})
-- ================================================================== --	
nodecore.register_craft({
		label = "pack shiny rocks to cobble",
		action = "pummel",
		indexkeys = {modname .. ":ore"},
		nodes = {
			{
				match = {name = modname .. ":ore", count = 8},
				replace = modname .. ":cobble_loose"
			}
		},
		toolgroups = {thumpy = 4}
	})
------------------------------------------------------------------------
nodecore.register_craft({
		label = "break shiny cobble to rocks",
		action = "pummel",
		indexkeys = {"group:adamant_cobble"},
		nodes = {
			{match = {groups = {adamant_cobble = true}}, replace = "air"}
		},
		items = {
			{name = modname .. ":ore", count = 8, scatter = 5}
		},
		toolgroups = {cracky = 3},
		itemscatter = 5
	})
-- ================================================================== --	

